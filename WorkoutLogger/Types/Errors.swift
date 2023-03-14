//
//  Errors.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-22.
//

import Foundation

struct GraphQLAPIError: Error {
    var error = ""
}

enum WorkoutLoggerError: LocalizedError {
    case GraphQLError(gqlError: String?)
    case parsingError
    case networkError
    case notYetReceived
    case unauthenticated // no tokens found
    case refreshTokenInvalid // invalid or expired refresh token
    case unknown

    var errorDescription: String? {
        switch self {
        case .networkError:
            return "Sorry, there is was an issue reaching the server"
        case .GraphQLError(let gqlError):
            let errMessage = "Sorry, something went wrong with the request"
            if let err = gqlError {
                return "Something went wrong - \(err)"
            }
            return errMessage
        case .unauthenticated:
            return "you are not authenticated"
        case .refreshTokenInvalid:
            return "your token has expired or is invalid"
        case .unknown, .parsingError, .notYetReceived:
            return "Sorry, something went wrong"
        }
    }
}
