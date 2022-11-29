//
//  WorkoutLoggerAPIService.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-21.
//

import SwiftUI
import Apollo

protocol WorkoutLoggerAPIServiceProtocol {
    func getWorkoutRoutines(completion: @escaping (Result<[WorkoutRoutinesFull], APIError>) -> Void)
    func createWorkoutRoutine(name: String, completion: @escaping (Result<CreateWorkoutRoutineMutation.Data.CreateWorkoutRoutine, APIError>) -> Void)
}

class WorkoutLoggerAPIService: WorkoutLoggerAPIServiceProtocol {
    private var client: ApolloClient
    
    init(client: ApolloClient = WorkoutLoggerAPIClient.client) {
        self.client = client
    }
    
    func getWorkoutRoutines(completion: @escaping (Result<[WorkoutRoutinesFull], APIError>) -> Void) {
        self.client.fetch(query: WorkoutRoutinesQuery()) { result in
            switch result {
            case .success(let response):
                if let errors = response.errors {
                    let error = APIError.GraphQLError(gqlError: errors[0].message)
                    completion(Result.failure(error))
                    return
                }
                let workoutRoutinesFull: [WorkoutRoutinesFull] = (response.data?.workoutRoutines)?.compactMap { $0?.fragments.workoutRoutinesFull } ?? []
                completion(Result.success(workoutRoutinesFull))
            case .failure:
                completion(Result.failure(APIError.networkError))
            }
        }
    }
    
    func createWorkoutRoutine(name: String, completion: @escaping (Result<CreateWorkoutRoutineMutation.Data.CreateWorkoutRoutine, APIError>) -> Void) {
        self.client.perform(mutation: CreateWorkoutRoutineMutation(routine: WorkoutRoutineInput(name: name))) { result in
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
}
