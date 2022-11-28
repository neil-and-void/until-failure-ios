//
//  WorkoutLoggerAPIService.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-21.
//

import SwiftUI
import Apollo

protocol WorkoutLoggerAPIServiceProtocol {
    func getWorkoutRoutines(completion: @escaping (Result<[WorkoutRoutinesFull], GraphQLError>) -> Void)
    func createWorkoutRoutine(name: String, completion: @escaping (Result<CreateWorkoutRoutineMutation.Data.CreateWorkoutRoutine, GraphQLError>) -> Void)
}

class WorkoutLoggerAPIService: WorkoutLoggerAPIServiceProtocol {
    private var client: ApolloClient
    
    init(client: ApolloClient = WorkoutLoggerAPIClient.client) {
        self.client = client
    }
    
    func getWorkoutRoutines(completion: @escaping (Result<[WorkoutRoutinesFull], GraphQLError>) -> Void) {
        self.client.fetch(query: WorkoutRoutinesQuery()) { result in
            switch result {
            case .success(let response):
                if let errors = response.errors {
                    completion(Result.failure(GraphQLError(error: errors[0].message ?? "")))
                    return
                }
                let workoutRoutinesFull: [WorkoutRoutinesFull] = (response.data?.workoutRoutines)?.compactMap { $0?.fragments.workoutRoutinesFull } ?? []
                completion(Result.success(workoutRoutinesFull))
            case .failure(let error):
                completion(Result.failure(GraphQLError(error: error.localizedDescription)))
            }
        }
    }
    
    func createWorkoutRoutine(name: String, completion: @escaping (Result<CreateWorkoutRoutineMutation.Data.CreateWorkoutRoutine, GraphQLError>) -> Void) {
        self.client.perform(mutation: CreateWorkoutRoutineMutation(routine: WorkoutRoutineInput(name: name))) { result in
            switch result {
            case .success(let response):
                if let errors = response.errors {
                    completion(Result.failure(GraphQLError(error: errors[0].message ?? "")))
                    return
                }
                if let workoutRoutine = response.data?.createWorkoutRoutine {
                    completion(Result.success(workoutRoutine))
                } else {
                    completion(Result.failure(GraphQLError(error: "Something went wrong")))
                }
            case .failure(let err):
                completion(Result.failure(GraphQLError(error: err.localizedDescription)))
            }
        }
    }
}
