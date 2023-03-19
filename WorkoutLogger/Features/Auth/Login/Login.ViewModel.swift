//
//  Login.ViewModel.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-18.
//

import Foundation

class LoginViewModel: ObservableObject {
    private let service: AuthServiceProtocol
    private let keychain: KeychainServiceProtocol

    @Published
    var email: String = ""
    @Published
    var password: String = ""
    
    @Published
    var isLoading: Bool = false
    @Published
    var error: String?

    init(service: AuthServiceProtocol, keychain: KeychainServiceProtocol = KeychainService()) {
        self.service = service
        self.keychain = keychain
    }

    func submit(setAuth: @escaping (_ result: Bool) -> Void) {
        self.isLoading = true
        self.service.login(email: email, password: password) { result in
            switch result {
            case .success(let result):
                let tokens = AuthTokens(
                    accessToken: result.accessToken,
                    refreshToken: result.refreshToken
                )
                
                self.error = nil
                self.keychain.save(tokens, service: WORKOUT_LOGGER_KEYCHAIN_SERVICE, account: WORKOUT_LOGGER_KEYCHAIN_ACCOUNT)
                
                setAuth(true)

            case .failure(let err):
                self.error = err.localizedDescription
                setAuth(false)
            }

            self.isLoading = false
        }
    }
}
