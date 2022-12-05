//
//  AuthenticationState.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-20.
//

import Foundation
import Apollo

protocol AuthenticationStateProtocol {
    func setAuth(_ isAuthenticated: Bool)
}

// global state of whether user is signed in or not
class AuthenticationState: ObservableObject, AuthenticationStateProtocol {
    private var client: ApolloClientProtocol
    @Published var isAuthenticated = false
    
    init(client: ApolloClientProtocol = WorkoutLoggerAPIClient.client) {
        self.client = client
    }
    
    func setAuth(_ isAuthenticated: Bool) {
        self.client.store.clearCache() { _ in
            self.isAuthenticated = isAuthenticated
        }
    }
}
