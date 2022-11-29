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

enum APIError: LocalizedError {
    case networkError
    case GraphQLError(gqlError: String?)
    case unknown

    var localizedDescription: String {
        switch self {
        case .networkError:
            return "Sorry, there is was an issue reaching the server"
        case .GraphQLError(let gqlError):
            var errMessage = "Sorry, something went wrong with the request"
            if let err = gqlError {
                errMessage = "Sorry, someting went wrong: \(err)"
            }
            return errMessage
        case .unknown:
            return "Sorry, something went wrong"
        }
    }
}
