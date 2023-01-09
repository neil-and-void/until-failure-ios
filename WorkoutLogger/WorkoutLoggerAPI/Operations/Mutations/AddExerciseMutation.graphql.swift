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
          addExercise(workoutSessionId: $workoutSessionId, exercise: $exercise)
        }
        """
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
        .field("addExercise", ID.self, arguments: [
          "workoutSessionId": .variable("workoutSessionId"),
          "exercise": .variable("exercise")
        ]),
      ] }

      public var addExercise: ID { __data["addExercise"] }
    }
  }

}