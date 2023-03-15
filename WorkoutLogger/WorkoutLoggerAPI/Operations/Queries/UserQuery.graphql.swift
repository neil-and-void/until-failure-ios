// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension WorkoutLoggerAPI {
  class UserQuery: GraphQLQuery {
    public static let operationName: String = "User"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        """
        query User {
          user {
            __typename
            ...userFull
          }
        }
        """,
        fragments: [UserFull.self]
      ))

    public init() {}

    public struct Data: WorkoutLoggerAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.Query }
      public static var __selections: [Selection] { [
        .field("user", User.self),
      ] }

      public var user: User { __data["user"] }

      /// User
      ///
      /// Parent Type: `User`
      public struct User: WorkoutLoggerAPI.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.User }
        public static var __selections: [Selection] { [
          .fragment(UserFull.self),
        ] }

        public var id: ID { __data["id"] }
        public var email: String { __data["email"] }
        public var name: String { __data["name"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public var userFull: UserFull { _toFragment() }
        }
      }
    }
  }

}