// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension WorkoutLoggerAPI {
  struct MutableExerciseRoutineDetails: WorkoutLoggerAPI.MutableSelectionSet, Fragment {
    public static var fragmentDefinition: StaticString { """
      fragment MutableExerciseRoutineDetails on ExerciseRoutine {
        __typename
        id
        active
        name
        sets
        reps
      }
      """ }

    public var __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.ExerciseRoutine }
    public static var __selections: [Selection] { [
      .field("id", ID.self),
      .field("active", Bool.self),
      .field("name", String.self),
      .field("sets", Int.self),
      .field("reps", Int.self),
    ] }

    public var id: ID {
      get { __data["id"] }
      set { __data["id"] = newValue }
    }
    public var active: Bool {
      get { __data["active"] }
      set { __data["active"] = newValue }
    }
    public var name: String {
      get { __data["name"] }
      set { __data["name"] = newValue }
    }
    public var sets: Int {
      get { __data["sets"] }
      set { __data["sets"] = newValue }
    }
    public var reps: Int {
      get { __data["reps"] }
      set { __data["reps"] = newValue }
    }
  }

}