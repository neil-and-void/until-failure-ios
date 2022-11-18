//
//  Login.ViewModel.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-18.
//

import Foundation

class LoginViewModel: ObservableObject {
    private let service: AuthServiceProtocol
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    init(service: AuthServiceProtocol) {
        self.service = service
    }
    
    func submit() {
        self.service.login(email: email, password: password)
    }
}
