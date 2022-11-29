//
//  InterceptorProvider.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-22.
//

import Foundation
import Apollo

struct NetworkInterceptorProvider: InterceptorProvider {
    
    // These properties will remain the same throughout the life of the `InterceptorProvider`, even though they
    // will be handed to different interceptors.
    private let store: ApolloStore
    private let client: URLSessionClient
    private let keychainService: KeychainServiceProtocol
    private let authService: AuthServiceProtocol
    
    init(
        store: ApolloStore,
        client: URLSessionClient,
        keychainService: KeychainServiceProtocol,
        authService: AuthServiceProtocol
    ) {
        self.store = store
        self.client = client
        self.keychainService = keychainService
        self.authService = authService
    }
    
    func interceptors<Operation: GraphQLOperation>(for operation: Operation) -> [ApolloInterceptor] {
        return [
            MaxRetryInterceptor(),
            CacheReadInterceptor(store: self.store),
            TokenInterceptor(keychainService: self.keychainService, authService: self.authService),
            NetworkFetchInterceptor(client: self.client),
            ResponseCodeInterceptor(),
            JSONResponseParsingInterceptor(cacheKeyForObject: self.store.cacheKeyForObject),
            RefreshTokenInterceptor(keychainService: self.keychainService, authService: self.authService),
            AutomaticPersistedQueryInterceptor(),
            CacheWriteInterceptor(store: self.store)
        ]
    }
}
