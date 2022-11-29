//
//  AuthService.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-17.
//

import Foundation
import Apollo

protocol AuthServiceProtocol {
    func signup(email: String, name: String, password: String, confirmPassword: String, completion: @escaping (Result<SignupResult, APIError>) -> Void)
    func login(email: String, password: String, completion: @escaping (Result<LoginResult, APIError>) -> Void)
    func refreshAccessToken(refreshToken: String, completion: @escaping (Result<RefreshAccessTokenResult, APIError>) -> Void)
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
        completion: @escaping (Result<SignupResult, APIError>) -> Void
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
                    let error = APIError.GraphQLError(gqlError: errors[0].message)
                    completion(Result.failure(error))
                    return
                }
                completion(Result.success(SignupResult(data: (response.data?.signup.asAuthSuccess)!)))
            case .failure:
                completion(Result.failure(APIError.networkError))
            }
        }
    }
    
    func login(
        email: String,
        password: String,
        completion: @escaping (Result<LoginResult, APIError>) -> Void
    ) {
        self.client.perform(mutation: LoginMutation(email: email, password: password)) { result in
            switch result {
            case .success(let response):
                if let errors = response.errors {
                    let error = APIError.GraphQLError(gqlError: errors[0].message)
                    completion(Result.failure(error))
                    return
                }
                completion(Result.success(LoginResult(data: (response.data?.login.asAuthSuccess)!)))
            case .failure:
                completion(Result.failure(APIError.networkError))
            }
        }
    }
    
    func refreshAccessToken(refreshToken: String, completion: @escaping (Result<RefreshAccessTokenResult, APIError>) -> Void) {
        self.client.perform(mutation: RefreshAccessTokenMutation(refreshToken: "Bearer " + refreshToken)) { result in
            switch result {
            case .success(let response):
                if let errors = response.errors {
                    let error = APIError.GraphQLError(gqlError: errors[0].message)
                    completion(Result.failure(error))
                    return
                }
                completion(Result.success(RefreshAccessTokenResult(accessToken: (response.data?.refreshAccessToken.accessToken)!)))
            case .failure:
                completion(Result.failure(APIError.networkError))
            }

        }
    }
}
