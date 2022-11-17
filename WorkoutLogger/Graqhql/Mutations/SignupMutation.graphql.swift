// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
import WorkoutLoggerAPI

public class SignupMutation: GraphQLMutation {
  public static let operationName: String = "Signup"
  public static let document: DocumentType = .notPersisted(
    definition: .init(
      """
      mutation Signup($email: String!, $name: String!, $password: String!, $confirmPassword: String!) {
        signup(
          email: $email
          name: $name
          password: $password
          confirmPassword: $confirmPassword
        ) {
          __typename
          ... on AuthSuccess {
            refreshToken
            accessToken
          }
        }
      }
      """
    ))

  public var email: String
  public var name: String
  public var password: String
  public var confirmPassword: String

  public init(
    email: String,
    name: String,
    password: String,
    confirmPassword: String
  ) {
    self.email = email
    self.name = name
    self.password = password
    self.confirmPassword = confirmPassword
  }

  public var __variables: Variables? { [
    "email": email,
    "name": name,
    "password": password,
    "confirmPassword": confirmPassword
  ] }

  public struct Data: WorkoutLoggerAPI.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.Mutation }
    public static var __selections: [Selection] { [
      .field("signup", Signup.self, arguments: [
        "email": .variable("email"),
        "name": .variable("name"),
        "password": .variable("password"),
        "confirmPassword": .variable("confirmPassword")
      ]),
    ] }

    public var signup: Signup { __data["signup"] }

    /// Signup
    ///
    /// Parent Type: `AuthResult`
    public struct Signup: WorkoutLoggerAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { WorkoutLoggerAPI.Unions.AuthResult }
      public static var __selections: [Selection] { [
        .inlineFragment(AsAuthSuccess.self),
      ] }

      public var asAuthSuccess: AsAuthSuccess? { _asInlineFragment() }

      /// Signup.AsAuthSuccess
      ///
      /// Parent Type: `AuthSuccess`
      public struct AsAuthSuccess: WorkoutLoggerAPI.InlineFragment {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.AuthSuccess }
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
