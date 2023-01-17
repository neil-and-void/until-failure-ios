// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension WorkoutLoggerAPI {
  class DeleteWorkoutSessionMutation: GraphQLMutation {
    public static let operationName: String = "DeleteWorkoutSession"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        """
        mutation DeleteWorkoutSession($workoutSessionId: ID!) {
          deleteWorkoutSession(workoutSessionId: $workoutSessionId)
        }
        """
      ))

    public var workoutSessionId: ID

    public init(workoutSessionId: ID) {
      self.workoutSessionId = workoutSessionId
    }

    public var __variables: Variables? { ["workoutSessionId": workoutSessionId] }

    public struct Data: WorkoutLoggerAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.Mutation }
      public static var __selections: [Selection] { [
        .field("deleteWorkoutSession", Int.self, arguments: ["workoutSessionId": .variable("workoutSessionId")]),
      ] }

      public var deleteWorkoutSession: Int { __data["deleteWorkoutSession"] }
    }
  }

}