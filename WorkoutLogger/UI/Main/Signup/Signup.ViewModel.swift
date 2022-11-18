//
//  SignupViewModel.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-17.
//

import Foundation

class SignupViewModel: ObservableObject {
    private let service: AuthServiceProtocol
    
    @Published var isLoading: Bool = false
    
    init(service: AuthServiceProtocol) {
        self.service = service
    }
    
    func signup(email: String, name: String, password: String, confirmPassword: String) {
        self.service.signup(email: email, name: name, password: password, confirmPassword: confirmPassword)
    }
}
