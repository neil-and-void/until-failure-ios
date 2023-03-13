//
//  WorkoutSessionViewModel.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-12-02.
//

import Foundation

class WorkoutSessionViewModel: ObservableObject {
    private let service: WorkoutLoggerAPIServiceProtocol
    private let localMutator: LocalCacheMutator

    @Published var workoutSessionList: [WorkoutSession] = []
    @Published var workoutSession: WorkoutSession?
    @Published var error: String?
    @Published var isLoading = false

    init(service: WorkoutLoggerAPIServiceProtocol) {
        self.service = service
        self.localMutator = LocalCacheMutator(store: WorkoutLoggerAPIClient.client.store)
    }
    
    func getWorkoutSessions(limit: Int, after: String, withNetwork: Bool = false) {
        self.isLoading = true
        self.service.getWorkoutSessions(limit: limit, after: after, withNetwork: withNetwork) { result in
            switch result {
            case .success(let workoutSessions):
                self.error = nil
                self.workoutSessionList = workoutSessions
            case .failure(let err):
                self.error = err.localizedDescription
            }
            self.isLoading = false
        }
    }

    func getWorkoutSession(workoutSessionId: String, withNetwork: Bool = false) {
        self.isLoading = true
        self.service.getWorkoutSession(
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

    func deleteWorkoutSession(id: String, onSuccess: @escaping () -> Void) {
        // invalidate deleted cache items
        self.localMutator.deleteWorkoutSession(id: id) { result in
            switch result {
            case .success:
                // remove from workout view model since we'll have a cache miss
                self.workoutSessionList = self.workoutSessionList.filter { $0.id != id }
                self.error = nil
            case .failure(let err):
                self.error = err.localizedDescription
            }
        }

        self.service.deleteWorkoutSession(id: id) { result in
            switch result {
            case .success:
                onSuccess()
                self.error = nil
            case .failure(let err):
                self.error = err.localizedDescription
            }
        }
    }

    func finishWorkoutSession(id: String) {
        self.service.updateWorkoutSession(
            workoutSessionId: id,
            start: nil,
            end: Date()
        ) { result in
            switch result {
            case .success:
                self.error = nil
            case .failure(let err):
                self.error = err.localizedDescription
            }
        }
    }
}
