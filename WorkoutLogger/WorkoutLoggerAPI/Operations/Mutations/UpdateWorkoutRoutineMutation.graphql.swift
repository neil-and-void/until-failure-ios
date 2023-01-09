// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension WorkoutLoggerAPI {
  class UpdateWorkoutRoutineMutation: GraphQLMutation {
    public static let operationName: String = "UpdateWorkoutRoutine"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        """
        mutation UpdateWorkoutRoutine($workoutRoutine: UpdateWorkoutRoutineInput!) {
          updateWorkoutRoutine(workoutRoutine: $workoutRoutine) {
            __typename
            ...workoutRoutineFull
          }
        }
        """,
        fragments: [WorkoutRoutineFull.self, ExerciseRoutineFull.self]
      ))

    public var workoutRoutine: UpdateWorkoutRoutineInput

    public init(workoutRoutine: UpdateWorkoutRoutineInput) {
      self.workoutRoutine = workoutRoutine
    }

    public var __variables: Variables? { ["workoutRoutine": workoutRoutine] }

    public struct Data: WorkoutLoggerAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.Mutation }
      public static var __selections: [Selection] { [
        .field("updateWorkoutRoutine", UpdateWorkoutRoutine.self, arguments: ["workoutRoutine": .variable("workoutRoutine")]),
      ] }

      public var updateWorkoutRoutine: UpdateWorkoutRoutine { __data["updateWorkoutRoutine"] }

      /// UpdateWorkoutRoutine
      ///
      /// Parent Type: `WorkoutRoutine`
      public struct UpdateWorkoutRoutine: WorkoutLoggerAPI.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.WorkoutRoutine }
        public static var __selections: [Selection] { [
          .fragment(WorkoutRoutineFull.self),
        ] }

        public var id: ID { __data["id"] }
        public var name: String { __data["name"] }
        public var active: Bool { __data["active"] }
        public var exerciseRoutines: [ExerciseRoutine] { __data["exerciseRoutines"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public var workoutRoutineFull: WorkoutRoutineFull { _toFragment() }
        }

        /// UpdateWorkoutRoutine.ExerciseRoutine
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