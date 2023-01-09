// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension WorkoutLoggerAPI {
  struct ExerciseDetails: WorkoutLoggerAPI.SelectionSet, Fragment {
    public static var fragmentDefinition: StaticString { """
      fragment exerciseDetails on Exercise {
        __typename
        id
        notes
        sets {
          __typename
          ...setEntryFull
        }
      }
      """ }

    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.Exercise }
    public static var __selections: [Selection] { [
      .field("id", ID.self),
      .field("notes", String.self),
      .field("sets", [Set].self),
    ] }

    public var id: ID { __data["id"] }
    public var notes: String { __data["notes"] }
    public var sets: [Set] { __data["sets"] }

    /// Set
    ///
    /// Parent Type: `SetEntry`
    public struct Set: WorkoutLoggerAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { WorkoutLoggerAPI.Objects.SetEntry }
      public static var __selections: [Selection] { [
        .fragment(SetEntryFull.self),
      ] }

      public var id: ID { __data["id"] }
      public var reps: Int { __data["reps"] }
      public var weight: Double { __data["weight"] }

      public struct Fragments: FragmentContainer {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public var setEntryFull: SetEntryFull { _toFragment() }
      }
    }
  }

}