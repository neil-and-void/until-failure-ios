// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension WorkoutLoggerAPI {
  class LoginMutation: GraphQLMutation {
    public static let operationName: String = "Login"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        """
        mutation Login($loginInput: LoginInput!) {
          login(loginInput: $loginInput) {
            __typename
            refreshToken
            accessToken
          }
        }
        """
      ))

    public var loginInput: LoginInput

    public init(loginInput: LoginInput) {
      self.loginInput = loginInput
    }

    public var __variables: Variables? { ["loginInput": loginInput] }

    public struct Data: WorkoutLoggerAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.Mutation }
      public static var __selections: [Selection] { [
        .field("login", Login.self, arguments: ["loginInput": .variable("loginInput")]),
      ] }

      public var login: Login { __data["login"] }

      /// Login
      ///
      /// Parent Type: `AuthResult`
      public struct Login: WorkoutLoggerAPI.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.AuthResult }
        public static var __selections: [Selection] { [
          .field("refreshToken", String.self),
          .field("accessToken", String.self),
        ] }

        public var refreshToken: String { __data["refreshToken"] }
        public var accessToken: String { __data["accessToken"] }
      }
    }
  }

}