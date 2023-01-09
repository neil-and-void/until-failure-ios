// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension WorkoutLoggerAPI {
  struct SetEntryInput: InputObject {
    public private(set) var __data: InputDict

    public init(_ data: InputDict) {
      __data = data
    }

    public init(
      weight: Double,
      reps: Int
    ) {
      __data = InputDict([
        "weight": weight,
        "reps": reps
      ])
    }

    public var weight: Double {
      get { __data["weight"] }
      set { __data["weight"] = newValue }
    }

    public var reps: Int {
      get { __data["reps"] }
      set { __data["reps"] = newValue }
    }
  }

}