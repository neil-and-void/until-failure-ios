//
//  WorkoutLoggerAPIService.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-21.
//

import SwiftUI
import Apollo

protocol WorkoutLoggerAPIServiceProtocol {
    func getWorkoutRoutines(withNetwork: Bool, completion: @escaping (Result<[WorkoutRoutineFull], APIError>) -> Void)
    func getWorkoutRoutine(withNetwork: Bool, workoutRoutineId: String, completion: @escaping (Result<WorkoutRoutine, APIError>) -> Void)
    func getWorkoutSessions(withNetwork: Bool, completion: @escaping (Result<[WorkoutSession], APIError>) -> Void)
    func createWorkoutRoutine(name: String, completion: @escaping (Result<CreateWorkoutRoutineMutation.Data.CreateWorkoutRoutine, APIError>) -> Void)
    func updateWorkoutRoutine(_ workoutRoutine: WorkoutRoutine, completion: @escaping (Result<WorkoutRoutineFull, APIError>) -> Void)
    func deleteWorkoutRoutine(id: String, completion: @escaping (Result<String, APIError>) -> Void)
    func addWorkoutSession(id: String, start: String, completion: @escaping(Result<String, APIError>) -> Void)
    func getWorkoutSession(workoutRoutineId: String, workoutSessionId: String, completion: @escaping (Result<WorkoutSession, APIError>) -> Void)
    func getExerciseRoutines(workoutRoutineId: String, withNetwork: Bool, completion: @escaping (Result<[ExerciseRoutine], APIError>) -> Void)
}
extension WorkoutLoggerAPIServiceProtocol {
    func getWorkoutRoutine(withNetwork: Bool = false, workoutRoutineId: String, completion: @escaping (Result<WorkoutRoutine, APIError>) -> Void) {
        return getWorkoutRoutine(withNetwork: withNetwork, workoutRoutineId: workoutRoutineId, completion: completion)
    }
    func getWorkoutRoutines(withNetwork: Bool = false, completion: @escaping (Result<[WorkoutRoutineFull], APIError>) -> Void) {
        return getWorkoutRoutines(withNetwork: withNetwork, completion: completion)
    }
    func getWorkoutSessions(withNetwork: Bool = false, completion: @escaping (Result<[WorkoutSession], APIError>) -> Void) {
        return getWorkoutSessions(withNetwork: withNetwork, completion: completion)
    }
    func getExerciseRoutines(workoutRoutineId: String, withNetwork: Bool = false, completion: @escaping (Result<[ExerciseRoutine], APIError>) -> Void) {
        return getExerciseRoutines(workoutRoutineId: workoutRoutineId, withNetwork: withNetwork, completion: completion)
    }
}

class WorkoutLoggerAPIService: WorkoutLoggerAPIServiceProtocol {
    private var client: ApolloClient
    private var parser: WorkoutSessionParserProtocol
    
    init(client: ApolloClient = WorkoutLoggerAPIClient.client) {
        self.client = client
        self.parser = Parser()
    }
    
    func getWorkoutRoutine(withNetwork: Bool = false, workoutRoutineId: String, completion: @escaping (Result<WorkoutRoutine, APIError>) -> Void) {
        var cachePolicy: CachePolicy = .returnCacheDataElseFetch
        if withNetwork {
            cachePolicy = .fetchIgnoringCacheData
        }
        self.client.fetch(query: WorkoutRoutineQuery(workoutRoutineId: workoutRoutineId), cachePolicy: cachePolicy) { result in
            switch result {
            case .success(let response):
                if let errors = response.errors {
                    let error = APIError.GraphQLError(gqlError: errors[0].message)
                    completion(.failure(error))
                    return
                }
                
                if let data = response.data {
                    let exerciseRoutines = data.workoutRoutine.exerciseRoutines.map { exerciseRoutine in
                        ExerciseRoutine(
                            id: exerciseRoutine.id,
                            name: exerciseRoutine.name,
                            sets: exerciseRoutine.sets,
                            reps: exerciseRoutine.reps
                        )
                    }
                    let workoutRoutine = WorkoutRoutine(
                        id: data.workoutRoutine.id,
                        name: data.workoutRoutine.name,
                        exerciseRoutines: exerciseRoutines
                    )
                    completion(.success(workoutRoutine))
                }
                completion(.failure(APIError.unknown))
                
            case .failure:
                completion(.failure(APIError.networkError))
                
            }
        }
    }
    
