//
//  AuthenticationState.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-20.
//

import Foundation

// global state of whether user is signed in or not
class AuthenticationState: ObservableObject {
    @Published var isAuthenticated = false
}
