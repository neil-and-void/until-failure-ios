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
    func getWorkoutSessions(completion: @escaping (Result<[WorkoutSession], APIError>) -> Void)
    func createWorkoutRoutine(name: String, completion: @escaping (Result<CreateWorkoutRoutineMutation.Data.CreateWorkoutRoutine, APIError>) -> Void)
    func updateWorkoutRoutine(_ workoutRoutine: WorkoutRoutine, completion: @escaping (Result<WorkoutRoutineFull, APIError>) -> Void)
}

extension WorkoutLoggerAPIServiceProtocol {
    func getWorkoutRoutine(withNetwork: Bool = false, workoutRoutineId: String, completion: @escaping (Result<WorkoutRoutine, APIError>) -> Void) {
        return getWorkoutRoutine(withNetwork: withNetwork, workoutRoutineId: workoutRoutineId, completion: completion)
    }
    func getWorkoutRoutines(withNetwork: Bool = false, completion: @escaping (Result<[WorkoutRoutineFull], APIError>) -> Void) {
        return getWorkoutRoutines(withNetwork: withNetwork, completion: completion)
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
    
    func getWorkoutSessions(completion: @escaping (Result<[WorkoutSession], APIError>) -> Void) {
        self.client.fetch(query: WorkoutSessionsQuery()) { result in
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
}
