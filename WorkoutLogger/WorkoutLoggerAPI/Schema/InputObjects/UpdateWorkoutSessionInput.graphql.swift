// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension WorkoutLoggerAPI {
  struct UpdateWorkoutSessionInput: InputObject {
    public private(set) var __data: InputDict

    public init(_ data: InputDict) {
      __data = data
    }

    public init(
      start: GraphQLNullable<Time> = nil,
      end: GraphQLNullable<Time> = nil
    ) {
      __data = InputDict([
        "start": start,
        "end": end
      ])
    }

    public var start: GraphQLNullable<Time> {
      get { __data["start"] }
      set { __data["start"] = newValue }
    }

    public var end: GraphQLNullable<Time> {
      get { __data["end"] }
      set { __data["end"] = newValue }
    }
  }

}