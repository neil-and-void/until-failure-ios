// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension WorkoutLoggerAPI {
  class CreateWorkoutRoutineMutation: GraphQLMutation {
    public static let operationName: String = "CreateWorkoutRoutine"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        """
        mutation CreateWorkoutRoutine($routine: WorkoutRoutineInput!) {
          createWorkoutRoutine(routine: $routine) {
            __typename
            id
            name
          }
        }
        """
      ))

    public var routine: WorkoutRoutineInput

    public init(routine: WorkoutRoutineInput) {
      self.routine = routine
    }

    public var __variables: Variables? { ["routine": routine] }

    public struct Data: WorkoutLoggerAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.Mutation }
      public static var __selections: [Selection] { [
        .field("createWorkoutRoutine", CreateWorkoutRoutine.self, arguments: ["routine": .variable("routine")]),
      ] }

      public var createWorkoutRoutine: CreateWorkoutRoutine { __data["createWorkoutRoutine"] }

      /// CreateWorkoutRoutine
      ///
      /// Parent Type: `WorkoutRoutine`
      public struct CreateWorkoutRoutine: WorkoutLoggerAPI.SelectionSet {
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
    }
  }

}