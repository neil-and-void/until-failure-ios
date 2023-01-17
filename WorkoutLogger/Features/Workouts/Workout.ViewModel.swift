//
//  Workout.ViewModel.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-12-05.
//

import Foundation

class WorkoutViewModel: ObservableObject {
    private let service: WorkoutLoggerAPIServiceProtocol
    private let localMutator: LocalCacheMutator
     
    @Published var error: String?
    @Published var isLoading: Bool = false
    @Published var workoutRoutine: WorkoutRoutine?
    @Published var workoutRoutineList: [WorkoutRoutine] = []
    
    init(service: WorkoutLoggerAPIServiceProtocol) {
        self.service = service
        self.localMutator = LocalCacheMutator(store: WorkoutLoggerAPIClient.client.store)
    }
    
    func createWorkoutRoutine(name: String, onSuccess: @escaping () -> Void) {
        self.isLoading = true
        self.service.createWorkoutRoutine(name: name) { result in
            switch result {
            case .success:
                self.error = nil
                onSuccess()
            case .failure(let err):
                self.error = err.localizedDescription
            }
        }
        self.isLoading = false
    }
    
    func getWorkoutRoutines(withNetwork: Bool = false) {
        self.isLoading = true
        self.service.getWorkoutRoutines(limit: 8, after: "", withNetwork: withNetwork) { result in
            switch result {
            case .success(let workoutRoutines):
                let sortedWorkoutRoutines = workoutRoutines.sorted { $0.id < $1.id }
                self.workoutRoutineList = sortedWorkoutRoutines
                self.error = nil
            case .failure(let err):
                self.error = err.localizedDescription
            }
            self.isLoading = false
        }
    }
    
    func getWorkoutRoutine(workoutRoutineId: String, withNetwork: Bool = false) {
        self.isLoading = true
        self.service.getWorkoutRoutine(withNetwork: withNetwork, workoutRoutineId: workoutRoutineId) { result in
            switch result {
            case .success(let workoutRoutine):
                self.workoutRoutine = workoutRoutine
                self.error = nil
            case .failure(let err):
                self.error = err.localizedDescription
            }
            self.isLoading = false
        }
    }
    
    func updateWorkoutRoutine(_ workoutRoutine: WorkoutRoutine, _ originalWorkoutRoutine: WorkoutRoutine, onSuccess: @escaping () -> Void) {
        // local mutation
        // might not need this
        self.localMutator.updateWorkoutRoutine(workoutRoutine: workoutRoutine) { result in
            switch result {
            case .success:
                self.error = nil
            case .failure(let err):
                self.workoutRoutine = originalWorkoutRoutine
                self.error = err.localizedDescription
            }
        }
        
        // send mutation to the server
        self.service.updateWorkoutRoutine(workoutRoutine) { result in
            switch result {
            case .success:
                self.error = nil
                onSuccess()
            case .failure(let err):
                self.workoutRoutine = originalWorkoutRoutine
                self.error = err.localizedDescription
            }
        }
    }
    
    func deleteWorkoutRoutine(id: String, onSuccess: @escaping () -> Void) {
        // invalidate deleted cache items
        self.localMutator.deleteWorkoutRoutine(id: id) { result in
            switch result {
            case .success:
                // remove from workout view model since we'll have a cache miss
                self.workoutRoutineList = self.workoutRoutineList.filter { $0.id != id}
                self.error = nil
            case .failure(let err):
                self.error = err.localizedDescription
            }
        }
        
        self.service.deleteWorkoutRoutine(id: id) { result in
            switch result {
            case .success:
                onSuccess()
                self.error = nil
            case .failure(let err):
                self.error = err.localizedDescription
            }
        }
    }
}
