// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension WorkoutLoggerAPI {
  struct SetEntryFull: WorkoutLoggerAPI.SelectionSet, Fragment {
    public static var fragmentDefinition: StaticString { """
      fragment setEntryFull on SetEntry {
        __typename
        id
        reps
        weight
      }
      """ }

    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.SetEntry }
    public static var __selections: [Selection] { [
      .field("id", ID.self),
      .field("reps", Int.self),
      .field("weight", Double.self),
    ] }

    public var id: ID { __data["id"] }
    public var reps: Int { __data["reps"] }
    public var weight: Double { __data["weight"] }
  }

}