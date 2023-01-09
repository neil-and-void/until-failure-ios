// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension WorkoutLoggerAPI {
  class RefreshAccessTokenMutation: GraphQLMutation {
    public static let operationName: String = "RefreshAccessToken"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        """
        mutation RefreshAccessToken($refreshToken: String!) {
          refreshAccessToken(refreshToken: $refreshToken) {
            __typename
            accessToken
          }
        }
        """
      ))

    public var refreshToken: String

    public init(refreshToken: String) {
      self.refreshToken = refreshToken
    }

    public var __variables: Variables? { ["refreshToken": refreshToken] }

    public struct Data: WorkoutLoggerAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.Mutation }
      public static var __selections: [Selection] { [
        .field("refreshAccessToken", RefreshAccessToken.self, arguments: ["refreshToken": .variable("refreshToken")]),
      ] }

      public var refreshAccessToken: RefreshAccessToken { __data["refreshAccessToken"] }

      /// RefreshAccessToken
      ///
      /// Parent Type: `RefreshSuccess`
      public struct RefreshAccessToken: WorkoutLoggerAPI.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.RefreshSuccess }
        public static var __selections: [Selection] { [
          .field("accessToken", String.self),
        ] }

        public var accessToken: String { __data["accessToken"] }
      }
    }
  }

}