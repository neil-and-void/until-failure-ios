// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct ExerciseInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - exerciseRoutineId
  ///   - notes
  ///   - setEntries
  public init(exerciseRoutineId: GraphQLID, notes: String, setEntries: [SetEntryInput]) {
    graphQLMap = ["exerciseRoutineId": exerciseRoutineId, "notes": notes, "setEntries": setEntries]
  }

  public var exerciseRoutineId: GraphQLID {
    get {
      return graphQLMap["exerciseRoutineId"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "exerciseRoutineId")
    }
  }

  public var notes: String {
    get {
      return graphQLMap["notes"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "notes")
    }
  }

  public var setEntries: [SetEntryInput] {
    get {
      return graphQLMap["setEntries"] as! [SetEntryInput]
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "setEntries")
    }
  }
}

public struct SetEntryInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - weight
  ///   - reps
  public init(weight: Double, reps: Int) {
    graphQLMap = ["weight": weight, "reps": reps]
  }

  public var weight: Double {
    get {
      return graphQLMap["weight"] as! Double
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "weight")
    }
  }

  public var reps: Int {
    get {
      return graphQLMap["reps"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "reps")
    }
  }
}

public struct WorkoutSessionInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - workoutRoutineId
  ///   - start
  ///   - end
  ///   - exercises
  public init(workoutRoutineId: GraphQLID, start: String, end: Swift.Optional<String?> = nil, exercises: [ExerciseInput]) {
    graphQLMap = ["workoutRoutineId": workoutRoutineId, "start": start, "end": end, "exercises": exercises]
  }

  public var workoutRoutineId: GraphQLID {
    get {
      return graphQLMap["workoutRoutineId"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "workoutRoutineId")
    }
  }

  public var start: String {
    get {
      return graphQLMap["start"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "start")
    }
  }

  public var end: Swift.Optional<String?> {
    get {
      return graphQLMap["end"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "end")
    }
  }

  public var exercises: [ExerciseInput] {
    get {
      return graphQLMap["exercises"] as! [ExerciseInput]
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "exercises")
    }
  }
}

public struct WorkoutRoutineInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - name
  ///   - exerciseRoutines
  public init(name: String, exerciseRoutines: [ExerciseRoutineInput]) {
    graphQLMap = ["name": name, "exerciseRoutines": exerciseRoutines]
  }

  public var name: String {
    get {
      return graphQLMap["name"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }

  public var exerciseRoutines: [ExerciseRoutineInput] {
    get {
      return graphQLMap["exerciseRoutines"] as! [ExerciseRoutineInput]
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "exerciseRoutines")
    }
  }
}

public struct ExerciseRoutineInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - name
  ///   - sets
  ///   - reps
  public init(name: String, sets: Int, reps: Int) {
    graphQLMap = ["name": name, "sets": sets, "reps": reps]
  }

  public var name: String {
    get {
      return graphQLMap["name"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }

  public var sets: Int {
    get {
      return graphQLMap["sets"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "sets")
    }
  }

  public var reps: Int {
    get {
      return graphQLMap["reps"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "reps")
    }
  }
}

public struct LoginInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - email
  ///   - password
  public init(email: String, password: String) {
    graphQLMap = ["email": email, "password": password]
  }

  public var email: String {
    get {
      return graphQLMap["email"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "email")
    }
  }

  public var password: String {
    get {
      return graphQLMap["password"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "password")
    }
  }
}