    func getWorkoutRoutines(withNetwork: Bool = false, completion: @escaping (Result<[WorkoutRoutineFull], APIError>) -> Void) {
        var cachePolicy: CachePolicy = .returnCacheDataElseFetch
        if withNetwork {
            cachePolicy = .fetchIgnoringCacheData
        }
        self.client.fetch(query: WorkoutRoutinesQuery(), cachePolicy: cachePolicy) { result in
            switch result {
            case .success(let response):
                if let errors = response.errors {
                    let error = APIError.GraphQLError(gqlError: errors[0].message)
                    completion(Result.failure(error))
                    return
                }
                
                let workoutRoutinesFull: [WorkoutRoutineFull] = response.data?.workoutRoutines.compactMap { $0.fragments.workoutRoutineFull } ?? []
                completion(Result.success(workoutRoutinesFull))
                
            case .failure:
                completion(Result.failure(APIError.networkError))
                
            }
        }
    }
    
    func getWorkoutSessions(withNetwork: Bool = false, completion: @escaping (Result<[WorkoutSession], APIError>) -> Void) {
        var cachePolicy: CachePolicy = .returnCacheDataElseFetch
        if withNetwork {
            cachePolicy = .fetchIgnoringCacheData
        }
        self.client.fetch(query: WorkoutSessionsQuery(), cachePolicy: cachePolicy) { result in
            switch result {
            case .success(let response):
                if let errors = response.errors {
                    let error = APIError.GraphQLError(gqlError: errors[0].message)
                    completion(Result.failure(error))
                    return
                }
                
                if let workoutSessions = response.data?.workoutSessions,
                   let workoutRoutines = response.data?.workoutRoutines {
                    let parsedWorkoutSessions = self.parser.parseGraphQL(
                        workoutSessions: workoutSessions,
                        workoutRoutines: workoutRoutines
                    )
                    completion(Result.success(parsedWorkoutSessions))
                    return
                    
                }
                completion(Result.failure(APIError.parsingError))
                
            case .failure:
                completion(Result.failure(APIError.networkError))
                
            }
        }
    }
    
    func createWorkoutRoutine(name: String, completion: @escaping (Result<CreateWorkoutRoutineMutation.Data.CreateWorkoutRoutine, APIError>) -> Void) {
        self.client.perform(mutation: CreateWorkoutRoutineMutation(routine: WorkoutRoutineInput(name: name, exerciseRoutines: []))) { result in
            switch result {
            case .success(let response):
                if let errors = response.errors {
                    let error = APIError.GraphQLError(gqlError: errors[0].message)
                    completion(Result.failure(error))
                    return
                }
                if let workoutRoutine = response.data?.createWorkoutRoutine {
                    completion(Result.success(workoutRoutine))
                } else {
                    completion(Result.failure(APIError.GraphQLError(gqlError: nil)))
                }
            case .failure:
                completion(Result.failure(APIError.networkError))
            }
        }
    }
    
    func updateWorkoutRoutine(_ workoutRoutine: WorkoutRoutine, completion: @escaping (Result<WorkoutRoutineFull, APIError>) -> Void) {
        let parsedWorkoutRoutine = self.parser.parseWorkoutRoutine(workoutRoutine)
        
        self.client.perform(mutation: UpdateWorkoutRoutineMutation(workoutRoutine: parsedWorkoutRoutine)) { result in
            switch result {
            case .success(let response):
                if let errors = response.errors {
                    let error = APIError.GraphQLError(gqlError: errors[0].message)
                    completion(Result.failure(error))
                    return
                }
                if let updatedWorkoutRoutine = response.data?.updateWorkoutRoutine.fragments.workoutRoutineFull {
                    completion(Result.success(updatedWorkoutRoutine))
                }
            case .failure:
                completion(Result.failure(APIError.networkError))
                
            }
        }
    }
    
