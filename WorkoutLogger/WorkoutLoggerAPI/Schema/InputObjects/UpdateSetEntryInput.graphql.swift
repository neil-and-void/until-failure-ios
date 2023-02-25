// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension WorkoutLoggerAPI {
  struct UpdateSetEntryInput: InputObject {
    public private(set) var __data: InputDict

    public init(_ data: InputDict) {
      __data = data
    }

    public init(
      weight: GraphQLNullable<Double> = nil,
      reps: GraphQLNullable<Int> = nil
    ) {
      __data = InputDict([
        "weight": weight,
        "reps": reps
      ])
    }

    public var weight: GraphQLNullable<Double> {
      get { __data["weight"] }
      set { __data["weight"] = newValue }
    }

    public var reps: GraphQLNullable<Int> {
      get { __data["reps"] }
      set { __data["reps"] = newValue }
    }
  }

}