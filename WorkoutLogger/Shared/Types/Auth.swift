//
//  Auth.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-19.
//

import Foundation

// this is what we use to store in key chain
struct AuthTokens: Codable {
    let accessToken: String
    let refreshToken: String
}
