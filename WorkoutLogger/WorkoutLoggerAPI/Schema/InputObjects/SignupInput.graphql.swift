// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension WorkoutLoggerAPI {
  struct SignupInput: InputObject {
    public private(set) var __data: InputDict

    public init(_ data: InputDict) {
      __data = data
    }

    public init(
      email: String,
      name: String,
      password: String,
      confirmPassword: String
    ) {
      __data = InputDict([
        "email": email,
        "name": name,
        "password": password,
        "confirmPassword": confirmPassword
      ])
    }

    public var email: String {
      get { __data["email"] }
      set { __data["email"] = newValue }
    }

    public var name: String {
      get { __data["name"] }
      set { __data["name"] = newValue }
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