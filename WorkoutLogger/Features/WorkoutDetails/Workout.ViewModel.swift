//
//  Workout.ViewModel.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-12-05.
//

import Foundation

class WorkoutViewModel: ObservableObject {
    private let service: WorkoutLoggerAPIServiceProtocol

    @Published var error: String?
    @Published var isLoading: Bool = false
    @Published var workoutRoutine: WorkoutRoutine?

    init(service: WorkoutLoggerAPIServiceProtocol) {
        self.service = service
    }

    func getWorkoutRoutine(workoutRoutineId: String, withNetwork: Bool = false) {
        self.isLoading = true
        self.service.getWorkoutRoutine(withNetwork: withNetwork, workoutRoutineId: workoutRoutineId) { result in
            switch result {
            case .success(let workoutRoutine):
                self.error = ""
                self.workoutRoutine = workoutRoutine
            case .failure(let err):
                self.error = err.localizedDescription
            }
            self.isLoading = false
        }
    }

    func updateWorkoutRoutine(_ workoutRoutine: WorkoutRoutine, onSuccess: @escaping () -> Void) {
        self.service.updateWorkoutRoutine(workoutRoutine) { result in
            switch result {
            case .success:
                // refetch to refresh cache
                self.getWorkoutRoutine(workoutRoutineId: workoutRoutine.id, withNetwork: true)
                onSuccess()
            case .failure(let err):
                self.error = err.localizedDescription
            }
        }
    }
    
    func deleteWorkoutRoutine(id: String) {
        
    }
}
