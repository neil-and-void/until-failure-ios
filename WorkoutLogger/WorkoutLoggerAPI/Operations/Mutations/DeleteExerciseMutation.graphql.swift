// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension WorkoutLoggerAPI {
  class DeleteExerciseMutation: GraphQLMutation {
    public static let operationName: String = "DeleteExercise"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        """
        mutation DeleteExercise($exerciseId: ID!) {
          deleteExercise(exerciseId: $exerciseId)
        }
        """
      ))

    public var exerciseId: ID

    public init(exerciseId: ID) {
      self.exerciseId = exerciseId
    }

    public var __variables: Variables? { ["exerciseId": exerciseId] }

    public struct Data: WorkoutLoggerAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.Mutation }
      public static var __selections: [Selection] { [
        .field("deleteExercise", Int.self, arguments: ["exerciseId": .variable("exerciseId")]),
      ] }

      public var deleteExercise: Int { __data["deleteExercise"] }
    }
  }

}