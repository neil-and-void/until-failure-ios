// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension WorkoutLoggerAPI {
  class ResendVerificatCodeMutation: GraphQLMutation {
    public static let operationName: String = "ResendVerificatCode"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        """
        mutation ResendVerificatCode($email: String!) {
          resendVerificationCode(email: $email)
        }
        """
      ))

    public var email: String

    public init(email: String) {
      self.email = email
    }

    public var __variables: Variables? { ["email": email] }

    public struct Data: WorkoutLoggerAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.Mutation }
      public static var __selections: [Selection] { [
        .field("resendVerificationCode", Bool.self, arguments: ["email": .variable("email")]),
      ] }

      public var resendVerificationCode: Bool { __data["resendVerificationCode"] }
    }
  }

}