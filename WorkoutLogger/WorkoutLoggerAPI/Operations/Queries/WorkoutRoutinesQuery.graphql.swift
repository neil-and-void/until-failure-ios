// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension WorkoutLoggerAPI {
  class WorkoutRoutinesQuery: GraphQLQuery {
    public static let operationName: String = "WorkoutRoutines"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        """
        query WorkoutRoutines($limit: Int!, $after: String) {
          workoutRoutines(limit: $limit, after: $after) {
            __typename
            edges {
              __typename
              node {
                __typename
                ...workoutRoutineFull
              }
            }
            pageInfo {
              __typename
              hasNextPage
            }
          }
        }
        """,
        fragments: [WorkoutRoutineFull.self, ExerciseRoutineFull.self]
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
        .field("workoutRoutines", WorkoutRoutines.self, arguments: [
          "limit": .variable("limit"),
          "after": .variable("after")
        ]),
      ] }

      public var workoutRoutines: WorkoutRoutines { __data["workoutRoutines"] }

      /// WorkoutRoutines
      ///
      /// Parent Type: `WorkoutRoutineConnection`
      public struct WorkoutRoutines: WorkoutLoggerAPI.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.WorkoutRoutineConnection }
        public static var __selections: [Selection] { [
          .field("edges", [Edge].self),
          .field("pageInfo", PageInfo.self),
        ] }

        public var edges: [Edge] { __data["edges"] }
        public var pageInfo: PageInfo { __data["pageInfo"] }

        /// WorkoutRoutines.Edge
        ///
        /// Parent Type: `WorkoutRoutineEdge`
        public struct Edge: WorkoutLoggerAPI.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.WorkoutRoutineEdge }
          public static var __selections: [Selection] { [
            .field("node", Node.self),
          ] }

          public var node: Node { __data["node"] }

          /// WorkoutRoutines.Edge.Node
          ///
          /// Parent Type: `WorkoutRoutine`
          public struct Node: WorkoutLoggerAPI.SelectionSet {
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

            /// WorkoutRoutines.Edge.Node.ExerciseRoutine
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

        /// WorkoutRoutines.PageInfo
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