// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension WorkoutLoggerAPI {
  struct WorkoutSessionInput: InputObject {
    public private(set) var __data: InputDict

    public init(_ data: InputDict) {
      __data = data
    }

    public init(
      workoutRoutineId: ID,
      start: Time,
      end: GraphQLNullable<Time> = nil,
      exercises: [ExerciseInput]
    ) {
      __data = InputDict([
        "workoutRoutineId": workoutRoutineId,
        "start": start,
        "end": end,
        "exercises": exercises
      ])
    }

    public var workoutRoutineId: ID {
      get { __data["workoutRoutineId"] }
      set { __data["workoutRoutineId"] = newValue }
    }

    public var start: Time {
      get { __data["start"] }
      set { __data["start"] = newValue }
    }

    public var end: GraphQLNullable<Time> {
      get { __data["end"] }
      set { __data["end"] = newValue }
    }

    public var exercises: [ExerciseInput] {
      get { __data["exercises"] }
      set { __data["exercises"] = newValue }
    }
  }

}