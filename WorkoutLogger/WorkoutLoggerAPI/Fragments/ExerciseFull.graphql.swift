// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension WorkoutLoggerAPI {
  struct ExerciseFull: WorkoutLoggerAPI.SelectionSet, Fragment {
    public static var fragmentDefinition: StaticString { """
      fragment exerciseFull on Exercise {
        __typename
        ...exerciseDetails
        exerciseRoutine {
          __typename
          ...exerciseRoutineFull
        }
      }
      """ }

    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.Exercise }
    public static var __selections: [Selection] { [
      .field("exerciseRoutine", ExerciseRoutine.self),
      .fragment(ExerciseDetails.self),
    ] }

    public var exerciseRoutine: ExerciseRoutine { __data["exerciseRoutine"] }
    public var id: ID { __data["id"] }
    public var notes: String { __data["notes"] }
    public var sets: [Set] { __data["sets"] }

    public struct Fragments: FragmentContainer {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public var exerciseDetails: ExerciseDetails { _toFragment() }
    }

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
    /// Set
    ///
    /// Parent Type: `SetEntry`
    public struct Set: WorkoutLoggerAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.SetEntry }

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