//
//  AuthService.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-17.
//

import Foundation
import Apollo

protocol AuthServiceProtocol {
    func signup(email: String, name: String, password: String, confirmPassword: String, completion: @escaping (Result<AuthResult, APIError>) -> Void)
    func login(email: String, password: String, completion: @escaping (Result<AuthResult, APIError>) -> Void)
    func refreshAccessToken(refreshToken: String, completion: @escaping (Result<String, APIError>) -> Void)
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
        completion: @escaping (Result<AuthResult, APIError>) -> Void
    ) {
        let signupInput = SignupInput(email: email, name: name, password: password, confirmPassword: confirmPassword)
        self.client.perform(mutation: SignupMutation(signupInput: signupInput)) { result in
            switch result {
            case .success(let response):
                if let errors = response.errors {
                    let error = APIError.GraphQLError(gqlError: errors[0].message)
                    completion(Result.failure(error))
                    return
                }
                
                if let tokens = response.data?.signup {
                    let authResult = AuthResult(refreshToken: tokens.refreshToken, accessToken: tokens.accessToken)
                    completion(Result.success(authResult))
                    return
                }
                
                return completion(Result.failure(APIError.unknown))
                
            case .failure:
                completion(Result.failure(APIError.networkError))
            }
        }
    }
    
    func login(
        email: String,
        password: String,
        completion: @escaping (Result<AuthResult, APIError>) -> Void
    ) {
        let loginInput = LoginInput(email: email, password: password)
        self.client.perform(mutation: LoginMutation(loginInput: loginInput)) { result in
            switch result {
            case .success(let response):
                if let errors = response.errors {
                    let error = APIError.GraphQLError(gqlError: errors[0].message)
                    completion(Result.failure(error))
                    return
                }
                
                if let tokens = response.data?.login {
                    let authResult = AuthResult(refreshToken: tokens.refreshToken, accessToken: tokens.accessToken)
                    completion(Result.success(authResult))
                    return
                }
               
                // if we get here irdk whats going on
                return completion(Result.failure(APIError.unknown))
                
            case .failure:
                completion(Result.failure(APIError.networkError))
            }
        }
    }
    
    func refreshAccessToken(refreshToken: String, completion: @escaping (Result<String, APIError>) -> Void) {
        self.client.perform(mutation: RefreshAccessTokenMutation(refreshToken: "Bearer " + refreshToken)) { result in
            switch result {
            case .success(let response):
                if let errors = response.errors {
                    let error = APIError.GraphQLError(gqlError: errors[0].message)
                    completion(Result.failure(error))
                    return
                }

                if let accessToken = response.data?.refreshAccessToken.accessToken {
                    completion(Result.success(accessToken))
                    return
                }
               
                return completion(Result.failure(APIError.unknown))
                
            case .failure:
                completion(Result.failure(APIError.networkError))
            }

        }
    }
}
