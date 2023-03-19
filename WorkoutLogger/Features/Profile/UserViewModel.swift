//
//  UserViewModel.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-29.
//

import Foundation

class UserViewModel: ObservableObject {
    private let service: WorkoutLoggerAPIServiceProtocol
    private var keychainService: KeychainServiceProtocol

    @Published
    var error: WorkoutLoggerError?
    @Published
    var user: User?
    @Published
    var isLoading: Bool = false
    
    init(keychainService: KeychainServiceProtocol = KeychainService(), service: WorkoutLoggerAPIServiceProtocol) {
        self.service = service
        self.keychainService = keychainService
    }

    func logout(setAuth: (Bool) -> Void) {
        self.keychainService.delete(
            service: WORKOUT_LOGGER_KEYCHAIN_SERVICE,
            account: WORKOUT_LOGGER_KEYCHAIN_ACCOUNT
        )
        setAuth(false)
        // TODO: clear apollo cache
    }

    func getUser() {
        self.isLoading = true
        self.service.getUser() { result in
            switch result {
            case .success(let user):
                self.error = nil
                self.user = user
            case .failure(let err):
                self.error = err
            }
            self.isLoading = false
        }
    }

    func deleteUser(success onSuccess: @escaping () -> Void) {
        self.isLoading = true
        self.service.deleteUser() { result in
            switch result {
            case .success:
                self.error = nil
                onSuccess()
            case .failure(let err):
                self.error = err
            }
            self.isLoading = false
        }
    }
}
