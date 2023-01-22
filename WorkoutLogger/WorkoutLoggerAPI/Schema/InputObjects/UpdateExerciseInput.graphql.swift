// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension WorkoutLoggerAPI {
  struct UpdateExerciseInput: InputObject {
    public private(set) var __data: InputDict

    public init(_ data: InputDict) {
      __data = data
    }

    public init(
      notes: String
    ) {
      __data = InputDict([
        "notes": notes
      ])
    }

    public var notes: String {
      get { __data["notes"] }
      set { __data["notes"] = newValue }
    }
  }

}