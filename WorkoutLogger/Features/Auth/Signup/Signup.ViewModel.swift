//
//  SignupViewModel.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-17.
//

import Foundation

class SignupViewModel: ObservableObject {
    private let service: AuthServiceProtocol
    private let keychain: KeychainServiceProtocol

    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    
    @Published var isLoading: Bool = false
    @Published var error: String?
    
    init(service: AuthServiceProtocol, keychain: KeychainServiceProtocol = KeychainService()) {
        self.service = service
        self.keychain = keychain
    }
    
    func submit(success onSucces: @escaping () -> Void) {
        self.isLoading = true
        self.service.signup(email: email, name: name, password: password, confirmPassword: confirmPassword) { result in
            switch result {
            case .success:
                self.error = nil
                onSucces()
            case .failure(let err):
                self.error = err.localizedDescription
            }
            self.isLoading = false
        }
    }
}
