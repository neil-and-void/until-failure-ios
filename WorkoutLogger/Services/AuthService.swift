//
//  AuthService.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-17.
//

import Foundation
import Apollo

protocol AuthServiceProtocol {
    func signup(email: String, name: String, password: String, confirmPassword: String, completion: @escaping (Result<AuthResult, WorkoutLoggerError>) -> Void)
    func login(email: String, password: String, completion: @escaping (Result<AuthResult, WorkoutLoggerError>) -> Void)
    func refreshAccessToken(refreshToken: String, completion: @escaping (Result<String, WorkoutLoggerError>) -> Void)
    func resendEmailVerification(email: String, completion: @escaping (Result<Bool, WorkoutLoggerError>) -> Void)
    func sendForgotPasswordLink(email: String, completion: @escaping (Result<Bool, WorkoutLoggerError>) -> Void)
    func resetPassword(newPassword: String, confirmPassword: String, code: String, completion: @escaping (Result<Bool, WorkoutLoggerError>) -> Void)
}

final class AuthService: AuthServiceProtocol {
    private var client: ApolloClient
    
    init(client: ApolloClient = AuthAPIClient.client) {
        self.client = client
    }

    private func parseError(_ err: Error) -> WorkoutLoggerError {
        if let err = err as? WorkoutLoggerError {
            return err
        }
        return WorkoutLoggerError.unknown
    }
    
    func signup(
        email: String,
        name: String,
        password: String,
        confirmPassword: String,
        completion: @escaping (Result<AuthResult, WorkoutLoggerError>) -> Void
    ) {
        let signupInput = WorkoutLoggerAPI.SignupInput(email: email, name: name, password: password, confirmPassword: confirmPassword)
        self.client.perform(mutation: WorkoutLoggerAPI.SignupMutation(signupInput: signupInput)) { result in
            switch result {
            case .success(let response):
                if let errors = response.errors {
                    let error = WorkoutLoggerError.GraphQLError(gqlError: errors[0].message)
                    completion(Result.failure(error))
                    return
                }
                
                if let tokens = response.data?.signup {
                    let authResult = AuthResult(refreshToken: tokens.refreshToken, accessToken: tokens.accessToken)
                    completion(Result.success(authResult))
                    return
                }
                
                return completion(Result.failure(WorkoutLoggerError.unknown))
                
            case .failure:
                completion(Result.failure(WorkoutLoggerError.networkError))
            }
        }
    }
    
    func login(
        email: String,
        password: String,
        completion: @escaping (Result<AuthResult, WorkoutLoggerError>) -> Void
    ) {
        let loginInput = WorkoutLoggerAPI.LoginInput(email: email, password: password)
        self.client.perform(mutation: WorkoutLoggerAPI.LoginMutation(loginInput: loginInput)) { result in
            switch result {
            case .success(let response):
                if let errors = response.errors {
                    let error = WorkoutLoggerError.GraphQLError(gqlError: errors[0].message)
                    completion(Result.failure(error))
                    return
                }
                
                if let tokens = response.data?.login {
                    let authResult = AuthResult(refreshToken: tokens.refreshToken, accessToken: tokens.accessToken)
                    completion(Result.success(authResult))
                    return
                }
               
                // if we get here irdk whats going on
                return completion(Result.failure(WorkoutLoggerError.unknown))
                
            case .failure:
                completion(Result.failure(WorkoutLoggerError.networkError))
            }
        }
    }
    
    func refreshAccessToken(refreshToken: String, completion: @escaping (Result<String, WorkoutLoggerError>) -> Void) {
        self.client.perform(mutation: WorkoutLoggerAPI.RefreshAccessTokenMutation(refreshToken: "Bearer " + refreshToken)) { result in
            switch result {
            case .success(let response):
                if let errors = response.errors {
                    let error = WorkoutLoggerError.GraphQLError(gqlError: errors[0].message)
                    completion(Result.failure(error))
                    return
                }

                if let accessToken = response.data?.refreshAccessToken.accessToken {
                    completion(Result.success(accessToken))
                    return
                }
               
                return completion(Result.failure(WorkoutLoggerError.unknown))
                
            case .failure:
                completion(Result.failure(WorkoutLoggerError.networkError))
            }

        }
    }

    func resendEmailVerification(email: String, completion: @escaping (Result<Bool, WorkoutLoggerError>) -> Void) {
        self.client.perform(mutation: WorkoutLoggerAPI.ResendVerificationCodeMutation(email: email)) { result in
            switch result {
            case .success(let response):
                if let errors = response.errors {
                    completion(Result.failure(.GraphQLError(gqlError: errors[0].message)))
                    return
                }

                guard let deleteSuccess = response.data?.resendVerificationCode else {
                    completion(Result.failure(.unknown))
                    return
                }

                completion(.success(deleteSuccess))
                return

            case .failure(let err):
                return completion(.failure(self.parseError(err)))
            }
        }
    }

    func sendForgotPasswordLink(email: String, completion: @escaping (Result<Bool, WorkoutLoggerError>) -> Void) {
        self.client.perform(mutation: WorkoutLoggerAPI.SendForgotPasswordLinkMutation(email: email)) { result in
            switch result {
            case .success(let response):
                if let errors = response.errors {
                    completion(Result.failure(.GraphQLError(gqlError: errors[0].message)))
                    return
                }

                guard let deleteSuccess = response.data?.sendForgotPasswordLink else {
                    completion(Result.failure(.unknown))
                    return
                }

                completion(.success(deleteSuccess))
                return

            case .failure(let err):
                return completion(.failure(self.parseError(err)))
            }
        }
    }

    func resetPassword(newPassword: String, confirmPassword: String, code: String, completion: @escaping (Result<Bool, WorkoutLoggerError>) -> Void) {
        let passwordResetCredentials = WorkoutLoggerAPI.PasswordResetCredentials(code: code, password: newPassword, confirmPassword: confirmPassword)
        self.client.perform(mutation: WorkoutLoggerAPI.ResetPasswordMutation(passwordResetCredentials: passwordResetCredentials)) { result in
            switch result {
            case .success(let response):
                if let errors = response.errors {
                    completion(Result.failure(.GraphQLError(gqlError: errors[0].message)))
                    return
                }

                guard let deleteSuccess = response.data?.resetPassword else {
                    completion(Result.failure(.unknown))
                    return
                }

                completion(.success(deleteSuccess))
                return

            case .failure(let err):
                return completion(.failure(self.parseError(err)))
            }
        }
    }
}
