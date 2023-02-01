// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension WorkoutLoggerAPI {
  class DeleteSetMutation: GraphQLMutation {
    public static let operationName: String = "DeleteSet"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        """
        mutation DeleteSet($setId: ID!) {
          deleteSet(setId: $setId)
        }
        """
      ))

    public var setId: ID

    public init(setId: ID) {
      self.setId = setId
    }

    public var __variables: Variables? { ["setId": setId] }

    public struct Data: WorkoutLoggerAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.Mutation }
      public static var __selections: [Selection] { [
        .field("deleteSet", Int.self, arguments: ["setId": .variable("setId")]),
      ] }

      public var deleteSet: Int { __data["deleteSet"] }
    }
  }

}