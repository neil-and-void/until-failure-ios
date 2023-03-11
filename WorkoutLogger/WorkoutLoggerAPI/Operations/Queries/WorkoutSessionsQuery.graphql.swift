// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension WorkoutLoggerAPI {
  class WorkoutSessionsQuery: GraphQLQuery {
    public static let operationName: String = "WorkoutSessions"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        """
        query WorkoutSessions($limit: Int!, $after: String) {
          workoutSessions(limit: $limit, after: $after) {
            __typename
            edges {
              __typename
              node {
                __typename
                ...workoutSessionFull
              }
            }
            pageInfo {
              __typename
              hasNextPage
            }
          }
        }
        """,
        fragments: [WorkoutSessionFull.self, ExerciseFull.self, ExerciseDetails.self, SetEntryFull.self, ExerciseRoutineFull.self, PrevExerciseFull.self]
      ))

    public var limit: Int
    public var after: GraphQLNullable<String>

    public init(
      limit: Int,
      after: GraphQLNullable<String>
    ) {
      self.limit = limit
      self.after = after
    }

    public var __variables: Variables? { [
      "limit": limit,
      "after": after
    ] }

    public struct Data: WorkoutLoggerAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.Query }
      public static var __selections: [Selection] { [
        .field("workoutSessions", WorkoutSessions.self, arguments: [
          "limit": .variable("limit"),
          "after": .variable("after")
        ]),
      ] }

      public var workoutSessions: WorkoutSessions { __data["workoutSessions"] }

      /// WorkoutSessions
      ///
      /// Parent Type: `WorkoutSessionConnection`
      public struct WorkoutSessions: WorkoutLoggerAPI.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.WorkoutSessionConnection }
        public static var __selections: [Selection] { [
          .field("edges", [Edge].self),
          .field("pageInfo", PageInfo.self),
        ] }

        public var edges: [Edge] { __data["edges"] }
        public var pageInfo: PageInfo { __data["pageInfo"] }

        /// WorkoutSessions.Edge
        ///
        /// Parent Type: `WorkoutSessionEdge`
        public struct Edge: WorkoutLoggerAPI.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.WorkoutSessionEdge }
          public static var __selections: [Selection] { [
            .field("node", Node.self),
          ] }

          public var node: Node { __data["node"] }

          /// WorkoutSessions.Edge.Node
          ///
          /// Parent Type: `WorkoutSession`
          public struct Node: WorkoutLoggerAPI.SelectionSet {
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

            /// WorkoutSessions.Edge.Node.Exercise
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

              /// WorkoutSessions.Edge.Node.Exercise.Set
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

              /// WorkoutSessions.Edge.Node.Exercise.ExerciseRoutine
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

            /// WorkoutSessions.Edge.Node.PrevExercise
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

              /// WorkoutSessions.Edge.Node.PrevExercise.Set
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

        /// WorkoutSessions.PageInfo
        ///
        /// Parent Type: `PageInfo`
        public struct PageInfo: WorkoutLoggerAPI.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.PageInfo }
          public static var __selections: [Selection] { [
            .field("hasNextPage", Bool.self),
          ] }

          public var hasNextPage: Bool { __data["hasNextPage"] }
        }
      }
    }
  }

}