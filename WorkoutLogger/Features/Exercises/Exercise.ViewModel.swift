//
//  Exercise.ViewModel.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2023-01-08.
//

import Foundation

class ExerciseViewModel: ObservableObject {
    private let service: WorkoutLoggerAPIServiceProtocol

    @Published var error: String?
    @Published var isLoading = false
    
    init(service: WorkoutLoggerAPIServiceProtocol) {
        self.service = service
    }
   
    func addSetEntry(exerciseId: String, setEntry: SetEntry) {
        self.service.addSetEntry(exerciseId: exerciseId, setEntry: setEntry) { result in
            switch result {
            case .success(let setEntryId):
                self.error = ""
            case .failure(let err):
                self.error = err.localizedDescription
            }
            self.isLoading = false
        }
    }
    
    func editSetEntry() {}
    
    func editExercise() {}

    func deleteExercise(exerciseId: String, onSuccess: @escaping () -> Void) {
        self.isLoading = true
        self.service.deleteExercise(exerciseId: exerciseId) { result in
            switch result {
            case .success:
                self.error = ""
                onSuccess()
            case .failure(let err):
                self.error = err.localizedDescription
            }
            self.isLoading = false
        }
    }
}
