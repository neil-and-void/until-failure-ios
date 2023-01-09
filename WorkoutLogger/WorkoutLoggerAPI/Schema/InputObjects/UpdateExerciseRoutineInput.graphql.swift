// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension WorkoutLoggerAPI {
  struct UpdateExerciseRoutineInput: InputObject {
    public private(set) var __data: InputDict

    public init(_ data: InputDict) {
      __data = data
    }

    public init(
      id: GraphQLNullable<ID> = nil,
      name: String,
      sets: Int,
      reps: Int
    ) {
      __data = InputDict([
        "id": id,
        "name": name,
        "sets": sets,
        "reps": reps
      ])
    }

    public var id: GraphQLNullable<ID> {
      get { __data["id"] }
      set { __data["id"] = newValue }
    }

    public var name: String {
      get { __data["name"] }
      set { __data["name"] = newValue }
    }

    public var sets: Int {
      get { __data["sets"] }
      set { __data["sets"] = newValue }
    }

    public var reps: Int {
      get { __data["reps"] }
      set { __data["reps"] = newValue }
    }
  }

}