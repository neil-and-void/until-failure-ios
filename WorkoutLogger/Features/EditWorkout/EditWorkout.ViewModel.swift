//
//  EditWorkout.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-12-05.
//

import Foundation

protocol EditWorkoutViewModelProtocol {}

class EditWorkoutViewModel: ObservableObject {
    private var service: WorkoutLoggerAPIServiceProtocol
    
    @Published var error: String?
    
    init(service: WorkoutLoggerAPIServiceProtocol) {
        self.service = service
    }
    
    func updateWorkoutRoutine(_ workoutRoutine: WorkoutRoutine, onSuccess: @escaping () -> Void) {
        self.service.updateWorkoutRoutine(workoutRoutine) { result in
            switch result {
            case .success:
                print(result as Any)
                onSuccess()
            case .failure(let err):
                print(err.localizedDescription)
                self.error = err.localizedDescription
            }
        }
    }
}
