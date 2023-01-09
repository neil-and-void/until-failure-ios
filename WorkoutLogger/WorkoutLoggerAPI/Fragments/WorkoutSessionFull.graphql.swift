// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension WorkoutLoggerAPI {
  struct WorkoutSessionFull: WorkoutLoggerAPI.SelectionSet, Fragment {
    public static var fragmentDefinition: StaticString { """
      fragment workoutSessionFull on WorkoutSession {
        __typename
        id
        start
        end
        workoutRoutine {
          __typename
          id
          name
        }
        exercises {
          __typename
          ...exerciseDetails
          exerciseRoutine {
            __typename
            ...exerciseRoutineFull
          }
        }
        prevExercises {
          __typename
          ...exerciseDetails
        }
      }
      """ }

    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.WorkoutSession }
    public static var __selections: [Selection] { [
      .field("id", ID.self),
      .field("start", Time.self),
      .field("end", Time?.self),
      .field("workoutRoutine", WorkoutRoutine.self),
      .field("exercises", [Exercise].self),
      .field("prevExercises", [PrevExercise].self),
    ] }

    public var id: ID { __data["id"] }
    public var start: Time { __data["start"] }
    public var end: Time? { __data["end"] }
    public var workoutRoutine: WorkoutRoutine { __data["workoutRoutine"] }
    public var exercises: [Exercise] { __data["exercises"] }
    public var prevExercises: [PrevExercise] { __data["prevExercises"] }

    /// WorkoutRoutine
    ///
    /// Parent Type: `WorkoutRoutine`
    public struct WorkoutRoutine: WorkoutLoggerAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.WorkoutRoutine }
      public static var __selections: [Selection] { [
        .field("id", ID.self),
        .field("name", String.self),
      ] }

      public var id: ID { __data["id"] }
      public var name: String { __data["name"] }
    }

    /// Exercise
    ///
    /// Parent Type: `Exercise`
    public struct Exercise: WorkoutLoggerAPI.SelectionSet {
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

      /// Exercise.ExerciseRoutine
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
      /// Exercise.Set
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

    /// PrevExercise
    ///
    /// Parent Type: `Exercise`
    public struct PrevExercise: WorkoutLoggerAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.Exercise }
      public static var __selections: [Selection] { [
        .fragment(ExerciseDetails.self),
      ] }

      public var id: ID { __data["id"] }
      public var notes: String { __data["notes"] }
      public var sets: [Set] { __data["sets"] }

      public struct Fragments: FragmentContainer {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public var exerciseDetails: ExerciseDetails { _toFragment() }
      }

      /// PrevExercise.Set
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

}