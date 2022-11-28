//
//  AuthenticationState.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-20.
//

import Foundation

protocol AuthenticationStateProtocol {
    func setAuth(_ isAuthenticated: Bool)
}

// global state of whether user is signed in or not
class AuthenticationState: ObservableObject, AuthenticationStateProtocol {
    @Published var isAuthenticated = false
    
    func setAuth(_ isAuthenticated: Bool) {
        self.isAuthenticated = isAuthenticated
    }
}
