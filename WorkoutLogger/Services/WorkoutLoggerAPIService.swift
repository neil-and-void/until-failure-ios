//
//  WorkoutLoggerAPIService.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-21.
//

import SwiftUI
import Apollo

protocol WorkoutLoggerAPIServiceProtocol {
    func getWorkoutRoutines(limit: Int, after: String, withNetwork: Bool, completion: @escaping (Result<[WorkoutRoutineFull], APIError>) -> Void)
    func getWorkoutRoutine(withNetwork: Bool, workoutRoutineId: String, completion: @escaping (Result<WorkoutRoutine, APIError>) -> Void)
    func getWorkoutSessions(limit: Int, after: String, withNetwork: Bool, completion: @escaping (Result<[WorkoutSessionFull], APIError>) -> Void)
    func createWorkoutRoutine(name: String, completion: @escaping (Result<CreateWorkoutRoutineMutation.Data.CreateWorkoutRoutine, APIError>) -> Void)
    func updateWorkoutRoutine(_ workoutRoutine: WorkoutRoutine, completion: @escaping (Result<WorkoutRoutineFull, APIError>) -> Void)
    func deleteWorkoutRoutine(id: String, completion: @escaping (Result<Int, APIError>) -> Void)
    func addWorkoutSession(id: String, start: String, completion: @escaping(Result<String, APIError>) -> Void)
    func getWorkoutSession(workoutRoutineId: String, workoutSessionId: String, withNetwork: Bool, completion: @escaping (Result<WorkoutSession, APIError>) -> Void)
    func getExerciseRoutines(workoutRoutineId: String, withNetwork: Bool, completion: @escaping (Result<[ExerciseRoutine], APIError>) -> Void)
    func addExercise(workoutSessionId: String, exerciseRoutineId: String, completion: @escaping (Result<String, APIError>) -> Void)
}

// extension that adds default values to protocol
extension WorkoutLoggerAPIServiceProtocol {
    func getWorkoutRoutine(withNetwork: Bool = false, workoutRoutineId: String, completion: @escaping (Result<WorkoutRoutine, APIError>) -> Void) {
        return getWorkoutRoutine(withNetwork: withNetwork, workoutRoutineId: workoutRoutineId, completion: completion)
    }
    func getWorkoutRoutines(limit: Int, after: String, withNetwork: Bool = false, completion: @escaping (Result<[WorkoutRoutineFull], APIError>) -> Void) {
        return getWorkoutRoutines(limit: limit, after: after, withNetwork: withNetwork, completion: completion)
    }
    func getWorkoutSessions(limit: Int, after: String, withNetwork: Bool = false, completion: @escaping (Result<[WorkoutSessionFull], APIError>) -> Void) {
        return getWorkoutSessions(limit: limit, after: after, withNetwork: withNetwork, completion: completion)
    }
    func getWorkoutSession(workoutRoutineId: String, workoutSessionId: String, withNetwork: Bool = false, completion: @escaping (Result<WorkoutSession, APIError>) -> Void) {
        return getWorkoutSession(workoutRoutineId: workoutRoutineId, workoutSessionId: workoutSessionId, withNetwork: withNetwork, completion: completion)
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
                    completion(.failure(.GraphQLError(gqlError: errors[0].message)))
                    return
                }
                
                if let data = response.data {
                    let exerciseRoutines = data.workoutRoutine.fragments.workoutRoutineFull.exerciseRoutines.map { exerciseRoutine in
                        ExerciseRoutine(
                            id: exerciseRoutine.fragments.exerciseRoutineFull.id,
                            name: exerciseRoutine.fragments.exerciseRoutineFull.name,
                            sets: exerciseRoutine.fragments.exerciseRoutineFull.sets,
                            reps: exerciseRoutine.fragments.exerciseRoutineFull.reps
                        )
                    }
                    let workoutRoutine = WorkoutRoutine(
                        id: data.workoutRoutine.fragments.workoutRoutineFull.id,
                        name: data.workoutRoutine.fragments.workoutRoutineFull.name,
                        exerciseRoutines: exerciseRoutines
                    )
                    completion(.success(workoutRoutine))
                }
                completion(.failure(.unknown))
                
