//
//  WorkoutLoggerUITests.swift
//  WorkoutLoggerUITests
//
//  Created by Neil Viloria on 2022-11-17.
//

import XCTest

final class WorkoutLoggerUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = true

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLogin() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        let usernameField = app.textFields["Email"]
        usernameField.tap()
        usernameField.typeText("test@test.com")

        let passwordField = app.secureTextFields["Password"]
        passwordField.tap()
        passwordField.typeText("password")

        let loginButton = app.buttons["Login"]
        XCTAssert(loginButton.exists)
        
        loginButton.tap()
    }
    
    func testSignup() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        let createAccountButton = app.buttons["Create an account"]
        XCTAssert(createAccountButton.exists)
        createAccountButton.tap()

        let nameField = app.textFields["Name"]
        nameField.tap()
        nameField.typeText("jimmy")

        let usernameField = app.textFields["signup.emailTextField"]
        usernameField.tap()
        usernameField.typeText("test@test.com")

        let passwordField = app.secureTextFields["signup.passwordSecureField"]
        passwordField.tap()
        passwordField.typeText("password")

        let confirmPasswordField = app.secureTextFields["Confirm Password"]
        confirmPasswordField.tap()
        confirmPasswordField.typeText("password")

        let signupButton = app.buttons["Create account"]
        XCTAssert(signupButton.exists)

        signupButton.tap()
    }
}
