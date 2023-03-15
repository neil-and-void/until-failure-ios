// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension WorkoutLoggerAPI {
  struct UserFull: WorkoutLoggerAPI.SelectionSet, Fragment {
    public static var fragmentDefinition: StaticString { """
      fragment userFull on User {
        __typename
        id
        email
        name
      }
      """ }

    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.User }
    public static var __selections: [Selection] { [
      .field("id", ID.self),
      .field("email", String.self),
      .field("name", String.self),
    ] }

    public var id: ID { __data["id"] }
    public var email: String { __data["email"] }
    public var name: String { __data["name"] }
  }

}