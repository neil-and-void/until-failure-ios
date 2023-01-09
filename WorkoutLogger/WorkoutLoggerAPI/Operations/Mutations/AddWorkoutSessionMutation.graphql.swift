// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension WorkoutLoggerAPI {
  class AddWorkoutSessionMutation: GraphQLMutation {
    public static let operationName: String = "AddWorkoutSession"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        """
        mutation AddWorkoutSession($workout: WorkoutSessionInput!) {
          addWorkoutSession(workout: $workout)
        }
        """
      ))

    public var workout: WorkoutSessionInput

    public init(workout: WorkoutSessionInput) {
      self.workout = workout
    }

    public var __variables: Variables? { ["workout": workout] }

    public struct Data: WorkoutLoggerAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.Mutation }
      public static var __selections: [Selection] { [
        .field("addWorkoutSession", ID.self, arguments: ["workout": .variable("workout")]),
      ] }

      public var addWorkoutSession: ID { __data["addWorkoutSession"] }
    }
  }

}