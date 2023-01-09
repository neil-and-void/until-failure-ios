// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension WorkoutLoggerAPI {
  class SignupMutation: GraphQLMutation {
    public static let operationName: String = "Signup"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        """
        mutation Signup($signupInput: SignupInput!) {
          signup(signupInput: $signupInput) {
            __typename
            refreshToken
            accessToken
          }
        }
        """
      ))

    public var signupInput: SignupInput

    public init(signupInput: SignupInput) {
      self.signupInput = signupInput
    }

    public var __variables: Variables? { ["signupInput": signupInput] }

    public struct Data: WorkoutLoggerAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.Mutation }
      public static var __selections: [Selection] { [
        .field("signup", Signup.self, arguments: ["signupInput": .variable("signupInput")]),
      ] }

      public var signup: Signup { __data["signup"] }

      /// Signup
      ///
      /// Parent Type: `AuthResult`
      public struct Signup: WorkoutLoggerAPI.SelectionSet {
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