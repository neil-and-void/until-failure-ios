//
//  SignupViewModelTests.swift
//  WorkoutLoggerTests
//
//  Created by Neil Viloria on 2022-11-28.
//

import XCTest
@testable import WorkoutLogger

final class SignupViewModelTests: XCTestCase {
    var signupViewModel: SignupViewModel!
    var mockAuthService: MockAuthenticationService!
    
    override func setUp() {
        super.setUp()
        mockAuthService = MockAuthenticationService()
        signupViewModel = SignupViewModel(service: mockAuthService)
    }

    func testSignupSuccess() {
        signupViewModel.submit(setAuth: { result in })

        XCTAssertNil(signupViewModel.error)
    }

    func testSignupFailed_NetworkError() {
        mockAuthService.authResult = .failure(APIError.networkError)

        signupViewModel.submit(setAuth: { result in })

        XCTAssertEqual(APIError.networkError.localizedDescription, signupViewModel.error)
    }

    func testSignupFailed_GraphQLError() {
        mockAuthService.authResult = .failure(APIError.GraphQLError(gqlError: "graphql error"))

        signupViewModel.submit(setAuth: { result in })

        XCTAssertEqual(APIError.GraphQLError(gqlError: "graphql error").localizedDescription, signupViewModel.error)
    }

    func testSignupFailed_UnknownError() {
        mockAuthService.authResult = .failure(APIError.unknown)

        signupViewModel.submit(setAuth: { result in })

        XCTAssertEqual(APIError.unknown.localizedDescription, signupViewModel.error)
    }
}
