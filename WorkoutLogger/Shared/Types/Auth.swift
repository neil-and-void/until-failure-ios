//
//  Auth.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-19.
//

import Foundation

struct AuthTokens: Codable {
    let accessToken: String
    let refreshToken: String
}
