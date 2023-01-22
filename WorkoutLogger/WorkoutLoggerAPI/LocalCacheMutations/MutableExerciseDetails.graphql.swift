// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension WorkoutLoggerAPI {
  struct MutableExerciseDetails: WorkoutLoggerAPI.MutableSelectionSet, Fragment {
    public static var fragmentDefinition: StaticString { """
      fragment MutableExerciseDetails on Exercise {
        __typename
        id
        notes
      }
      """ }

    public var __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.Exercise }
    public static var __selections: [Selection] { [
      .field("id", ID.self),
      .field("notes", String.self),
    ] }

    public var id: ID {
      get { __data["id"] }
      set { __data["id"] = newValue }
    }
    public var notes: String {
      get { __data["notes"] }
      set { __data["notes"] = newValue }
    }
  }

}