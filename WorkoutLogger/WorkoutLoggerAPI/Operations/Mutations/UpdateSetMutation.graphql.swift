// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension WorkoutLoggerAPI {
  class UpdateSetMutation: GraphQLMutation {
    public static let operationName: String = "UpdateSet"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        """
        mutation UpdateSet($setId: ID!, $set: UpdateSetEntryInput!) {
          updateSet(setId: $setId, set: $set) {
            __typename
            ...setEntryFull
          }
        }
        """,
        fragments: [SetEntryFull.self]
      ))

    public var setId: ID
    public var set: UpdateSetEntryInput

    public init(
      setId: ID,
      set: UpdateSetEntryInput
    ) {
      self.setId = setId
      self.set = set
    }

    public var __variables: Variables? { [
      "setId": setId,
      "set": set
    ] }

    public struct Data: WorkoutLoggerAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.Mutation }
      public static var __selections: [Selection] { [
        .field("updateSet", UpdateSet.self, arguments: [
          "setId": .variable("setId"),
          "set": .variable("set")
        ]),
      ] }

      public var updateSet: UpdateSet { __data["updateSet"] }

      /// UpdateSet
      ///
      /// Parent Type: `SetEntry`
      public struct UpdateSet: WorkoutLoggerAPI.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.SetEntry }
        public static var __selections: [Selection] { [
          .fragment(SetEntryFull.self),
        ] }

        public var id: ID { __data["id"] }
        public var reps: Int { __data["reps"] }
        public var weight: Double { __data["weight"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public var setEntryFull: SetEntryFull { _toFragment() }
        }
      }
    }
  }

}