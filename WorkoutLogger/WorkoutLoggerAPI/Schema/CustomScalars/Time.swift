// @generated
// This file was automatically generated and can be edited to
// implement advanced custom scalar functionality.
//
// Any changes to this file will not be overwritten by future
// code generation execution.

import Foundation
import ApolloAPI

public extension WorkoutLoggerAPI {
    typealias Time = Foundation.Date
}

extension Foundation.Date: CustomScalarType {
    public init (_jsonValue value: JSONValue) throws {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        
        guard let dateString = value as? String, let date = formatter.date(from: dateString) else {
            throw JSONDecodingError.couldNotConvert(value: value, to: Foundation.Date.self)
        }
        
        self = date
    }
    
    public var _jsonValue: JSONValue {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        return formatter.string(from: self)
    }
}
