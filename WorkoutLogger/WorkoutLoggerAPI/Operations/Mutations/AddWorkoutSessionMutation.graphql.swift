// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension WorkoutLoggerAPI {
  class AddWorkoutSessionMutation: GraphQLMutation {
    public static let operationName: String = "AddWorkoutSession"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        """
        mutation AddWorkoutSession($workout: WorkoutSessionInput!) {
          addWorkoutSession(workout: $workout) {
            __typename
            ...workoutSessionFull
          }
        }
        """,
        fragments: [WorkoutSessionFull.self, ExerciseFull.self, ExerciseDetails.self, SetEntryFull.self, ExerciseRoutineFull.self, PrevExerciseFull.self]
      ))

    public var workout: WorkoutSessionInput

    public init(workout: WorkoutSessionInput) {
      self.workout = workout
    }

    public var __variables: Variables? { ["workout": workout] }

    public struct Data: WorkoutLoggerAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.Mutation }
      public static var __selections: [Selection] { [
        .field("addWorkoutSession", AddWorkoutSession.self, arguments: ["workout": .variable("workout")]),
      ] }

      public var addWorkoutSession: AddWorkoutSession { __data["addWorkoutSession"] }

      /// AddWorkoutSession
      ///
      /// Parent Type: `WorkoutSession`
      public struct AddWorkoutSession: WorkoutLoggerAPI.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.WorkoutSession }
        public static var __selections: [Selection] { [
          .fragment(WorkoutSessionFull.self),
        ] }

        public var id: ID { __data["id"] }
        public var start: Time { __data["start"] }
        public var end: Time? { __data["end"] }
        public var workoutRoutine: WorkoutSessionFull.WorkoutRoutine { __data["workoutRoutine"] }
        public var exercises: [Exercise] { __data["exercises"] }
        public var prevExercises: [PrevExercise] { __data["prevExercises"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public var workoutSessionFull: WorkoutSessionFull { _toFragment() }
        }

        /// AddWorkoutSession.Exercise
        ///
        /// Parent Type: `Exercise`
        public struct Exercise: WorkoutLoggerAPI.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.Exercise }

          public var id: ID { __data["id"] }
          public var notes: String { __data["notes"] }
          public var sets: [Set] { __data["sets"] }
          public var exerciseRoutine: ExerciseRoutine { __data["exerciseRoutine"] }

          public struct Fragments: FragmentContainer {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public var exerciseDetails: ExerciseDetails { _toFragment() }
            public var exerciseFull: ExerciseFull { _toFragment() }
          }

          /// AddWorkoutSession.Exercise.Set
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

          /// AddWorkoutSession.Exercise.ExerciseRoutine
          ///
          /// Parent Type: `ExerciseRoutine`
          public struct ExerciseRoutine: WorkoutLoggerAPI.SelectionSet {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.ExerciseRoutine }

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

        /// AddWorkoutSession.PrevExercise
        ///
        /// Parent Type: `Exercise`
        public struct PrevExercise: WorkoutLoggerAPI.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.Exercise }

          public var id: ID { __data["id"] }
          public var notes: String { __data["notes"] }
          public var sets: [Set] { __data["sets"] }
          public var exerciseRoutine: PrevExerciseFull.ExerciseRoutine { __data["exerciseRoutine"] }

          public struct Fragments: FragmentContainer {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public var exerciseDetails: ExerciseDetails { _toFragment() }
            public var prevExerciseFull: PrevExerciseFull { _toFragment() }
          }

          /// AddWorkoutSession.PrevExercise.Set
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
  }

}