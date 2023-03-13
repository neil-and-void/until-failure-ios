//
//  ExerciseRoutineViewModel.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-12-22.
//

import Foundation

class ExerciseRoutineViewModel: ObservableObject {
    private let service: WorkoutLoggerAPIServiceProtocol
    private let localMutator: LocalCacheMutator
    
    @Published var error: String?
    @Published var isLoading = false
    @Published var exerciseRoutines: [ExerciseRoutine]?
    
    init(service: WorkoutLoggerAPIServiceProtocol) {
        self.service = service
        self.localMutator = LocalCacheMutator(store: WorkoutLoggerAPIClient.client.store)
    }
    
    func getExerciseRoutines(workoutRoutineId: String, withNetwork: Bool = false) {
        self.isLoading = true
        self.service.getExerciseRoutines(workoutRoutineId: workoutRoutineId, withNetwork: withNetwork) { result in
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
    
    func addExercise(workoutSessionId: String, exerciseRoutineId: String, sets: Int, onSuccess: @escaping (Exercise) -> Void) {
        self.isLoading = true
        self.service.addExercise(
            workoutSessionId: workoutSessionId,
            exerciseRoutineId: exerciseRoutineId,
            sets: sets
        ) { result in
            switch result {
            case .success(let exercise):
                self.error = nil
                self.localMutator.addExercise(workoutSessionId: workoutSessionId, exercise: exercise, completion: {_ in})
                onSuccess(exercise)
            case .failure(let err):
                self.error = err.localizedDescription
            }
            self.isLoading = false
        }
    }
    
}
