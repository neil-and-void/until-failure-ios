//
//  ResultTypes.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-18.
//

import Foundation

struct GraphQLError: Error {
    var error = ""
}

struct SignupResult {
    var data = SignupMutation.Data.Signup.AsAuthSuccess(refreshToken: "", accessToken: "")
}

struct LoginResult {
    var data = LoginMutation.Data.Login.AsAuthSuccess(refreshToken: "", accessToken: "")
}
