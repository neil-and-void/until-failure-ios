// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension WorkoutLoggerAPI {
  class AddExerciseMutation: GraphQLMutation {
    public static let operationName: String = "AddExercise"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        """
        mutation AddExercise($workoutSessionId: ID!, $exercise: ExerciseInput!) {
          addExercise(workoutSessionId: $workoutSessionId, exercise: $exercise) {
            __typename
            ...exerciseFull
          }
        }
        """,
        fragments: [ExerciseFull.self, ExerciseDetails.self, SetEntryFull.self, ExerciseRoutineFull.self]
      ))

    public var workoutSessionId: ID
    public var exercise: ExerciseInput

    public init(
      workoutSessionId: ID,
      exercise: ExerciseInput
    ) {
      self.workoutSessionId = workoutSessionId
      self.exercise = exercise
    }

    public var __variables: Variables? { [
      "workoutSessionId": workoutSessionId,
      "exercise": exercise
    ] }

    public struct Data: WorkoutLoggerAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.Mutation }
      public static var __selections: [Selection] { [
        .field("addExercise", AddExercise.self, arguments: [
          "workoutSessionId": .variable("workoutSessionId"),
          "exercise": .variable("exercise")
        ]),
      ] }

      public var addExercise: AddExercise { __data["addExercise"] }

      /// AddExercise
      ///
      /// Parent Type: `Exercise`
      public struct AddExercise: WorkoutLoggerAPI.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.Exercise }
        public static var __selections: [Selection] { [
          .fragment(ExerciseFull.self),
        ] }

        public var id: ID { __data["id"] }
        public var notes: String { __data["notes"] }
        public var sets: [Set] { __data["sets"] }
        public var exerciseRoutine: ExerciseRoutine { __data["exerciseRoutine"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public var exerciseFull: ExerciseFull { _toFragment() }
          public var exerciseDetails: ExerciseDetails { _toFragment() }
        }

        /// AddExercise.Set
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

        /// AddExercise.ExerciseRoutine
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
    }
  }

}