// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension WorkoutLoggerAPI {
  struct WorkoutRoutineFull: WorkoutLoggerAPI.SelectionSet, Fragment {
    public static var fragmentDefinition: StaticString { """
      fragment workoutRoutineFull on WorkoutRoutine {
        __typename
        id
        name
        active
        exerciseRoutines {
          __typename
          ...exerciseRoutineFull
        }
      }
      """ }

    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.WorkoutRoutine }
    public static var __selections: [Selection] { [
      .field("id", ID.self),
      .field("name", String.self),
      .field("active", Bool.self),
      .field("exerciseRoutines", [ExerciseRoutine].self),
    ] }

    public var id: ID { __data["id"] }
    public var name: String { __data["name"] }
    public var active: Bool { __data["active"] }
    public var exerciseRoutines: [ExerciseRoutine] { __data["exerciseRoutines"] }

    /// ExerciseRoutine
    ///
    /// Parent Type: `ExerciseRoutine`
    public struct ExerciseRoutine: WorkoutLoggerAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.ExerciseRoutine }
      public static var __selections: [Selection] { [
        .fragment(ExerciseRoutineFull.self),
      ] }

      public var id: ID { __data["id"] }
      public var active: Bool { __data["active"] }
      public var name: String { __data["name"] }
      public var sets: Int { __data["sets"] }
      public var reps: Int { __data["reps"] }

      public struct Fragments: FragmentContainer {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public var exerciseRoutineFull: ExerciseRoutineFull { _toFragment() }
      }
    }
  }

}