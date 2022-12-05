//
//  WorkoutDetails.ViewModel.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-12-05.
//

import Foundation

protocol WorkoutDetailsViewModelProtocol {}

class WorkoutDetailsViewModel: ObservableObject {
    private let service: WorkoutLoggerAPIServiceProtocol

    @Published var error: String?
    @Published var isLoading: Bool = false
    @Published var workoutRoutine: WorkoutRoutine?

    init(service: WorkoutLoggerAPIServiceProtocol) {
        self.service = service
    }

    func getWorkoutRoutine(workoutRoutineId: String) {
        self.isLoading = true
        self.service.getWorkoutRoutine(workoutRoutineId: workoutRoutineId) { result in
            switch result {
            case .success(let workoutRoutine):
                print(workoutRoutine as Any)
                self.error = ""
                self.workoutRoutine = workoutRoutine
            case .failure(let err):
                self.error = err.localizedDescription
            }
            self.isLoading = false
        }
    }
}