public struct SignupInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - email
  ///   - name
  ///   - password
  ///   - confirmPassword
  public init(email: String, name: String, password: String, confirmPassword: String) {
    graphQLMap = ["email": email, "name": name, "password": password, "confirmPassword": confirmPassword]
  }

  public var email: String {
    get {
      return graphQLMap["email"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "email")
    }
  }

  public var name: String {
    get {
      return graphQLMap["name"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }

  public var password: String {
    get {
      return graphQLMap["password"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "password")
    }
  }

  public var confirmPassword: String {
    get {
      return graphQLMap["confirmPassword"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "confirmPassword")
    }
  }
}

public struct UpdateWorkoutRoutineInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - id
  ///   - name
  ///   - exerciseRoutines
  public init(id: GraphQLID, name: String, exerciseRoutines: [UpdateExerciseRoutineInput]) {
    graphQLMap = ["id": id, "name": name, "exerciseRoutines": exerciseRoutines]
  }

  public var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var name: String {
    get {
      return graphQLMap["name"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }

  public var exerciseRoutines: [UpdateExerciseRoutineInput] {
    get {
      return graphQLMap["exerciseRoutines"] as! [UpdateExerciseRoutineInput]
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "exerciseRoutines")
    }
  }
}

public struct UpdateExerciseRoutineInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - id
  ///   - name
  ///   - sets
  ///   - reps
  public init(id: Swift.Optional<GraphQLID?> = nil, name: String, sets: Int, reps: Int) {
    graphQLMap = ["id": id, "name": name, "sets": sets, "reps": reps]
  }

  public var id: Swift.Optional<GraphQLID?> {
    get {
      return graphQLMap["id"] as? Swift.Optional<GraphQLID?> ?? Swift.Optional<GraphQLID?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var name: String {
    get {
      return graphQLMap["name"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }

  public var sets: Int {
    get {
      return graphQLMap["sets"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "sets")
    }
  }

  public var reps: Int {
    get {
      return graphQLMap["reps"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "reps")
    }
  }
}

public final class AddExerciseMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation AddExercise($workoutSessionId: ID!, $exercise: ExerciseInput!) {
      addExercise(workoutSessionId: $workoutSessionId, exercise: $exercise)
    }
    """

  public let operationName: String = "AddExercise"

  public var workoutSessionId: GraphQLID
  public var exercise: ExerciseInput

  public init(workoutSessionId: GraphQLID, exercise: ExerciseInput) {
    self.workoutSessionId = workoutSessionId
    self.exercise = exercise
  }

  public var variables: GraphQLMap? {
    return ["workoutSessionId": workoutSessionId, "exercise": exercise]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("addExercise", arguments: ["workoutSessionId": GraphQLVariable("workoutSessionId"), "exercise": GraphQLVariable("exercise")], type: .nonNull(.scalar(GraphQLID.self))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(addExercise: GraphQLID) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "addExercise": addExercise])
    }

    public var addExercise: GraphQLID {
      get {
        return resultMap["addExercise"]! as! GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "addExercise")
      }
    }
  }
}

public final class AddWorkoutSessionMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation AddWorkoutSession($workout: WorkoutSessionInput!) {
      addWorkoutSession(workout: $workout)
    }
    """

  public let operationName: String = "AddWorkoutSession"

  public var workout: WorkoutSessionInput

  public init(workout: WorkoutSessionInput) {
    self.workout = workout
  }

  public var variables: GraphQLMap? {
    return ["workout": workout]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("addWorkoutSession", arguments: ["workout": GraphQLVariable("workout")], type: .nonNull(.scalar(GraphQLID.self))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(addWorkoutSession: GraphQLID) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "addWorkoutSession": addWorkoutSession])
    }

    public var addWorkoutSession: GraphQLID {
      get {
        return resultMap["addWorkoutSession"]! as! GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "addWorkoutSession")
      }
    }
  }
}

public final class CreateWorkoutRoutineMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation CreateWorkoutRoutine($routine: WorkoutRoutineInput!) {
      createWorkoutRoutine(routine: $routine) {
        __typename
        id
        name
      }
    }
    """

  public let operationName: String = "CreateWorkoutRoutine"

  public var routine: WorkoutRoutineInput

  public init(routine: WorkoutRoutineInput) {
    self.routine = routine
  }

  public var variables: GraphQLMap? {
    return ["routine": routine]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("createWorkoutRoutine", arguments: ["routine": GraphQLVariable("routine")], type: .nonNull(.object(CreateWorkoutRoutine.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createWorkoutRoutine: CreateWorkoutRoutine) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createWorkoutRoutine": createWorkoutRoutine.resultMap])
    }

    public var createWorkoutRoutine: CreateWorkoutRoutine {
      get {
        return CreateWorkoutRoutine(unsafeResultMap: resultMap["createWorkoutRoutine"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "createWorkoutRoutine")
      }
    }

    public struct CreateWorkoutRoutine: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["WorkoutRoutine"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String) {
        self.init(unsafeResultMap: ["__typename": "WorkoutRoutine", "id": id, "name": name])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }
    }
  }
}

public final class DeleteWorkoutRoutineMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation DeleteWorkoutRoutine($workoutRoutineId: ID!) {
      deleteWorkoutRoutine(workoutRoutineId: $workoutRoutineId)
    }
    """

  public let operationName: String = "DeleteWorkoutRoutine"

  public var workoutRoutineId: GraphQLID

  public init(workoutRoutineId: GraphQLID) {
    self.workoutRoutineId = workoutRoutineId
  }

  public var variables: GraphQLMap? {
    return ["workoutRoutineId": workoutRoutineId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("deleteWorkoutRoutine", arguments: ["workoutRoutineId": GraphQLVariable("workoutRoutineId")], type: .nonNull(.scalar(Int.self))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(deleteWorkoutRoutine: Int) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "deleteWorkoutRoutine": deleteWorkoutRoutine])
    }

    public var deleteWorkoutRoutine: Int {
      get {
        return resultMap["deleteWorkoutRoutine"]! as! Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "deleteWorkoutRoutine")
      }
    }
  }
}

