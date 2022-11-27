//
//  WorkoutLoggerAPIService.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-21.
//

import SwiftUI
import Apollo

protocol WorkoutLoggerAPIServiceProtocol {
    func getWorkoutRoutines(_ completion: @escaping (Result<[WorkoutRoutinesFull], GraphQLError>) -> Void)
}

class WorkoutLoggerAPIService: WorkoutLoggerAPIServiceProtocol {
    private var client: ApolloClient
    
    init(client: ApolloClient = WorkoutLoggerAPIClient.client) {
        self.client = client
    }
    
    func getWorkoutRoutines(_ completion: @escaping (Result<[WorkoutRoutinesFull], GraphQLError>) -> Void) {
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
                // Network error
//                print("error", error)
                completion(Result.failure(GraphQLError(error: error.localizedDescription)))
            }
        }
    }
}
