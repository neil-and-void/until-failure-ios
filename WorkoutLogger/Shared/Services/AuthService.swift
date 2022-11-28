//
//  AuthService.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-17.
//

import Foundation
import Apollo

protocol AuthServiceProtocol {
    func signup(email: String, name: String, password: String, confirmPassword: String, completion: @escaping (Result<SignupResult, GraphQLError>) -> Void)
    func login(email: String, password: String, completion: @escaping (Result<LoginResult, GraphQLError>) -> Void)
    func refreshAccessToken(refreshToken: String, completion: @escaping (Result<RefreshAccessTokenResult, GraphQLError>) -> Void)
}

final class AuthService: AuthServiceProtocol {
    private var client: ApolloClient
    
    init(client: ApolloClient = AuthAPIClient.client) {
        self.client = client
    }
    
    func signup(
        email: String,
        name: String,
        password: String,
        confirmPassword: String,
        completion: @escaping (Result<SignupResult, GraphQLError>) -> Void
    ) {
        self.client.perform(mutation: SignupMutation(
            email: email,
            name: name,
            password: password,
            confirmPassword: confirmPassword
        )) { result in
            switch result {
            case .success(let response):
                if let errors = response.errors {
                    completion(Result.failure(GraphQLError(error: errors[0].message ?? "")))
                    return
                }
                completion(Result.success(SignupResult(data: (response.data?.signup.asAuthSuccess)!)))
            case .failure(let error):
                // Network error
                completion(Result.failure(GraphQLError(error: error.localizedDescription)))
            }
        }
    }
    
    func login(
        email: String,
        password: String,
        completion: @escaping (Result<LoginResult, GraphQLError>) -> Void
    ) {
        self.client.perform(mutation: LoginMutation(email: email, password: password)) { result in
            switch result {
            case .success(let response):
                if let errors = response.errors {
                    completion(Result.failure(GraphQLError(error: errors[0].message ?? "")))
                    return
                }
                completion(Result.success(LoginResult(data: (response.data?.login.asAuthSuccess)!)))
            case .failure(let error):
                completion(Result.failure(GraphQLError(error: error.localizedDescription)))
            }
        }
    }
    
    func refreshAccessToken(refreshToken: String, completion: @escaping (Result<RefreshAccessTokenResult, GraphQLError>) -> Void) {
        self.client.perform(mutation: RefreshAccessTokenMutation(refreshToken: "Bearer " + refreshToken)) { result in
            switch result {
            case .success(let response):
                if let errors = response.errors {
                    completion(Result.failure(GraphQLError(error: errors[0].message ?? "")))
                    return
                }
                completion(Result.success(RefreshAccessTokenResult(accessToken: (response.data?.refreshAccessToken.accessToken)!)))
            case .failure(let error):
                // Network error
                completion(Result.failure(GraphQLError(error: error.localizedDescription)))
            }

        }
    }
}
