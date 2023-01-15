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
    
    func createWorkoutRoutine(name: String, completion: @escaping (Bool) -> Void) {
        self.isLoading = true
        self.service.createWorkoutRoutine(name: name) { result in
            switch result {
            case .success:
                self.getWorkoutRoutines(withNetwork: true)
                self.error = nil
                completion(true)
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
                print("get workout routines list", workoutRoutines[0])
                self.workoutRoutineList = workoutRoutines
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
                print("this was fetched in get workotu routine", workoutRoutine)
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
        self.localMutator.updateWorkoutRoutine(workoutRoutine: workoutRoutine) { result in
            switch result {
            case .success:
                onSuccess()
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
            case .failure(let err):
                self.workoutRoutine = originalWorkoutRoutine
                self.error = err.localizedDescription
            }
        }
    }
    
    func deleteWorkoutRoutine(id: String) {
        self.service.deleteWorkoutRoutine(id: id) { result in
            switch result {
            case .success:
                print(result as Any)
                self.error = nil
            case .failure(let err):
                self.error = err.localizedDescription
            }
        }
    }
}
