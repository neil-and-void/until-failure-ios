// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension WorkoutLoggerAPI {
  class WorkoutSessionQuery: GraphQLQuery {
    public static let operationName: String = "WorkoutSession"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        """
        query WorkoutSession($workoutSessionId: ID!) {
          workoutSession(workoutSessionId: $workoutSessionId) {
            __typename
            ...workoutSessionFull
          }
        }
        """,
        fragments: [WorkoutSessionFull.self, ExerciseDetails.self, SetEntryFull.self, ExerciseRoutineFull.self, PrevExerciseFull.self]
      ))

    public var workoutSessionId: ID

    public init(workoutSessionId: ID) {
      self.workoutSessionId = workoutSessionId
    }

    public var __variables: Variables? { ["workoutSessionId": workoutSessionId] }

    public struct Data: WorkoutLoggerAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.Query }
      public static var __selections: [Selection] { [
        .field("workoutSession", WorkoutSession.self, arguments: ["workoutSessionId": .variable("workoutSessionId")]),
      ] }

      public var workoutSession: WorkoutSession { __data["workoutSession"] }

      /// WorkoutSession
      ///
      /// Parent Type: `WorkoutSession`
      public struct WorkoutSession: WorkoutLoggerAPI.SelectionSet {
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

        /// WorkoutSession.Exercise
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
          }

          /// WorkoutSession.Exercise.Set
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

          /// WorkoutSession.Exercise.ExerciseRoutine
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

        /// WorkoutSession.PrevExercise
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

          /// WorkoutSession.PrevExercise.Set
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