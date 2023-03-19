// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension WorkoutLoggerAPI {
  struct PasswordResetCredentials: InputObject {
    public private(set) var __data: InputDict

    public init(_ data: InputDict) {
      __data = data
    }

    public init(
      code: String,
      password: String,
      confirmPassword: String
    ) {
      __data = InputDict([
        "code": code,
        "password": password,
        "confirmPassword": confirmPassword
      ])
    }

    public var code: String {
      get { __data["code"] }
      set { __data["code"] = newValue }
    }

    public var password: String {
      get { __data["password"] }
      set { __data["password"] = newValue }
    }

    public var confirmPassword: String {
      get { __data["confirmPassword"] }
      set { __data["confirmPassword"] = newValue }
    }
  }

}