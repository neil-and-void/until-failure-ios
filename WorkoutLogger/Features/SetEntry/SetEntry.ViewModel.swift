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

    func addSetEntry(exerciseId: String, setEntry: SetEntry, onSuccess: @escaping () -> Void) {
        self.service.addSetEntry(exerciseId: exerciseId, setEntry: setEntry) { result in
            switch result {
            case .success:
                self.error = nil
                onSuccess()
            case .failure(let err):
                print("add set error: ", err.localizedDescription)
                self.error = err.localizedDescription
            }
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

    func deleteSetEntry(id: String, onSuccess: @escaping () -> Void) {
        self.service.deleteSetEntry(id: id) { result in
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
