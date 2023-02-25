//
//  Exercise.ViewModel.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2023-01-08.
//

import Foundation

class ExerciseViewModel: ObservableObject {
    private let service: WorkoutLoggerAPIServiceProtocol
    private let localMutator: LocalCacheMutator

    @Published var error: String?
    @Published var isLoading = false
    
    init(service: WorkoutLoggerAPIServiceProtocol) {
        self.service = service
        self.localMutator = LocalCacheMutator(store: WorkoutLoggerAPIClient.client.store)
    }

    func getExercise(id: String, withNetwork: Bool = false) {
        self.service.getExercise(exerciseId: id, withNetwork: withNetwork) { result in
            switch result {
            case .success:
                self.error = nil
            case .failure(let err):
                print("sdlfkjsdlkfjsoidjflsk", err.localizedDescription)
                self.error = err.localizedDescription
            }
        }
    }

    func updateExercise(id: String, notes: String) {
        self.localMutator.updateExercise(id: id, notes: notes) { result in
            switch result {
            case .success:
                self.error = nil
            case .failure(let err):
                self.error = err.localizedDescription
            }
        }

        self.service.updateExercise(exerciseId: id, notes: notes) { result in
            switch result {
            case .success:
                self.error = nil
            case .failure(let err):
                self.error = err.localizedDescription
            }
        }
    }

    func deleteExercise(exerciseId: String, onSuccess: @escaping () -> Void) {
        self.isLoading = true
        self.service.deleteExercise(exerciseId: exerciseId) { result in
            switch result {
            case .success:
                self.error = nil
                onSuccess()
            case .failure(let err):
                self.error = err.localizedDescription
            }
            self.isLoading = false
        }
    }
}
