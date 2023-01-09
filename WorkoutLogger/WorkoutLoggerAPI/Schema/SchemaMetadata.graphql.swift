// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public protocol WorkoutLoggerAPI_SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == WorkoutLoggerAPI.SchemaMetadata {}

public protocol WorkoutLoggerAPI_InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == WorkoutLoggerAPI.SchemaMetadata {}

public protocol WorkoutLoggerAPI_MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == WorkoutLoggerAPI.SchemaMetadata {}

public protocol WorkoutLoggerAPI_MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == WorkoutLoggerAPI.SchemaMetadata {}

public extension WorkoutLoggerAPI {
  typealias ID = String

  typealias SelectionSet = WorkoutLoggerAPI_SelectionSet

  typealias InlineFragment = WorkoutLoggerAPI_InlineFragment

  typealias MutableSelectionSet = WorkoutLoggerAPI_MutableSelectionSet

  typealias MutableInlineFragment = WorkoutLoggerAPI_MutableInlineFragment

  enum SchemaMetadata: ApolloAPI.SchemaMetadata {
    public static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

    public static func objectType(forTypename typename: String) -> Object? {
      switch typename {
      case "Mutation": return WorkoutLoggerAPI.Objects.Mutation
      case "WorkoutRoutine": return WorkoutLoggerAPI.Objects.WorkoutRoutine
      case "ExerciseRoutine": return WorkoutLoggerAPI.Objects.ExerciseRoutine
      case "AuthResult": return WorkoutLoggerAPI.Objects.AuthResult
      case "RefreshSuccess": return WorkoutLoggerAPI.Objects.RefreshSuccess
      case "Query": return WorkoutLoggerAPI.Objects.Query
      case "WorkoutSession": return WorkoutLoggerAPI.Objects.WorkoutSession
      case "Exercise": return WorkoutLoggerAPI.Objects.Exercise
      case "SetEntry": return WorkoutLoggerAPI.Objects.SetEntry
      case "WorkoutRoutineConnection": return WorkoutLoggerAPI.Objects.WorkoutRoutineConnection
      case "WorkoutRoutineEdge": return WorkoutLoggerAPI.Objects.WorkoutRoutineEdge
      case "PageInfo": return WorkoutLoggerAPI.Objects.PageInfo
      case "WorkoutSessionConnection": return WorkoutLoggerAPI.Objects.WorkoutSessionConnection
      case "WorkoutSessionEdge": return WorkoutLoggerAPI.Objects.WorkoutSessionEdge
      default: return nil
      }
    }
  }

  enum Objects {}
  enum Interfaces {}
  enum Unions {}

}