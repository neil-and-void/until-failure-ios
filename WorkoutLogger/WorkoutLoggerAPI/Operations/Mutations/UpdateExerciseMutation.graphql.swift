// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension WorkoutLoggerAPI {
  class UpdateExerciseMutation: GraphQLMutation {
    public static let operationName: String = "UpdateExercise"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        """
        mutation UpdateExercise($exerciseId: ID!, $exercise: UpdateExerciseInput!) {
          updateExercise(exerciseId: $exerciseId, exercise: $exercise) {
            __typename
            id
            notes
          }
        }
        """
      ))

    public var exerciseId: ID
    public var exercise: UpdateExerciseInput

    public init(
      exerciseId: ID,
      exercise: UpdateExerciseInput
    ) {
      self.exerciseId = exerciseId
      self.exercise = exercise
    }

    public var __variables: Variables? { [
      "exerciseId": exerciseId,
      "exercise": exercise
    ] }

    public struct Data: WorkoutLoggerAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.Mutation }
      public static var __selections: [Selection] { [
        .field("updateExercise", UpdateExercise.self, arguments: [
          "exerciseId": .variable("exerciseId"),
          "exercise": .variable("exercise")
        ]),
      ] }

      public var updateExercise: UpdateExercise { __data["updateExercise"] }

      /// UpdateExercise
      ///
      /// Parent Type: `Exercise`
      public struct UpdateExercise: WorkoutLoggerAPI.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.Exercise }
        public static var __selections: [Selection] { [
          .field("id", ID.self),
          .field("notes", String.self),
        ] }

        public var id: ID { __data["id"] }
        public var notes: String { __data["notes"] }
      }
    }
  }

}