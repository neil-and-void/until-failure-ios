// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension WorkoutLoggerAPI {
  class DeleteUserMutation: GraphQLMutation {
    public static let operationName: String = "DeleteUser"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        """
        mutation DeleteUser {
          deleteUser
        }
        """
      ))

    public init() {}

    public struct Data: WorkoutLoggerAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.Mutation }
      public static var __selections: [Selection] { [
        .field("deleteUser", Int.self),
      ] }

      public var deleteUser: Int { __data["deleteUser"] }
    }
  }

}