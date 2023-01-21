//
//  ExerciseRoutineViewModel.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-12-22.
//

import Foundation

class ExerciseRoutineViewModel: ObservableObject {
    private let service: WorkoutLoggerAPIServiceProtocol
    
    @Published var error: String?
    @Published var isLoading = false
    @Published var exerciseRoutines: [ExerciseRoutine]?
    
    init(service: WorkoutLoggerAPIServiceProtocol) {
        self.service = service
    }
    
    func getExerciseRoutines(workoutRoutineId: String, withNetwork: Bool = false) {
        self.isLoading = true
        self.service.getExerciseRoutines(workoutRoutineId: workoutRoutineId, withNetwork: withNetwork) { result in
            switch result {
            case .success(let exerciseRoutines):
                self.error = nil
                let sortedExerciseRoutines = exerciseRoutines.sorted { $0.id < $1.id }
                self.exerciseRoutines = sortedExerciseRoutines
            case .failure(let err):
                self.error = err.localizedDescription
            }
            self.isLoading = false
        }
    }
    
    func addExercise(workoutSessionId: String, exerciseRoutineId: String, onSuccess: @escaping () -> Void) {
        self.service.addExercise(
            workoutSessionId: workoutSessionId,
            exerciseRoutineId: exerciseRoutineId
        ) { result in
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
