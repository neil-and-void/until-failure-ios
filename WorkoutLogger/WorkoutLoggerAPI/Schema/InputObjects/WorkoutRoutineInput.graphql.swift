// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension WorkoutLoggerAPI {
  struct WorkoutRoutineInput: InputObject {
    public private(set) var __data: InputDict

    public init(_ data: InputDict) {
      __data = data
    }

    public init(
      name: String,
      exerciseRoutines: [ExerciseRoutineInput]
    ) {
      __data = InputDict([
        "name": name,
        "exerciseRoutines": exerciseRoutines
      ])
    }

    public var name: String {
      get { __data["name"] }
      set { __data["name"] = newValue }
    }

    public var exerciseRoutines: [ExerciseRoutineInput] {
      get { __data["exerciseRoutines"] }
      set { __data["exerciseRoutines"] = newValue }
    }
  }

}