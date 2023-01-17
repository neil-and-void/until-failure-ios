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
    @Published var workoutSession: WorkoutSession?
    @Published var error: String?
    @Published var isLoading = false

    init(service: WorkoutLoggerAPIServiceProtocol) {
        self.service = service
    }
    
    func getWorkoutSessions(withNetwork: Bool = false) {
        self.service.getWorkoutSessions(limit: 8, after: "", withNetwork: withNetwork) { result in
            switch result {
            case .success(let workoutSessions):
                self.error = nil
                self.workoutSessionList = workoutSessions
            case .failure(let err):
                self.error = err.localizedDescription
            }
        }
    }

    func getWorkoutSession(workoutSessionId: String, workoutRoutineId: String, withNetwork: Bool = false) {
        self.isLoading = true
        self.service.getWorkoutSession(
            workoutRoutineId: workoutRoutineId,
            workoutSessionId: workoutSessionId,
            withNetwork: withNetwork
        ) { result in
            switch result {
            case .success(let workoutSession):
                self.workoutSession = workoutSession
            case .failure(let err):
                self.error = err.localizedDescription
            }
            self.isLoading = false
        }
    }
    
    func addWorkoutSession(workoutRoutineId: String, start: Date, onSuccess: @escaping () -> Void) {
        self.service.addWorkoutSession(id: workoutRoutineId, start: start) { result in
            switch result {
            case .success:
                self.error = nil
                onSuccess()
            case .failure(let err):
                self.error = err.localizedDescription
            }
        }
    }
}
