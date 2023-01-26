// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension WorkoutLoggerAPI {
  class ExerciseQuery: GraphQLQuery {
    public static let operationName: String = "Exercise"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        """
        query Exercise($exerciseId: ID!) {
          exercise(exerciseId: $exerciseId) {
            __typename
            ...exerciseFull
          }
        }
        """,
        fragments: [ExerciseFull.self, ExerciseDetails.self, SetEntryFull.self, ExerciseRoutineFull.self]
      ))

    public var exerciseId: ID

    public init(exerciseId: ID) {
      self.exerciseId = exerciseId
    }

    public var __variables: Variables? { ["exerciseId": exerciseId] }

    public struct Data: WorkoutLoggerAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.Query }
      public static var __selections: [Selection] { [
        .field("exercise", Exercise.self, arguments: ["exerciseId": .variable("exerciseId")]),
      ] }

      public var exercise: Exercise { __data["exercise"] }

      /// Exercise
      ///
      /// Parent Type: `Exercise`
      public struct Exercise: WorkoutLoggerAPI.SelectionSet {
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

        /// Exercise.ExerciseRoutine
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