    func deleteWorkoutRoutine(id: String, completion: @escaping (Result<String, APIError>) -> Void) {
        self.client.perform(mutation: DeleteWorkoutRoutineMutation(workoutRoutineId: id)) { result in
            switch result {
            case .success(let response):
                print(response.data as Any)
                if let errors = response.errors {
                    let error = APIError.GraphQLError(gqlError: errors[0].message)
                    completion(Result.failure(error))
                    return
                }
                //                completion(Result.success(response.data))
            case .failure:
                completion(Result.failure(APIError.networkError))
            }
        }
    }
    
    func addWorkoutSession(id: String, start: String, completion: @escaping (Result<String, APIError>) -> Void) {
        let workoutSession = WorkoutSessionInput(workoutRoutineId: id, start: start, exercises: [])
        self.client.perform(mutation: AddWorkoutSessionMutation(workout: workoutSession)) { result in
            switch result {
            case .success(let response):
                if let errors = response.errors {
                    let error = APIError.GraphQLError(gqlError: errors[0].message)
                    completion(Result.failure(error))
                    return
                }
                if let newWorkoutSessionId = response.data?.addWorkoutSession {
                    completion(Result.success(newWorkoutSessionId))
                }
                completion(Result.failure(APIError.unknown))
            case .failure:
                completion(Result.failure(APIError.networkError))
            }
        }
    }
    
    func getWorkoutSession(
        workoutRoutineId: String,
        workoutSessionId: String,
        completion: @escaping (Result<WorkoutSession, APIError>) -> Void
    ) {
        self.client.fetch(query: WorkoutSessionQuery(workoutRoutineId: workoutRoutineId, workoutSessionId: workoutSessionId)) { result in
            switch result {
            case .success(let response):
                if let errors = response.errors {
                    let error = APIError.GraphQLError(gqlError: errors[0].message)
                    completion(Result.failure(error))
                    return
                }
                if let workoutSession = response.data?.workoutSession,
                   let workoutRoutine = response.data?.workoutRoutine {
                    let parsedWorkoutSession = self.parser.parseGraphQL(
                        workoutSession: workoutSession.fragments.workoutSessionFull,
                        workoutRoutine: workoutRoutine.fragments.workoutRoutineFull
                    )
                    completion(Result.success(parsedWorkoutSession))
                    return
                }
                completion(Result.failure(APIError.unknown))
            case .failure:
                completion(Result.failure(APIError.networkError))
            }
        }
    }
    
    func getExerciseRoutines(workoutRoutineId: String, withNetwork: Bool = false, completion: @escaping (Result<[ExerciseRoutine], APIError>) -> Void) {
        self.client.fetch(query: ExerciseRoutinesQuery(workoutRoutineId: workoutRoutineId)) { result in
            switch result {
            case .success(let response):
                
                if let errors = response.errors {
                    let error = APIError.GraphQLError(gqlError: errors[0].message)
                    completion(Result.failure(error))
                    return
                }
                
                let exerciseRoutines = response.data?.exerciseRoutines.compactMap { exerciseRoutine in
                    let exerciseRoutineFull = exerciseRoutine.fragments.exerciseRoutineFull
                    return ExerciseRoutine(
                        id: exerciseRoutineFull.id,
                        name: exerciseRoutineFull.name,
                        sets: exerciseRoutineFull.sets,
                        reps: exerciseRoutineFull.reps
                    )
                }
                
                if let exerciseRoutines {
                    completion(Result.success(exerciseRoutines))
                }
                
                completion(Result.failure(APIError.unknown))
                
            case .failure:
                completion(Result.failure(APIError.networkError))
            }
        }
    }
}

