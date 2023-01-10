// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension WorkoutLoggerAPI {
  class AddSetMutation: GraphQLMutation {
    public static let operationName: String = "AddSet"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        """
        mutation AddSet($exerciseId: ID!, $set: SetEntryInput!) {
          addSet(exerciseId: $exerciseId, set: $set)
        }
        """
      ))

    public var exerciseId: ID
    public var set: SetEntryInput

    public init(
      exerciseId: ID,
      set: SetEntryInput
    ) {
      self.exerciseId = exerciseId
      self.set = set
    }

    public var __variables: Variables? { [
      "exerciseId": exerciseId,
      "set": set
    ] }

    public struct Data: WorkoutLoggerAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.Mutation }
      public static var __selections: [Selection] { [
        .field("addSet", ID.self, arguments: [
          "exerciseId": .variable("exerciseId"),
          "set": .variable("set")
        ]),
      ] }

      public var addSet: ID { __data["addSet"] }
    }
  }

}