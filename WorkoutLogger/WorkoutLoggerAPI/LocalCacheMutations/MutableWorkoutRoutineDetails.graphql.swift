// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension WorkoutLoggerAPI {
  struct MutableWorkoutRoutineDetails: WorkoutLoggerAPI.MutableSelectionSet, Fragment {
    public static var fragmentDefinition: StaticString { """
      fragment MutableWorkoutRoutineDetails on WorkoutRoutine {
        __typename
        id
        name
        active
      }
      """ }

    public var __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.WorkoutRoutine }
    public static var __selections: [Selection] { [
      .field("id", ID.self),
      .field("name", String.self),
      .field("active", Bool.self),
    ] }

    public var id: ID {
      get { __data["id"] }
      set { __data["id"] = newValue }
    }
    public var name: String {
      get { __data["name"] }
      set { __data["name"] = newValue }
    }
    public var active: Bool {
      get { __data["active"] }
      set { __data["active"] = newValue }
    }
  }

}