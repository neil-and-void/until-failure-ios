// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension WorkoutLoggerAPI {
  class DeleteWorkoutRoutineMutation: GraphQLMutation {
    public static let operationName: String = "DeleteWorkoutRoutine"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        """
        mutation DeleteWorkoutRoutine($workoutRoutineId: ID!) {
          deleteWorkoutRoutine(workoutRoutineId: $workoutRoutineId)
        }
        """
      ))

    public var workoutRoutineId: ID

    public init(workoutRoutineId: ID) {
      self.workoutRoutineId = workoutRoutineId
    }

    public var __variables: Variables? { ["workoutRoutineId": workoutRoutineId] }

    public struct Data: WorkoutLoggerAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.Mutation }
      public static var __selections: [Selection] { [
        .field("deleteWorkoutRoutine", Int.self, arguments: ["workoutRoutineId": .variable("workoutRoutineId")]),
      ] }

      public var deleteWorkoutRoutine: Int { __data["deleteWorkoutRoutine"] }
    }
  }

}