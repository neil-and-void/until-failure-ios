// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension WorkoutLoggerAPI {
  struct MutableWorkoutSessionDetails: WorkoutLoggerAPI.MutableSelectionSet, Fragment {
    public static var fragmentDefinition: StaticString { """
      fragment MutableWorkoutSessionDetails on WorkoutSession {
        __typename
        id
        start
        end
        workoutRoutine {
          __typename
          id
          name
        }
        exercises {
          __typename
          ...exerciseDetails
          exerciseRoutine {
            __typename
            ...exerciseRoutineFull
          }
        }
        prevExercises {
          __typename
          ...exerciseDetails
          exerciseRoutine {
            __typename
            id
          }
        }
      }
      """ }

    public var __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.WorkoutSession }
    public static var __selections: [Selection] { [
      .field("id", ID.self),
      .field("start", Time.self),
      .field("end", Time?.self),
      .field("workoutRoutine", WorkoutRoutine.self),
      .field("exercises", [Exercise].self),
      .field("prevExercises", [PrevExercise].self),
    ] }

    public var id: ID {
      get { __data["id"] }
      set { __data["id"] = newValue }
    }
    public var start: Time {
      get { __data["start"] }
      set { __data["start"] = newValue }
    }
    public var end: Time? {
      get { __data["end"] }
      set { __data["end"] = newValue }
    }
    public var workoutRoutine: WorkoutRoutine {
      get { __data["workoutRoutine"] }
      set { __data["workoutRoutine"] = newValue }
    }
    public var exercises: [Exercise] {
      get { __data["exercises"] }
      set { __data["exercises"] = newValue }
    }
    public var prevExercises: [PrevExercise] {
      get { __data["prevExercises"] }
      set { __data["prevExercises"] = newValue }
    }

    /// WorkoutRoutine
    ///
    /// Parent Type: `WorkoutRoutine`
    public struct WorkoutRoutine: WorkoutLoggerAPI.MutableSelectionSet {
      public var __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.WorkoutRoutine }
      public static var __selections: [Selection] { [
        .field("id", ID.self),
        .field("name", String.self),
      ] }

      public var id: ID {
        get { __data["id"] }
        set { __data["id"] = newValue }
      }
      public var name: String {
        get { __data["name"] }
        set { __data["name"] = newValue }
      }
    }

    /// Exercise
    ///
    /// Parent Type: `Exercise`
    public struct Exercise: WorkoutLoggerAPI.MutableSelectionSet {
      public var __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.Exercise }
      public static var __selections: [Selection] { [
        .field("exerciseRoutine", ExerciseRoutine.self),
        .fragment(ExerciseDetails.self),
      ] }

      public var exerciseRoutine: ExerciseRoutine {
        get { __data["exerciseRoutine"] }
        set { __data["exerciseRoutine"] = newValue }
      }
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

      /// Exercise.ExerciseRoutine
      ///
      /// Parent Type: `ExerciseRoutine`
      public struct ExerciseRoutine: WorkoutLoggerAPI.MutableSelectionSet {
        public var __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.ExerciseRoutine }
        public static var __selections: [Selection] { [
          .fragment(ExerciseRoutineFull.self),
        ] }

        public var id: ID {
          get { __data["id"] }
          set { __data["id"] = newValue }
        }
        public var active: Bool {
          get { __data["active"] }
          set { __data["active"] = newValue }
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

        public struct Fragments: FragmentContainer {
          public var __data: DataDict
          public init(data: DataDict) { __data = data }

          public var exerciseRoutineFull: ExerciseRoutineFull {
            get { _toFragment() }
            _modify { var f = exerciseRoutineFull; yield &f; __data = f.__data }
            @available(*, unavailable, message: "mutate properties of the fragment instead.")
            set { preconditionFailure() }
          }
        }
      }
      /// Exercise.Set
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

    /// PrevExercise
    ///
    /// Parent Type: `Exercise`
    public struct PrevExercise: WorkoutLoggerAPI.MutableSelectionSet {
      public var __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.Exercise }
      public static var __selections: [Selection] { [
        .field("exerciseRoutine", ExerciseRoutine.self),
        .fragment(ExerciseDetails.self),
      ] }

      public var exerciseRoutine: ExerciseRoutine {
        get { __data["exerciseRoutine"] }
        set { __data["exerciseRoutine"] = newValue }
      }
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

      /// PrevExercise.ExerciseRoutine
      ///
      /// Parent Type: `ExerciseRoutine`
      public struct ExerciseRoutine: WorkoutLoggerAPI.MutableSelectionSet {
        public var __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.ExerciseRoutine }
        public static var __selections: [Selection] { [
          .field("id", ID.self),
        ] }

        public var id: ID {
          get { __data["id"] }
          set { __data["id"] = newValue }
        }
      }
      /// PrevExercise.Set
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

}