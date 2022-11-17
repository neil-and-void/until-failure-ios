// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
import WorkoutLoggerAPI

public class WorkoutRoutinesQuery: GraphQLQuery {
  public static let operationName: String = "WorkoutRoutines"
  public static let document: DocumentType = .notPersisted(
    definition: .init(
      """
      query WorkoutRoutines {
        workoutRoutines {
          __typename
          id
          name
        }
      }
      """
    ))

  public init() {}

  public struct Data: WorkoutLoggerAPI.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.Query }
    public static var __selections: [Selection] { [
      .field("workoutRoutines", [WorkoutRoutine?]?.self),
    ] }

    public var workoutRoutines: [WorkoutRoutine?]? { __data["workoutRoutines"] }

    /// WorkoutRoutine
    ///
    /// Parent Type: `WorkoutRoutine`
    public struct WorkoutRoutine: WorkoutLoggerAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.WorkoutRoutine }
      public static var __selections: [Selection] { [
        .field("id", WorkoutLoggerAPI.ID.self),
        .field("name", String.self),
      ] }

      public var id: WorkoutLoggerAPI.ID { __data["id"] }
      public var name: String { __data["name"] }
    }
  }
}
