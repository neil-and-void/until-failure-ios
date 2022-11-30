//
//  Client.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-22.
//

import Foundation
import Apollo

let GRAPHQL_API_URL = "\(baseURL)/query"

// singleton as recommended by apollo
class WorkoutLoggerAPIClient {
    static let client: ApolloClient = {
        // The cache is necessary to set up the store, which we're going
        // to hand to the provider
        let cache = InMemoryNormalizedCache()
        let store = ApolloStore(cache: cache)
        
        let client = URLSessionClient()
        let provider = NetworkInterceptorProvider(
            store: store,
            client: client,
            keychainService: KeychainService(),
            authService: AuthService()
        )
        let url = URL(string: GRAPHQL_API_URL)!
        
        let requestChainTransport = RequestChainNetworkTransport(
            interceptorProvider: provider,
            endpointURL: url
        )
        
        // Remember to give the store you already created to the client so it
        // doesn't create one on its own
        return ApolloClient(networkTransport: requestChainTransport, store: store)
    }()
    
    private init() {}
}

class AuthAPIClient{
    static let client = ApolloClient(url: URL(string: GRAPHQL_API_URL)!)
    
    private init() {}
}
