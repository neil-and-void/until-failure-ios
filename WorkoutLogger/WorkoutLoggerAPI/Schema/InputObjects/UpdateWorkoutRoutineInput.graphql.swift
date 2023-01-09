// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension WorkoutLoggerAPI {
  struct UpdateWorkoutRoutineInput: InputObject {
    public private(set) var __data: InputDict

    public init(_ data: InputDict) {
      __data = data
    }

    public init(
      id: ID,
      name: String,
      exerciseRoutines: [UpdateExerciseRoutineInput]
    ) {
      __data = InputDict([
        "id": id,
        "name": name,
        "exerciseRoutines": exerciseRoutines
      ])
    }

    public var id: ID {
      get { __data["id"] }
      set { __data["id"] = newValue }
    }

    public var name: String {
      get { __data["name"] }
      set { __data["name"] = newValue }
    }

    public var exerciseRoutines: [UpdateExerciseRoutineInput] {
      get { __data["exerciseRoutines"] }
      set { __data["exerciseRoutines"] = newValue }
    }
  }

}