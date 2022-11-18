//
//  AuthService.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-17.
//

import Foundation
import Apollo

protocol AuthServiceProtocol {
    func signup(email: String, name: String, password: String, confirmPassword: String)
    func login(email: String, password: String)
}

final class AuthService: AuthServiceProtocol {
    private var client: ApolloClient
    
    init(client: ApolloClient = ApolloClient(url: URL(string: "http://localhost:8080/query")!)) {
        self.client = client
    }
    
    func signup(email: String, name: String, password: String, confirmPassword: String) {
        self.client.perform(mutation: SignupMutation(
            email: email,
            name: name,
            password: password,
            confirmPassword: confirmPassword)
        ) { result in
            switch result {
            case .success(let graphQLResult):
                let refreshToken: String = graphQLResult.data?.signup.asAuthSuccess?.refreshToken ?? ""
                let accessToken: String = graphQLResult.data?.signup.asAuthSuccess?.accessToken ?? ""
                print(refreshToken, accessToken)
            case .failure(let error):
                print("Failure! Error: \(error)")
            }
        }
    }
    
    func login(email: String, password: String) {
        self.client.perform(mutation: LoginMutation(email: email, password: password)) { result in
            switch result {
            case .success(let graphQLResult):
                if ((graphQLResult.errors != nil) && graphQLResult.errors!.count != 0) {
                    print(graphQLResult.errors?[0] ?? "something")
                }
                let refreshToken: String = graphQLResult.data?.login.asAuthSuccess?.refreshToken ?? ""
                let accessToken: String = graphQLResult.data?.login.asAuthSuccess?.accessToken ?? ""
                print(refreshToken, accessToken)
            case .failure:
                print("Something went wrong")
            }

        }
    }
}
