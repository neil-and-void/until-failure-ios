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

    func getExerciseRoutines(workoutRoutineId: String, withNetwork: Bool = false, completion: @escaping () -> Void) {
        self.service.getExerciseRoutines(workoutRoutineId: workoutRoutineId) { result in
            switch result {
            case .success(let exerciseRoutines):
                self.error = nil
                self.exerciseRoutines = exerciseRoutines
            case .failure(let err):
                self.error = err.localizedDescription
            }
            self.isLoading = false
        }
    }
    
}
