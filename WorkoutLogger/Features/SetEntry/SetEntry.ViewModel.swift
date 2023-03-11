//
//  SetEntry.ViewModel.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2023-01-24.
//

import Foundation

class SetEntryViewModel: ObservableObject {
    private let service: WorkoutLoggerAPIServiceProtocol
    private let localMutator: LocalCacheMutator

    @Published var error: String?
    @Published var isLoading = false

    init(service: WorkoutLoggerAPIServiceProtocol) {
        self.service = service
        self.localMutator = LocalCacheMutator(store: WorkoutLoggerAPIClient.client.store)
    }

    func addSetEntry(exerciseId: String, setEntry: SetEntry, onSuccess: @escaping (SetEntry) -> Void) {
        self.isLoading = true
        self.service.addSetEntry(exerciseId: exerciseId, setEntry: setEntry) { result in
            switch result {
            case .success(let newSetEntry):
                self.error = nil
                onSuccess(newSetEntry)
                self.localMutator.addSetEntry(exerciseId: exerciseId, setEntry: newSetEntry, completion: {_ in })
            case .failure(let err):
                self.error = err.localizedDescription
            }
            self.isLoading = false
        }
    }

    func updateSetEntry(id: String, reps: Int?, weight: Double?) {
        // local
        self.localMutator.updateSetEntry(id: id, reps: reps, weight: weight) { result in
            switch result {
            case .success:
                self.error = nil
            case .failure(let err):
                self.error = err.localizedDescription
            }
        }

        // remote
        self.service.updateSetEntry(id: id, reps: reps, weight: weight) { result in
            switch result {
            case .success:
                self.error = nil
            case .failure(let err):
                self.error = err.localizedDescription
            }
        }
    }

    func deleteSetEntry(id: String, exerciseId: String) {
        self.service.deleteSetEntry(id: id) { result in
            switch result {
            case .success:
                self.error = nil
                self.localMutator.deleteSetEntry(id: id, exerciseId: exerciseId)
            case .failure(let err):
                self.error = err.localizedDescription
            }
        }
    }
}