public final class WorkoutSessionQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query WorkoutSession($workoutRoutineId: ID!, $workoutSessionId: ID!) {
      workoutSession(workoutSessionId: $workoutSessionId) {
        __typename
        ...workoutSessionFull
      }
      workoutRoutine(workoutRoutineId: $workoutRoutineId) {
        __typename
        ...workoutRoutineFull
      }
    }
    """

  public let operationName: String = "WorkoutSession"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + WorkoutSessionFull.fragmentDefinition)
    document.append("\n" + ExerciseRoutineFull.fragmentDefinition)
    document.append("\n" + WorkoutRoutineFull.fragmentDefinition)
    return document
  }

  public var workoutRoutineId: GraphQLID
  public var workoutSessionId: GraphQLID

  public init(workoutRoutineId: GraphQLID, workoutSessionId: GraphQLID) {
    self.workoutRoutineId = workoutRoutineId
    self.workoutSessionId = workoutSessionId
  }

  public var variables: GraphQLMap? {
    return ["workoutRoutineId": workoutRoutineId, "workoutSessionId": workoutSessionId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("workoutSession", arguments: ["workoutSessionId": GraphQLVariable("workoutSessionId")], type: .nonNull(.object(WorkoutSession.selections))),
        GraphQLField("workoutRoutine", arguments: ["workoutRoutineId": GraphQLVariable("workoutRoutineId")], type: .nonNull(.object(WorkoutRoutine.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(workoutSession: WorkoutSession, workoutRoutine: WorkoutRoutine) {
      self.init(unsafeResultMap: ["__typename": "Query", "workoutSession": workoutSession.resultMap, "workoutRoutine": workoutRoutine.resultMap])
    }

    public var workoutSession: WorkoutSession {
      get {
        return WorkoutSession(unsafeResultMap: resultMap["workoutSession"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "workoutSession")
      }
    }

    public var workoutRoutine: WorkoutRoutine {
      get {
        return WorkoutRoutine(unsafeResultMap: resultMap["workoutRoutine"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "workoutRoutine")
      }
    }

    public struct WorkoutSession: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["WorkoutSession"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(WorkoutSessionFull.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var workoutSessionFull: WorkoutSessionFull {
          get {
            return WorkoutSessionFull(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }

    public struct WorkoutRoutine: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["WorkoutRoutine"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(WorkoutRoutineFull.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var workoutRoutineFull: WorkoutRoutineFull {
          get {
            return WorkoutRoutineFull(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class LoginMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation Login($loginInput: LoginInput!) {
      login(loginInput: $loginInput) {
        __typename
        refreshToken
        accessToken
      }
    }
    """

  public let operationName: String = "Login"

  public var loginInput: LoginInput

  public init(loginInput: LoginInput) {
    self.loginInput = loginInput
  }

  public var variables: GraphQLMap? {
    return ["loginInput": loginInput]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("login", arguments: ["loginInput": GraphQLVariable("loginInput")], type: .nonNull(.object(Login.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(login: Login) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "login": login.resultMap])
    }

    public var login: Login {
      get {
        return Login(unsafeResultMap: resultMap["login"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "login")
      }
    }

    public struct Login: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["AuthResult"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("refreshToken", type: .nonNull(.scalar(String.self))),
          GraphQLField("accessToken", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(refreshToken: String, accessToken: String) {
        self.init(unsafeResultMap: ["__typename": "AuthResult", "refreshToken": refreshToken, "accessToken": accessToken])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var refreshToken: String {
        get {
          return resultMap["refreshToken"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "refreshToken")
        }
      }

      public var accessToken: String {
        get {
          return resultMap["accessToken"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "accessToken")
        }
      }
    }
  }
}

public final class RefreshAccessTokenMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation RefreshAccessToken($refreshToken: String!) {
      refreshAccessToken(refreshToken: $refreshToken) {
        __typename
        accessToken
      }
    }
    """

  public let operationName: String = "RefreshAccessToken"

  public var refreshToken: String

  public init(refreshToken: String) {
    self.refreshToken = refreshToken
  }

  public var variables: GraphQLMap? {
    return ["refreshToken": refreshToken]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("refreshAccessToken", arguments: ["refreshToken": GraphQLVariable("refreshToken")], type: .nonNull(.object(RefreshAccessToken.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(refreshAccessToken: RefreshAccessToken) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "refreshAccessToken": refreshAccessToken.resultMap])
    }

    public var refreshAccessToken: RefreshAccessToken {
      get {
        return RefreshAccessToken(unsafeResultMap: resultMap["refreshAccessToken"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "refreshAccessToken")
      }
    }

    public struct RefreshAccessToken: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["RefreshSuccess"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("accessToken", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(accessToken: String) {
        self.init(unsafeResultMap: ["__typename": "RefreshSuccess", "accessToken": accessToken])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var accessToken: String {
        get {
          return resultMap["accessToken"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "accessToken")
        }
      }
    }
  }
}

public final class SignupMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation Signup($signupInput: SignupInput!) {
      signup(signupInput: $signupInput) {
        __typename
        refreshToken
        accessToken
      }
    }
    """

  public let operationName: String = "Signup"

  public var signupInput: SignupInput

  public init(signupInput: SignupInput) {
    self.signupInput = signupInput
  }

  public var variables: GraphQLMap? {
    return ["signupInput": signupInput]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("signup", arguments: ["signupInput": GraphQLVariable("signupInput")], type: .nonNull(.object(Signup.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(signup: Signup) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "signup": signup.resultMap])
    }

    public var signup: Signup {
      get {
        return Signup(unsafeResultMap: resultMap["signup"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "signup")
      }
    }

    public struct Signup: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["AuthResult"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("refreshToken", type: .nonNull(.scalar(String.self))),
          GraphQLField("accessToken", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(refreshToken: String, accessToken: String) {
        self.init(unsafeResultMap: ["__typename": "AuthResult", "refreshToken": refreshToken, "accessToken": accessToken])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var refreshToken: String {
        get {
          return resultMap["refreshToken"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "refreshToken")
        }
      }

      public var accessToken: String {
        get {
          return resultMap["accessToken"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "accessToken")
        }
      }
    }
  }
}

public final class UpdateWorkoutRoutineMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation UpdateWorkoutRoutine($workoutRoutine: UpdateWorkoutRoutineInput!) {
      updateWorkoutRoutine(workoutRoutine: $workoutRoutine) {
        __typename
        ...workoutRoutineFull
      }
    }
    """

  public let operationName: String = "UpdateWorkoutRoutine"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + WorkoutRoutineFull.fragmentDefinition)
    document.append("\n" + ExerciseRoutineFull.fragmentDefinition)
    return document
  }

  public var workoutRoutine: UpdateWorkoutRoutineInput

  public init(workoutRoutine: UpdateWorkoutRoutineInput) {
    self.workoutRoutine = workoutRoutine
  }

  public var variables: GraphQLMap? {
    return ["workoutRoutine": workoutRoutine]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("updateWorkoutRoutine", arguments: ["workoutRoutine": GraphQLVariable("workoutRoutine")], type: .nonNull(.object(UpdateWorkoutRoutine.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateWorkoutRoutine: UpdateWorkoutRoutine) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "updateWorkoutRoutine": updateWorkoutRoutine.resultMap])
    }

    public var updateWorkoutRoutine: UpdateWorkoutRoutine {
      get {
        return UpdateWorkoutRoutine(unsafeResultMap: resultMap["updateWorkoutRoutine"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "updateWorkoutRoutine")
      }
    }

    public struct UpdateWorkoutRoutine: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["WorkoutRoutine"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(WorkoutRoutineFull.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var workoutRoutineFull: WorkoutRoutineFull {
          get {
            return WorkoutRoutineFull(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class ExerciseRoutinesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query ExerciseRoutines($workoutRoutineId: ID!) {
      exerciseRoutines(workoutRoutineId: $workoutRoutineId) {
        __typename
        ...exerciseRoutineFull
      }
    }
    """

  public let operationName: String = "ExerciseRoutines"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + ExerciseRoutineFull.fragmentDefinition)
    return document
  }

  public var workoutRoutineId: GraphQLID

  public init(workoutRoutineId: GraphQLID) {
    self.workoutRoutineId = workoutRoutineId
  }

  public var variables: GraphQLMap? {
    return ["workoutRoutineId": workoutRoutineId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("exerciseRoutines", arguments: ["workoutRoutineId": GraphQLVariable("workoutRoutineId")], type: .nonNull(.list(.nonNull(.object(ExerciseRoutine.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(exerciseRoutines: [ExerciseRoutine]) {
      self.init(unsafeResultMap: ["__typename": "Query", "exerciseRoutines": exerciseRoutines.map { (value: ExerciseRoutine) -> ResultMap in value.resultMap }])
    }

    public var exerciseRoutines: [ExerciseRoutine] {
      get {
        return (resultMap["exerciseRoutines"] as! [ResultMap]).map { (value: ResultMap) -> ExerciseRoutine in ExerciseRoutine(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: ExerciseRoutine) -> ResultMap in value.resultMap }, forKey: "exerciseRoutines")
      }
    }

    public struct ExerciseRoutine: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["ExerciseRoutine"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(ExerciseRoutineFull.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, active: Bool, name: String, sets: Int, reps: Int) {
        self.init(unsafeResultMap: ["__typename": "ExerciseRoutine", "id": id, "active": active, "name": name, "sets": sets, "reps": reps])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var exerciseRoutineFull: ExerciseRoutineFull {
          get {
            return ExerciseRoutineFull(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class WorkoutRoutineQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query WorkoutRoutine($workoutRoutineId: ID!) {
      workoutRoutine(workoutRoutineId: $workoutRoutineId) {
        __typename
        ...workoutRoutineFull
      }
    }
    """

  public let operationName: String = "WorkoutRoutine"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + WorkoutRoutineFull.fragmentDefinition)
    document.append("\n" + ExerciseRoutineFull.fragmentDefinition)
    return document
  }

  public var workoutRoutineId: GraphQLID

  public init(workoutRoutineId: GraphQLID) {
    self.workoutRoutineId = workoutRoutineId
  }

  public var variables: GraphQLMap? {
    return ["workoutRoutineId": workoutRoutineId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("workoutRoutine", arguments: ["workoutRoutineId": GraphQLVariable("workoutRoutineId")], type: .nonNull(.object(WorkoutRoutine.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(workoutRoutine: WorkoutRoutine) {
      self.init(unsafeResultMap: ["__typename": "Query", "workoutRoutine": workoutRoutine.resultMap])
    }

    public var workoutRoutine: WorkoutRoutine {
      get {
        return WorkoutRoutine(unsafeResultMap: resultMap["workoutRoutine"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "workoutRoutine")
      }
    }

    public struct WorkoutRoutine: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["WorkoutRoutine"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(WorkoutRoutineFull.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var workoutRoutineFull: WorkoutRoutineFull {
          get {
            return WorkoutRoutineFull(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class WorkoutRoutinesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query WorkoutRoutines($limit: Int!, $after: String) {
      workoutRoutines(limit: $limit, after: $after) {
        __typename
        edges {
          __typename
          node {
            __typename
            ...workoutRoutineFull
          }
        }
        pageInfo {
          __typename
          hasNextPage
        }
      }
    }
    """

  public let operationName: String = "WorkoutRoutines"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + WorkoutRoutineFull.fragmentDefinition)
    document.append("\n" + ExerciseRoutineFull.fragmentDefinition)
    return document
  }

  public var limit: Int
  public var after: String?

  public init(limit: Int, after: String? = nil) {
    self.limit = limit
    self.after = after
  }

  public var variables: GraphQLMap? {
    return ["limit": limit, "after": after]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("workoutRoutines", arguments: ["limit": GraphQLVariable("limit"), "after": GraphQLVariable("after")], type: .nonNull(.object(WorkoutRoutine.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(workoutRoutines: WorkoutRoutine) {
      self.init(unsafeResultMap: ["__typename": "Query", "workoutRoutines": workoutRoutines.resultMap])
    }

    public var workoutRoutines: WorkoutRoutine {
      get {
        return WorkoutRoutine(unsafeResultMap: resultMap["workoutRoutines"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "workoutRoutines")
      }
    }

    public struct WorkoutRoutine: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["WorkoutRoutineConnection"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("edges", type: .nonNull(.list(.nonNull(.object(Edge.selections))))),
          GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(edges: [Edge], pageInfo: PageInfo) {
        self.init(unsafeResultMap: ["__typename": "WorkoutRoutineConnection", "edges": edges.map { (value: Edge) -> ResultMap in value.resultMap }, "pageInfo": pageInfo.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var edges: [Edge] {
        get {
          return (resultMap["edges"] as! [ResultMap]).map { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Edge) -> ResultMap in value.resultMap }, forKey: "edges")
        }
      }

      public var pageInfo: PageInfo {
        get {
          return PageInfo(unsafeResultMap: resultMap["pageInfo"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "pageInfo")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["WorkoutRoutineEdge"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("node", type: .nonNull(.object(Node.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(node: Node) {
          self.init(unsafeResultMap: ["__typename": "WorkoutRoutineEdge", "node": node.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var node: Node {
          get {
            return Node(unsafeResultMap: resultMap["node"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "node")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["WorkoutRoutine"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLFragmentSpread(WorkoutRoutineFull.self),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var workoutRoutineFull: WorkoutRoutineFull {
              get {
                return WorkoutRoutineFull(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }
      }

      public struct PageInfo: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PageInfo"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("hasNextPage", type: .nonNull(.scalar(Bool.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(hasNextPage: Bool) {
          self.init(unsafeResultMap: ["__typename": "PageInfo", "hasNextPage": hasNextPage])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var hasNextPage: Bool {
          get {
            return resultMap["hasNextPage"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "hasNextPage")
          }
        }
      }
    }
  }
}

public final class WorkoutSessionsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query WorkoutSessions($limit: Int!, $after: String) {
      workoutSessions(limit: $limit, after: $after) {
        __typename
        edges {
          __typename
          node {
            __typename
            ...workoutSessionFull
          }
        }
        pageInfo {
          __typename
          hasNextPage
        }
      }
    }
    """

  public let operationName: String = "WorkoutSessions"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + WorkoutSessionFull.fragmentDefinition)
    document.append("\n" + ExerciseRoutineFull.fragmentDefinition)
    return document
  }

  public var limit: Int
  public var after: String?

  public init(limit: Int, after: String? = nil) {
    self.limit = limit
    self.after = after
  }

  public var variables: GraphQLMap? {
    return ["limit": limit, "after": after]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("workoutSessions", arguments: ["limit": GraphQLVariable("limit"), "after": GraphQLVariable("after")], type: .nonNull(.object(WorkoutSession.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(workoutSessions: WorkoutSession) {
      self.init(unsafeResultMap: ["__typename": "Query", "workoutSessions": workoutSessions.resultMap])
    }

    public var workoutSessions: WorkoutSession {
      get {
        return WorkoutSession(unsafeResultMap: resultMap["workoutSessions"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "workoutSessions")
      }
    }

    public struct WorkoutSession: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["WorkoutSessionConnection"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("edges", type: .nonNull(.list(.nonNull(.object(Edge.selections))))),
          GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(edges: [Edge], pageInfo: PageInfo) {
        self.init(unsafeResultMap: ["__typename": "WorkoutSessionConnection", "edges": edges.map { (value: Edge) -> ResultMap in value.resultMap }, "pageInfo": pageInfo.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var edges: [Edge] {
        get {
          return (resultMap["edges"] as! [ResultMap]).map { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Edge) -> ResultMap in value.resultMap }, forKey: "edges")
        }
      }

      public var pageInfo: PageInfo {
        get {
          return PageInfo(unsafeResultMap: resultMap["pageInfo"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "pageInfo")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["WorkoutSessionEdge"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("node", type: .nonNull(.object(Node.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(node: Node) {
          self.init(unsafeResultMap: ["__typename": "WorkoutSessionEdge", "node": node.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var node: Node {
          get {
            return Node(unsafeResultMap: resultMap["node"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "node")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["WorkoutSession"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLFragmentSpread(WorkoutSessionFull.self),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var workoutSessionFull: WorkoutSessionFull {
              get {
                return WorkoutSessionFull(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }
      }

      public struct PageInfo: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PageInfo"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("hasNextPage", type: .nonNull(.scalar(Bool.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(hasNextPage: Bool) {
          self.init(unsafeResultMap: ["__typename": "PageInfo", "hasNextPage": hasNextPage])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var hasNextPage: Bool {
          get {
            return resultMap["hasNextPage"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "hasNextPage")
          }
        }
      }
    }
  }
}

public struct ExerciseRoutineFull: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment exerciseRoutineFull on ExerciseRoutine {
      __typename
      id
      active
      name
      sets
      reps
    }
    """

  public static let possibleTypes: [String] = ["ExerciseRoutine"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("active", type: .nonNull(.scalar(Bool.self))),
      GraphQLField("name", type: .nonNull(.scalar(String.self))),
      GraphQLField("sets", type: .nonNull(.scalar(Int.self))),
      GraphQLField("reps", type: .nonNull(.scalar(Int.self))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, active: Bool, name: String, sets: Int, reps: Int) {
    self.init(unsafeResultMap: ["__typename": "ExerciseRoutine", "id": id, "active": active, "name": name, "sets": sets, "reps": reps])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var active: Bool {
    get {
      return resultMap["active"]! as! Bool
    }
    set {
      resultMap.updateValue(newValue, forKey: "active")
    }
  }

  public var name: String {
    get {
      return resultMap["name"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "name")
    }
  }

  public var sets: Int {
    get {
      return resultMap["sets"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "sets")
    }
  }

  public var reps: Int {
    get {
      return resultMap["reps"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "reps")
    }
  }
}

public struct WorkoutRoutineFull: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment workoutRoutineFull on WorkoutRoutine {
      __typename
      id
      name
      active
      exerciseRoutines {
        __typename
        ...exerciseRoutineFull
      }
    }
    """

  public static let possibleTypes: [String] = ["WorkoutRoutine"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("name", type: .nonNull(.scalar(String.self))),
      GraphQLField("active", type: .nonNull(.scalar(Bool.self))),
      GraphQLField("exerciseRoutines", type: .nonNull(.list(.nonNull(.object(ExerciseRoutine.selections))))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, name: String, active: Bool, exerciseRoutines: [ExerciseRoutine]) {
    self.init(unsafeResultMap: ["__typename": "WorkoutRoutine", "id": id, "name": name, "active": active, "exerciseRoutines": exerciseRoutines.map { (value: ExerciseRoutine) -> ResultMap in value.resultMap }])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var name: String {
    get {
      return resultMap["name"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "name")
    }
  }

  public var active: Bool {
    get {
      return resultMap["active"]! as! Bool
    }
    set {
      resultMap.updateValue(newValue, forKey: "active")
    }
  }

  public var exerciseRoutines: [ExerciseRoutine] {
    get {
      return (resultMap["exerciseRoutines"] as! [ResultMap]).map { (value: ResultMap) -> ExerciseRoutine in ExerciseRoutine(unsafeResultMap: value) }
    }
    set {
      resultMap.updateValue(newValue.map { (value: ExerciseRoutine) -> ResultMap in value.resultMap }, forKey: "exerciseRoutines")
    }
  }

  public struct ExerciseRoutine: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["ExerciseRoutine"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(ExerciseRoutineFull.self),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, active: Bool, name: String, sets: Int, reps: Int) {
      self.init(unsafeResultMap: ["__typename": "ExerciseRoutine", "id": id, "active": active, "name": name, "sets": sets, "reps": reps])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(unsafeResultMap: resultMap)
      }
      set {
        resultMap += newValue.resultMap
      }
    }

    public struct Fragments {
      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var exerciseRoutineFull: ExerciseRoutineFull {
        get {
          return ExerciseRoutineFull(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }
    }
  }
}

public struct WorkoutSessionFull: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment workoutSessionFull on WorkoutSession {
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
        id
        exerciseRoutine {
          __typename
          ...exerciseRoutineFull
        }
        sets {
          __typename
          id
          weight
          reps
        }
        notes
      }
      prevExercises {
        __typename
        id
        notes
        sets {
          __typename
          id
          reps
          weight
        }
      }
    }
    """

  public static let possibleTypes: [String] = ["WorkoutSession"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("start", type: .nonNull(.scalar(String.self))),
      GraphQLField("end", type: .scalar(String.self)),
      GraphQLField("workoutRoutine", type: .nonNull(.object(WorkoutRoutine.selections))),
      GraphQLField("exercises", type: .nonNull(.list(.nonNull(.object(Exercise.selections))))),
      GraphQLField("prevExercises", type: .nonNull(.list(.nonNull(.object(PrevExercise.selections))))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, start: String, end: String? = nil, workoutRoutine: WorkoutRoutine, exercises: [Exercise], prevExercises: [PrevExercise]) {
    self.init(unsafeResultMap: ["__typename": "WorkoutSession", "id": id, "start": start, "end": end, "workoutRoutine": workoutRoutine.resultMap, "exercises": exercises.map { (value: Exercise) -> ResultMap in value.resultMap }, "prevExercises": prevExercises.map { (value: PrevExercise) -> ResultMap in value.resultMap }])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var start: String {
    get {
      return resultMap["start"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "start")
    }
  }

  public var end: String? {
    get {
      return resultMap["end"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "end")
    }
  }

  public var workoutRoutine: WorkoutRoutine {
    get {
      return WorkoutRoutine(unsafeResultMap: resultMap["workoutRoutine"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "workoutRoutine")
    }
  }

  public var exercises: [Exercise] {
    get {
      return (resultMap["exercises"] as! [ResultMap]).map { (value: ResultMap) -> Exercise in Exercise(unsafeResultMap: value) }
    }
    set {
      resultMap.updateValue(newValue.map { (value: Exercise) -> ResultMap in value.resultMap }, forKey: "exercises")
    }
  }

  public var prevExercises: [PrevExercise] {
    get {
      return (resultMap["prevExercises"] as! [ResultMap]).map { (value: ResultMap) -> PrevExercise in PrevExercise(unsafeResultMap: value) }
    }
    set {
      resultMap.updateValue(newValue.map { (value: PrevExercise) -> ResultMap in value.resultMap }, forKey: "prevExercises")
    }
  }

  public struct WorkoutRoutine: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["WorkoutRoutine"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, name: String) {
      self.init(unsafeResultMap: ["__typename": "WorkoutRoutine", "id": id, "name": name])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return resultMap["id"]! as! GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
      }
    }

    public var name: String {
      get {
        return resultMap["name"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "name")
      }
    }
  }

  public struct Exercise: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Exercise"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("exerciseRoutine", type: .nonNull(.object(ExerciseRoutine.selections))),
        GraphQLField("sets", type: .nonNull(.list(.nonNull(.object(Set.selections))))),
        GraphQLField("notes", type: .nonNull(.scalar(String.self))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, exerciseRoutine: ExerciseRoutine, sets: [Set], notes: String) {
      self.init(unsafeResultMap: ["__typename": "Exercise", "id": id, "exerciseRoutine": exerciseRoutine.resultMap, "sets": sets.map { (value: Set) -> ResultMap in value.resultMap }, "notes": notes])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return resultMap["id"]! as! GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
      }
    }

    public var exerciseRoutine: ExerciseRoutine {
      get {
        return ExerciseRoutine(unsafeResultMap: resultMap["exerciseRoutine"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "exerciseRoutine")
      }
    }

    public var sets: [Set] {
      get {
        return (resultMap["sets"] as! [ResultMap]).map { (value: ResultMap) -> Set in Set(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Set) -> ResultMap in value.resultMap }, forKey: "sets")
      }
    }

    public var notes: String {
      get {
        return resultMap["notes"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "notes")
      }
    }

    public struct ExerciseRoutine: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["ExerciseRoutine"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(ExerciseRoutineFull.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, active: Bool, name: String, sets: Int, reps: Int) {
        self.init(unsafeResultMap: ["__typename": "ExerciseRoutine", "id": id, "active": active, "name": name, "sets": sets, "reps": reps])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var exerciseRoutineFull: ExerciseRoutineFull {
          get {
            return ExerciseRoutineFull(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }

    public struct Set: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["SetEntry"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("weight", type: .nonNull(.scalar(Double.self))),
          GraphQLField("reps", type: .nonNull(.scalar(Int.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, weight: Double, reps: Int) {
        self.init(unsafeResultMap: ["__typename": "SetEntry", "id": id, "weight": weight, "reps": reps])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var weight: Double {
        get {
          return resultMap["weight"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "weight")
        }
      }

      public var reps: Int {
        get {
          return resultMap["reps"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "reps")
        }
      }
    }
  }

  public struct PrevExercise: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Exercise"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("notes", type: .nonNull(.scalar(String.self))),
        GraphQLField("sets", type: .nonNull(.list(.nonNull(.object(Set.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, notes: String, sets: [Set]) {
      self.init(unsafeResultMap: ["__typename": "Exercise", "id": id, "notes": notes, "sets": sets.map { (value: Set) -> ResultMap in value.resultMap }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return resultMap["id"]! as! GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
      }
    }

    public var notes: String {
      get {
        return resultMap["notes"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "notes")
      }
    }

    public var sets: [Set] {
      get {
        return (resultMap["sets"] as! [ResultMap]).map { (value: ResultMap) -> Set in Set(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Set) -> ResultMap in value.resultMap }, forKey: "sets")
      }
    }

    public struct Set: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["SetEntry"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("reps", type: .nonNull(.scalar(Int.self))),
          GraphQLField("weight", type: .nonNull(.scalar(Double.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, reps: Int, weight: Double) {
        self.init(unsafeResultMap: ["__typename": "SetEntry", "id": id, "reps": reps, "weight": weight])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var reps: Int {
        get {
          return resultMap["reps"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "reps")
        }
      }

      public var weight: Double {
        get {
          return resultMap["weight"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "weight")
        }
      }
    }
  }
}
