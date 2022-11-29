//
//  MockServices.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-28.
//

import Foundation
import Apollo
@testable import WorkoutLogger

final class MockAuthenticationService: AuthServiceProtocol {
    var authResult: Result<AuthResult, APIError> = .success(AuthResult(refreshToken: "refresh_token", accessToken: "access_token"))
    var refreshAccessTokenResult: Result<String, APIError> = .success("access_token")

    init() {}

    func signup(
        email: String,
        name: String,
        password: String,
        confirmPassword: String,
        completion: @escaping (Result<AuthResult, APIError>) -> Void
    ) {
        completion(authResult)
    }
    
    func login(
        email: String,
        password: String,
        completion: @escaping (Result<AuthResult, APIError>) -> Void
    ) {
        completion(authResult)
    }
    
    func refreshAccessToken(
        refreshToken: String,
        completion: @escaping (Result<String, APIError>) -> Void
    ) {
        completion(refreshAccessTokenResult)
    }
}
