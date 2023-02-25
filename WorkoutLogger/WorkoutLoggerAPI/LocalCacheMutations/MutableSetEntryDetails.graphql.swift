// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension WorkoutLoggerAPI {
  struct MutableSetEntryDetails: WorkoutLoggerAPI.MutableSelectionSet, Fragment {
    public static var fragmentDefinition: StaticString { """
      fragment MutableSetEntryDetails on SetEntry {
        __typename
        id
        weight
        reps
      }
      """ }

    public var __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.SetEntry }
    public static var __selections: [Selection] { [
      .field("id", ID.self),
      .field("weight", Double.self),
      .field("reps", Int.self),
    ] }

    public var id: ID {
      get { __data["id"] }
      set { __data["id"] = newValue }
    }
    public var weight: Double {
      get { __data["weight"] }
      set { __data["weight"] = newValue }
    }
    public var reps: Int {
      get { __data["reps"] }
      set { __data["reps"] = newValue }
    }
  }

}