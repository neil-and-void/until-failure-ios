//
//  TokenInterceptor.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-22.
//

import Foundation
import Apollo

class TokenInterceptor: ApolloInterceptor {
    private let keychainService: KeychainServiceProtocol
    private let authService: AuthServiceProtocol
    
    enum UserError: Error {
        case noUserLoggedIn
    }
    
    init(keychainService: KeychainServiceProtocol, authService: AuthServiceProtocol) {
        self.keychainService = keychainService
        self.authService = authService
    }
    
    private func addTokenAndProceed<Operation: GraphQLOperation>(
        _ token: String,
        to request: HTTPRequest<Operation>,
        chain: RequestChain,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void
    ) {
        request.addHeader(name: "Authorization", value: "Bearer \(token)")
        chain.proceedAsync(request: request,
                           response: response,
                           completion: completion)
    }
    
    func interceptAsync<Operation: GraphQLOperation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void
    ) {
        
        guard let tokens = self.keychainService.read(
            service: WORKOUT_LOGGER_KEYCHAIN_SERVICE,
            account: WORKOUT_LOGGER_KEYCHAIN_ACCOUNT,
            type: AuthTokens.self
        ) else {
            // the error handler, then return to prevent further work
            chain.handleErrorAsync(
                UserError.noUserLoggedIn,
                request: request,
                response: response,
                completion: completion
            )
            return
        }
        
        self.addTokenAndProceed(
            tokens.accessToken,
            to: request,
            chain: chain,
            response: response,
            completion: completion
        )
    }
}

class RefreshTokenInterceptor: ApolloInterceptor {
    private let keychainService: KeychainServiceProtocol
    private let authService: AuthServiceProtocol
    
    enum RefreshTokenError: Error {
        case notYetReceived
        case unauthenticated // no tokens found
        case refreshTokenInvalid // invalid or expired refresh token
    }
    
    init(keychainService: KeychainServiceProtocol, authService: AuthServiceProtocol) {
        self.keychainService = keychainService
        self.authService = authService
    }
    
    /*
     intercepts an unauthorized response and attempts to refresh the access token
     */
    func interceptAsync<Operation>(
        chain: Apollo.RequestChain,
        request: Apollo.HTTPRequest<Operation>,
        response: Apollo.HTTPResponse<Operation>?,
        completion: @escaping (Result<Apollo.GraphQLResult<Operation.Data>, Error>) -> Void
    ) where Operation: GraphQLOperation {
        guard let receivedResponse = response else {
            chain.handleErrorAsync(
                RefreshTokenError.notYetReceived,
                request: request,
                response: response,
                completion: completion
            )
            return
        }

        let code = receivedResponse.parsedResponse?.errors?[0].extensions?["code"] as? String ?? ""
        let tokens = self.keychainService.read(
            service: WORKOUT_LOGGER_KEYCHAIN_SERVICE,
            account: WORKOUT_LOGGER_KEYCHAIN_ACCOUNT,
            type: AuthTokens.self
        )
        if tokens == nil {
            chain.handleErrorAsync(
                RefreshTokenError.unauthenticated,
                request: request,
                response: response,
                completion: completion
            )
            return
        }
       
        // attempt refreshing the access token if we get unauthorized response
        if code == "UNAUTHORIZED" {
            self.authService.refreshAccessToken(refreshToken: tokens!.refreshToken) { result in
                switch result {
                case .success(let result):
                    let tokens = AuthTokens(
                        accessToken: result,
                        refreshToken: tokens!.refreshToken
                    )
                    self.keychainService.save(
                        tokens,
                        service: WORKOUT_LOGGER_KEYCHAIN_SERVICE,
                        account: WORKOUT_LOGGER_KEYCHAIN_ACCOUNT
                    )
                    chain.retry(request: request, completion: completion)
                case .failure(let err):
                    chain.handleErrorAsync(
                        err,
                        request: request,
                        response: response,
                        completion: completion
                    )
                    return
                }
            }
        } else {
            chain.proceedAsync(
                request: request,
                response: response,
                completion: completion
            )
        }
    }
}
