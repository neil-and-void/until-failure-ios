// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension WorkoutLoggerAPI {
  struct ExerciseRoutineFull: WorkoutLoggerAPI.SelectionSet, Fragment {
    public static var fragmentDefinition: StaticString { """
      fragment exerciseRoutineFull on ExerciseRoutine {
        __typename
        id
        active
        name
        sets
        reps
      }
      """ }

    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.ExerciseRoutine }
    public static var __selections: [Selection] { [
      .field("id", ID.self),
      .field("active", Bool.self),
      .field("name", String.self),
      .field("sets", Int.self),
      .field("reps", Int.self),
    ] }

    public var id: ID { __data["id"] }
    public var active: Bool { __data["active"] }
    public var name: String { __data["name"] }
    public var sets: Int { __data["sets"] }
    public var reps: Int { __data["reps"] }
  }

}