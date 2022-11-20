//
//  SignupViewModel.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-17.
//

import Foundation

class SignupViewModel: ObservableObject {
    private let service: AuthServiceProtocol
   
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""

    @Published var error: String = ""
    
    init(service: AuthServiceProtocol) {
        self.service = service
    }
    
    func submit() {
        self.service.signup(email: email, name: name, password: password, confirmPassword: confirmPassword) { result in
            print(result)
        }
    }
}
