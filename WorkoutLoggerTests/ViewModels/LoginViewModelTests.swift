//
//  LoginViewModelTests.swift
//  WorkoutLoggerTests
//
//  Created by Neil Viloria on 2022-11-28.
//

import XCTest
@testable import WorkoutLogger

final class LoginViewModelTests: XCTestCase {
    var loginViewModel: LoginViewModel!
    var mockAuthService: MockAuthenticationService!
    
    override func setUp() {
        super.setUp()
        mockAuthService = MockAuthenticationService()
        loginViewModel = LoginViewModel(service: mockAuthService)
    }

    func testLoginSuccess() {
        loginViewModel.submit(setAuth: { result in })

        XCTAssertNil(loginViewModel.error)
    }
    
    func testLoginFailed_NetworkError() {
        mockAuthService.authResult = .failure(APIError.networkError)

        loginViewModel.submit(setAuth: { result in })

        XCTAssertEqual(APIError.networkError.localizedDescription, loginViewModel.error)
    }
    
    func testLoginFailed_GraphQLError() {
        mockAuthService.authResult = .failure(APIError.GraphQLError(gqlError: "graphql error"))

        loginViewModel.submit(setAuth: { result in })

        XCTAssertEqual(APIError.GraphQLError(gqlError: "graphql error").localizedDescription, loginViewModel.error)
    }
    
    func testLoginFailed_UnknownError() {
        mockAuthService.authResult = .failure(APIError.unknown)

        loginViewModel.submit(setAuth: { result in })

        XCTAssertEqual(APIError.unknown.localizedDescription, loginViewModel.error)
    }
}
