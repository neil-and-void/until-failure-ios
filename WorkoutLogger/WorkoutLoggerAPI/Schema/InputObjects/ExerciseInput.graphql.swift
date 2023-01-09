// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension WorkoutLoggerAPI {
  struct ExerciseInput: InputObject {
    public private(set) var __data: InputDict

    public init(_ data: InputDict) {
      __data = data
    }

    public init(
      exerciseRoutineId: ID,
      notes: String,
      setEntries: [SetEntryInput]
    ) {
      __data = InputDict([
        "exerciseRoutineId": exerciseRoutineId,
        "notes": notes,
        "setEntries": setEntries
      ])
    }

    public var exerciseRoutineId: ID {
      get { __data["exerciseRoutineId"] }
      set { __data["exerciseRoutineId"] = newValue }
    }

    public var notes: String {
      get { __data["notes"] }
      set { __data["notes"] = newValue }
    }

    public var setEntries: [SetEntryInput] {
      get { __data["setEntries"] }
      set { __data["setEntries"] = newValue }
    }
  }

}