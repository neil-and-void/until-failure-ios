// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension WorkoutLoggerAPI {
  class UpdateWorkoutSessionMutation: GraphQLMutation {
    public static let operationName: String = "UpdateWorkoutSession"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        """
        mutation UpdateWorkoutSession($workoutSessionId: ID!, $updateWorkoutSessionInput: UpdateWorkoutSessionInput!) {
          updateWorkoutSession(
            workoutSessionId: $workoutSessionId
            updateWorkoutSessionInput: $updateWorkoutSessionInput
          ) {
            __typename
            ...workoutSessionFull
          }
        }
        """,
        fragments: [WorkoutSessionFull.self, ExerciseDetails.self, SetEntryFull.self, ExerciseRoutineFull.self]
      ))

    public var workoutSessionId: ID
    public var updateWorkoutSessionInput: UpdateWorkoutSessionInput

    public init(
      workoutSessionId: ID,
      updateWorkoutSessionInput: UpdateWorkoutSessionInput
    ) {
      self.workoutSessionId = workoutSessionId
      self.updateWorkoutSessionInput = updateWorkoutSessionInput
    }

    public var __variables: Variables? { [
      "workoutSessionId": workoutSessionId,
      "updateWorkoutSessionInput": updateWorkoutSessionInput
    ] }

    public struct Data: WorkoutLoggerAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.Mutation }
      public static var __selections: [Selection] { [
        .field("updateWorkoutSession", UpdateWorkoutSession.self, arguments: [
          "workoutSessionId": .variable("workoutSessionId"),
          "updateWorkoutSessionInput": .variable("updateWorkoutSessionInput")
        ]),
      ] }

      public var updateWorkoutSession: UpdateWorkoutSession { __data["updateWorkoutSession"] }

      /// UpdateWorkoutSession
      ///
      /// Parent Type: `WorkoutSession`
      public struct UpdateWorkoutSession: WorkoutLoggerAPI.SelectionSet {
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

        /// UpdateWorkoutSession.Exercise
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

          /// UpdateWorkoutSession.Exercise.Set
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

          /// UpdateWorkoutSession.Exercise.ExerciseRoutine
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

        /// UpdateWorkoutSession.PrevExercise
        ///
        /// Parent Type: `Exercise`
        public struct PrevExercise: WorkoutLoggerAPI.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.Exercise }

          public var id: ID { __data["id"] }
          public var notes: String { __data["notes"] }
          public var sets: [Set] { __data["sets"] }
          public var exerciseRoutine: WorkoutSessionFull.PrevExercise.ExerciseRoutine { __data["exerciseRoutine"] }

          public struct Fragments: FragmentContainer {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public var exerciseDetails: ExerciseDetails { _toFragment() }
          }

          /// UpdateWorkoutSession.PrevExercise.Set
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