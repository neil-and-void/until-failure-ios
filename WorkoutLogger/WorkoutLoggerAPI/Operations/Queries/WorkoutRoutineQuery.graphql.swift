// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension WorkoutLoggerAPI {
  class WorkoutRoutineQuery: GraphQLQuery {
    public static let operationName: String = "WorkoutRoutine"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        """
        query WorkoutRoutine($workoutRoutineId: ID!) {
          workoutRoutine(workoutRoutineId: $workoutRoutineId) {
            __typename
            ...workoutRoutineFull
          }
        }
        """,
        fragments: [WorkoutRoutineFull.self, ExerciseRoutineFull.self]
      ))

    public var workoutRoutineId: ID

    public init(workoutRoutineId: ID) {
      self.workoutRoutineId = workoutRoutineId
    }

    public var __variables: Variables? { ["workoutRoutineId": workoutRoutineId] }

    public struct Data: WorkoutLoggerAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.Query }
      public static var __selections: [Selection] { [
        .field("workoutRoutine", WorkoutRoutine.self, arguments: ["workoutRoutineId": .variable("workoutRoutineId")]),
      ] }

      public var workoutRoutine: WorkoutRoutine { __data["workoutRoutine"] }

      /// WorkoutRoutine
      ///
      /// Parent Type: `WorkoutRoutine`
      public struct WorkoutRoutine: WorkoutLoggerAPI.SelectionSet {
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

        /// WorkoutRoutine.ExerciseRoutine
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