            case .failure:
                completion(.failure(.networkError))
                
            }
        }
    }
    
    func getWorkoutRoutines(limit: Int, after: String, withNetwork: Bool = false, completion: @escaping (Result<[WorkoutRoutineFull], APIError>) -> Void) {
        var cachePolicy: CachePolicy = .returnCacheDataElseFetch
        if withNetwork {
            cachePolicy = .fetchIgnoringCacheData
        }
        self.client.fetch(query: WorkoutRoutinesQuery(limit: limit, after: after), cachePolicy: cachePolicy) { result in
            switch result {
            case .success(let response):
                if let errors = response.errors {
                    completion(Result.failure(.GraphQLError(gqlError: errors[0].message)))
                    return
                }
                
                let workoutRoutinesFull: [WorkoutRoutineFull] = response.data?.workoutRoutines.edges.compactMap { $0.node.fragments.workoutRoutineFull } ?? []
                completion(Result.success(workoutRoutinesFull))
                
            case .failure:
                completion(Result.failure(.networkError))
                
            }
        }
    }
    
    func getWorkoutSessions(limit: Int, after: String, withNetwork: Bool = false, completion: @escaping (Result<[WorkoutSessionFull], APIError>) -> Void) {
        print("something is wrong with you")
        var cachePolicy: CachePolicy = .returnCacheDataElseFetch
        if withNetwork {
            cachePolicy = .fetchIgnoringCacheData
        }
        self.client.fetch(query: WorkoutSessionsQuery(limit: limit, after: after), cachePolicy: cachePolicy) { result in
            switch result {
            case .success(let response):
                if let errors = response.errors {
                    completion(Result.failure(.GraphQLError(gqlError: errors[0].message)))
                    return
                }
                
                if let workoutSessions = response.data?.workoutSessions {
                    let workoutSessionFullList = workoutSessions.edges.compactMap { $0.node.fragments.workoutSessionFull }
                    completion(Result.success(workoutSessionFullList))
                    print("workout sessions", workoutSessions)
                    return
                }
                
                completion(Result.failure(.parsingError))
                
            case .failure:
                completion(Result.failure(.networkError))
                
            }
        }
    }
    
    func createWorkoutRoutine(name: String, completion: @escaping (Result<CreateWorkoutRoutineMutation.Data.CreateWorkoutRoutine, APIError>) -> Void) {
        self.client.perform(mutation: CreateWorkoutRoutineMutation(routine: WorkoutRoutineInput(name: name, exerciseRoutines: []))) { result in
            switch result {
            case .success(let response):
                if let errors = response.errors {
                    completion(Result.failure(.GraphQLError(gqlError: errors[0].message)))
                    return
                }
                
                if let workoutRoutine = response.data?.createWorkoutRoutine {
                    completion(Result.success(workoutRoutine))
                } else {
                    completion(Result.failure(.GraphQLError(gqlError: nil)))
                }
                
            case .failure:
                completion(Result.failure(.networkError))
            }
        }
    }
    
    func updateWorkoutRoutine(_ workoutRoutine: WorkoutRoutine, completion: @escaping (Result<WorkoutRoutineFull, APIError>) -> Void) {
        let parsedWorkoutRoutine = self.parser.parseWorkoutRoutine(workoutRoutine)
        
        self.client.perform(mutation: UpdateWorkoutRoutineMutation(workoutRoutine: parsedWorkoutRoutine)) { result in
            switch result {
            case .success(let response):
                if let errors = response.errors {
                    completion(Result.failure(.GraphQLError(gqlError: errors[0].message)))
                    return
                }
                
                if let updatedWorkoutRoutine = response.data?.updateWorkoutRoutine.fragments.workoutRoutineFull {
                    completion(Result.success(updatedWorkoutRoutine))
                    return
                }
                
                completion(Result.failure(.unknown))
                
            case .failure:
                completion(Result.failure(.networkError))
            }
        }
    }
    
    func deleteWorkoutRoutine(id: String, completion: @escaping (Result<Int, APIError>) -> Void) {
        self.client.perform(mutation: DeleteWorkoutRoutineMutation(workoutRoutineId: id)) { result in
            switch result {
            case .success(let response):
                if let errors = response.errors {
                    completion(Result.failure(.GraphQLError(gqlError: errors[0].message)))
                    return
                }
                
                if let deleteWorkoutRoutine = response.data?.deleteWorkoutRoutine {
                    completion(Result.success(deleteWorkoutRoutine))
                    return
                }
                
                completion(Result.failure(.unknown))
                
            case .failure:
                completion(Result.failure(.networkError))
            }
        }
    }
    
    func addWorkoutSession(id: String, start: String, completion: @escaping (Result<String, APIError>) -> Void) {
        let workoutSession = WorkoutSessionInput(workoutRoutineId: id, start: start, exercises: [])
        self.client.perform(mutation: AddWorkoutSessionMutation(workout: workoutSession)) { result in
            switch result {
            case .success(let response):
                if let errors = response.errors {
                    completion(Result.failure(.GraphQLError(gqlError: errors[0].message)))
                    return
                }
                
                if let newWorkoutSessionId = response.data?.addWorkoutSession {
                    completion(Result.success(newWorkoutSessionId))
                    return
                }
                
                completion(Result.failure(.unknown))
                
            case .failure:
                completion(Result.failure(.networkError))
            }
        }
    }
    
    func getWorkoutSession(
        workoutRoutineId: String,
        workoutSessionId: String,
        withNetwork: Bool = false,
        completion: @escaping (Result<WorkoutSessionFull, APIError>) -> Void
    ) {
        var cachePolicy: CachePolicy = .returnCacheDataElseFetch
        if withNetwork {
            cachePolicy = .fetchIgnoringCacheData
        }
        self.client.fetch(query: WorkoutSessionQuery(workoutRoutineId: workoutRoutineId, workoutSessionId: workoutSessionId), cachePolicy: cachePolicy) { result in
            switch result {
            case .success(let response):
                
                if let errors = response.errors {
                    completion(Result.failure(.GraphQLError(gqlError: errors[0].message)))
                    return
                }
                
                if let workoutSession = response.data?.workoutSession.fragments.workoutSessionFull {
                    completion(Result.success(workoutSession))
                    return
                }

                completion(Result.failure(.unknown))
            case .failure:
                completion(Result.failure(.networkError))
            }
        }
    }
    
    func getExerciseRoutines(workoutRoutineId: String, withNetwork: Bool = false, completion: @escaping (Result<[ExerciseRoutine], APIError>) -> Void) {
        self.client.fetch(query: ExerciseRoutinesQuery(workoutRoutineId: workoutRoutineId)) { result in
            switch result {
            case .success(let response):
                
                if let errors = response.errors {
                    completion(Result.failure(.GraphQLError(gqlError: errors[0].message)))
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
                    return
                }
                
                completion(Result.failure(.unknown))
                
            case .failure:
                completion(Result.failure(.networkError))
            }
        }
    }
    
    func addExercise(workoutSessionId: String, exerciseRoutineId: String, completion: @escaping (Result<String, APIError>) -> Void) {
        let exerciseInput = ExerciseInput(
            exerciseRoutineId: exerciseRoutineId,
            notes: "",
            setEntries: []
        )
        self.client.perform(mutation: AddExerciseMutation(workoutSessionId: workoutSessionId, exercise: exerciseInput)) { result in
            switch result {
            case .success(let response):
                
                if let errors = response.errors {
                    completion(Result.failure(.GraphQLError(gqlError: errors[0].message)))
                    return
                }
                
                if let exerciseId = response.data?.addExercise {
                    completion(Result.success(exerciseId))
                    return
                }
                
                completion(Result.failure(.unknown))
                
            case .failure:
                completion(Result.failure(.networkError))
            }
        }
    }
}

