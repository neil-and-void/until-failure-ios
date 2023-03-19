// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension WorkoutLoggerAPI {
  class ResetPasswordMutation: GraphQLMutation {
    public static let operationName: String = "ResetPassword"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        """
        mutation ResetPassword($passwordResetCredentials: PasswordResetCredentials!) {
          resetPassword(passwordResetCredentials: $passwordResetCredentials)
        }
        """
      ))

    public var passwordResetCredentials: PasswordResetCredentials

    public init(passwordResetCredentials: PasswordResetCredentials) {
      self.passwordResetCredentials = passwordResetCredentials
    }

    public var __variables: Variables? { ["passwordResetCredentials": passwordResetCredentials] }

    public struct Data: WorkoutLoggerAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.Mutation }
      public static var __selections: [Selection] { [
        .field("resetPassword", Bool.self, arguments: ["passwordResetCredentials": .variable("passwordResetCredentials")]),
      ] }

      public var resetPassword: Bool { __data["resetPassword"] }
    }
  }

}