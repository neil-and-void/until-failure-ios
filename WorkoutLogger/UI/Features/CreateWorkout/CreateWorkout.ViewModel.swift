//
//  CreateWorkoutViewModel.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-20.
//

import SwiftUI

class CreateWorkoutViewModel: ObservableObject {
    private let service: WorkoutLoggerAPIServiceProtocol
    
    @Published var workoutName: String = ""
    @Published var loading: Bool = false
    @Published var error: String = ""
    
    init(service: WorkoutLoggerAPIServiceProtocol) {
        self.service = service
    }
    
    func createWorkoutRoutine(onCompletion: @escaping (_ wasSuccessful: Bool) -> Void) {
        self.loading = true
        self.service.createWorkoutRoutine(name: self.workoutName) { result in
            switch result {
            case .success:
                self.error = ""
                onCompletion(true)
            case .failure(let err):
                self.error = err.error
                onCompletion(false)
            }
        }
        self.loading = false
    }
}
