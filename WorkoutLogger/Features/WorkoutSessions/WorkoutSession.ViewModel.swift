//
//  WorkoutSessionViewModel.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-12-02.
//

import Foundation

class WorkoutSessionViewModel: ObservableObject {
    private let service: WorkoutLoggerAPIServiceProtocol
    
    @Published var workoutSessionList: [WorkoutSession] = []
    @Published var error: String?

    init(service: WorkoutLoggerAPIServiceProtocol) {
        self.service = service
    }
    
    func getWorkoutSessions() {
        self.service.getWorkoutSessions() { result in
            switch result {
            case .success(let workoutSessions):
                self.error = nil
                self.workoutSessionList = workoutSessions
            case .failure(let err):
                self.error = err.localizedDescription
            }
        }
    }
}
