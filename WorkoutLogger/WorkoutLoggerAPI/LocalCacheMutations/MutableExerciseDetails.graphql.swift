// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension WorkoutLoggerAPI {
  struct MutableExerciseDetails: WorkoutLoggerAPI.MutableSelectionSet, Fragment {
    public static var fragmentDefinition: StaticString { """
      fragment MutableExerciseDetails on Exercise {
        __typename
        ...exerciseDetails
      }
      """ }

    public var __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.Exercise }
    public static var __selections: [Selection] { [
      .fragment(ExerciseDetails.self),
    ] }

    public var id: ID {
      get { __data["id"] }
      set { __data["id"] = newValue }
    }
    public var notes: String {
      get { __data["notes"] }
      set { __data["notes"] = newValue }
    }
    public var sets: [Set] {
      get { __data["sets"] }
      set { __data["sets"] = newValue }
    }

    public struct Fragments: FragmentContainer {
      public var __data: DataDict
      public init(data: DataDict) { __data = data }

      public var exerciseDetails: ExerciseDetails {
        get { _toFragment() }
        _modify { var f = exerciseDetails; yield &f; __data = f.__data }
        @available(*, unavailable, message: "mutate properties of the fragment instead.")
        set { preconditionFailure() }
      }
    }

    /// Set
    ///
    /// Parent Type: `SetEntry`
    public struct Set: WorkoutLoggerAPI.MutableSelectionSet {
      public var __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.SetEntry }

      public var id: ID {
        get { __data["id"] }
        set { __data["id"] = newValue }
      }
      public var reps: Int {
        get { __data["reps"] }
        set { __data["reps"] = newValue }
      }
      public var weight: Double {
        get { __data["weight"] }
        set { __data["weight"] = newValue }
      }

      public struct Fragments: FragmentContainer {
        public var __data: DataDict
        public init(data: DataDict) { __data = data }

        public var setEntryFull: SetEntryFull {
          get { _toFragment() }
          _modify { var f = setEntryFull; yield &f; __data = f.__data }
          @available(*, unavailable, message: "mutate properties of the fragment instead.")
          set { preconditionFailure() }
        }
      }
    }
  }

}