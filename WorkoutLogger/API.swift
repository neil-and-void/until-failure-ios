// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

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

public final class LoginMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation Login($email: String!, $password: String!) {
      login(email: $email, password: $password) {
        __typename
        ... on AuthSuccess {
          __typename
          refreshToken
          accessToken
        }
      }
    }
    """

  public let operationName: String = "Login"

  public var email: String
  public var password: String

  public init(email: String, password: String) {
    self.email = email
    self.password = password
  }

  public var variables: GraphQLMap? {
    return ["email": email, "password": password]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("login", arguments: ["email": GraphQLVariable("email"), "password": GraphQLVariable("password")], type: .nonNull(.object(Login.selections))),
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
      public static let possibleTypes: [String] = ["AuthError", "AuthSuccess"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLTypeCase(
            variants: ["AuthSuccess": AsAuthSuccess.selections],
            default: [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            ]
          )
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public static func makeAuthError() -> Login {
        return Login(unsafeResultMap: ["__typename": "AuthError"])
      }

      public static func makeAuthSuccess(refreshToken: String, accessToken: String) -> Login {
        return Login(unsafeResultMap: ["__typename": "AuthSuccess", "refreshToken": refreshToken, "accessToken": accessToken])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var asAuthSuccess: AsAuthSuccess? {
        get {
          if !AsAuthSuccess.possibleTypes.contains(__typename) { return nil }
          return AsAuthSuccess(unsafeResultMap: resultMap)
        }
        set {
          guard let newValue = newValue else { return }
          resultMap = newValue.resultMap
        }
      }

      public struct AsAuthSuccess: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["AuthSuccess"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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
          self.init(unsafeResultMap: ["__typename": "AuthSuccess", "refreshToken": refreshToken, "accessToken": accessToken])
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
    mutation Signup($email: String!, $name: String!, $password: String!, $confirmPassword: String!) {
      signup(
        email: $email
        name: $name
        password: $password
        confirmPassword: $confirmPassword
      ) {
        __typename
        ... on AuthSuccess {
          __typename
          refreshToken
          accessToken
        }
      }
    }
    """

  public let operationName: String = "Signup"

  public var email: String
  public var name: String
  public var password: String
  public var confirmPassword: String

  public init(email: String, name: String, password: String, confirmPassword: String) {
    self.email = email
    self.name = name
    self.password = password
    self.confirmPassword = confirmPassword
  }

  public var variables: GraphQLMap? {
    return ["email": email, "name": name, "password": password, "confirmPassword": confirmPassword]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("signup", arguments: ["email": GraphQLVariable("email"), "name": GraphQLVariable("name"), "password": GraphQLVariable("password"), "confirmPassword": GraphQLVariable("confirmPassword")], type: .nonNull(.object(Signup.selections))),
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
      public static let possibleTypes: [String] = ["AuthError", "AuthSuccess"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLTypeCase(
            variants: ["AuthSuccess": AsAuthSuccess.selections],
            default: [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            ]
          )
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public static func makeAuthError() -> Signup {
        return Signup(unsafeResultMap: ["__typename": "AuthError"])
      }

      public static func makeAuthSuccess(refreshToken: String, accessToken: String) -> Signup {
        return Signup(unsafeResultMap: ["__typename": "AuthSuccess", "refreshToken": refreshToken, "accessToken": accessToken])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var asAuthSuccess: AsAuthSuccess? {
        get {
          if !AsAuthSuccess.possibleTypes.contains(__typename) { return nil }
          return AsAuthSuccess(unsafeResultMap: resultMap)
        }
        set {
          guard let newValue = newValue else { return }
          resultMap = newValue.resultMap
        }
      }

      public struct AsAuthSuccess: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["AuthSuccess"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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
          self.init(unsafeResultMap: ["__typename": "AuthSuccess", "refreshToken": refreshToken, "accessToken": accessToken])
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
}

public final class WorkoutRoutinesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query WorkoutRoutines {
      workoutRoutines {
        __typename
        ...workoutRoutinesFull
      }
    }
    """

  public let operationName: String = "WorkoutRoutines"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + WorkoutRoutinesFull.fragmentDefinition)
    return document
  }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("workoutRoutines", type: .nonNull(.list(.nonNull(.object(WorkoutRoutine.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(workoutRoutines: [WorkoutRoutine]) {
      self.init(unsafeResultMap: ["__typename": "Query", "workoutRoutines": workoutRoutines.map { (value: WorkoutRoutine) -> ResultMap in value.resultMap }])
    }

    public var workoutRoutines: [WorkoutRoutine] {
      get {
        return (resultMap["workoutRoutines"] as! [ResultMap]).map { (value: ResultMap) -> WorkoutRoutine in WorkoutRoutine(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: WorkoutRoutine) -> ResultMap in value.resultMap }, forKey: "workoutRoutines")
      }
    }

    public struct WorkoutRoutine: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["WorkoutRoutine"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(WorkoutRoutinesFull.self),
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

        public var workoutRoutinesFull: WorkoutRoutinesFull {
          get {
            return WorkoutRoutinesFull(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
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
    query WorkoutSessions {
      workoutRoutines {
        __typename
        ...workoutRoutinesFull
      }
      workoutSessions {
        __typename
        ...workoutSessionFull
      }
    }
    """

  public let operationName: String = "WorkoutSessions"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + WorkoutRoutinesFull.fragmentDefinition)
    document.append("\n" + WorkoutSessionFull.fragmentDefinition)
    return document
  }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("workoutRoutines", type: .nonNull(.list(.nonNull(.object(WorkoutRoutine.selections))))),
        GraphQLField("workoutSessions", type: .nonNull(.list(.nonNull(.object(WorkoutSession.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(workoutRoutines: [WorkoutRoutine], workoutSessions: [WorkoutSession]) {
      self.init(unsafeResultMap: ["__typename": "Query", "workoutRoutines": workoutRoutines.map { (value: WorkoutRoutine) -> ResultMap in value.resultMap }, "workoutSessions": workoutSessions.map { (value: WorkoutSession) -> ResultMap in value.resultMap }])
    }

    public var workoutRoutines: [WorkoutRoutine] {
      get {
        return (resultMap["workoutRoutines"] as! [ResultMap]).map { (value: ResultMap) -> WorkoutRoutine in WorkoutRoutine(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: WorkoutRoutine) -> ResultMap in value.resultMap }, forKey: "workoutRoutines")
      }
    }

    public var workoutSessions: [WorkoutSession] {
      get {
        return (resultMap["workoutSessions"] as! [ResultMap]).map { (value: ResultMap) -> WorkoutSession in WorkoutSession(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: WorkoutSession) -> ResultMap in value.resultMap }, forKey: "workoutSessions")
      }
    }

    public struct WorkoutRoutine: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["WorkoutRoutine"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(WorkoutRoutinesFull.self),
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

        public var workoutRoutinesFull: WorkoutRoutinesFull {
          get {
            return WorkoutRoutinesFull(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
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
  }
}

public struct WorkoutRoutinesFull: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment workoutRoutinesFull on WorkoutRoutine {
      __typename
      id
      name
      exerciseRoutines {
        __typename
        id
        name
        sets
        reps
      }
    }
    """

  public static let possibleTypes: [String] = ["WorkoutRoutine"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("name", type: .nonNull(.scalar(String.self))),
      GraphQLField("exerciseRoutines", type: .nonNull(.list(.nonNull(.object(ExerciseRoutine.selections))))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, name: String, exerciseRoutines: [ExerciseRoutine]) {
    self.init(unsafeResultMap: ["__typename": "WorkoutRoutine", "id": id, "name": name, "exerciseRoutines": exerciseRoutines.map { (value: ExerciseRoutine) -> ResultMap in value.resultMap }])
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
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("sets", type: .nonNull(.scalar(Int.self))),
        GraphQLField("reps", type: .nonNull(.scalar(Int.self))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, name: String, sets: Int, reps: Int) {
      self.init(unsafeResultMap: ["__typename": "ExerciseRoutine", "id": id, "name": name, "sets": sets, "reps": reps])
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
      workoutRoutineId
      exercises {
        __typename
        id
        exerciseRoutineId
        sets {
          __typename
          id
          weight
          reps
        }
        notes
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
      GraphQLField("workoutRoutineId", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("exercises", type: .nonNull(.list(.nonNull(.object(Exercise.selections))))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, start: String, end: String? = nil, workoutRoutineId: GraphQLID, exercises: [Exercise]) {
    self.init(unsafeResultMap: ["__typename": "WorkoutSession", "id": id, "start": start, "end": end, "workoutRoutineId": workoutRoutineId, "exercises": exercises.map { (value: Exercise) -> ResultMap in value.resultMap }])
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

  public var workoutRoutineId: GraphQLID {
    get {
      return resultMap["workoutRoutineId"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "workoutRoutineId")
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

  public struct Exercise: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Exercise"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("exerciseRoutineId", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("sets", type: .nonNull(.list(.nonNull(.object(Set.selections))))),
        GraphQLField("notes", type: .nonNull(.scalar(String.self))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, exerciseRoutineId: GraphQLID, sets: [Set], notes: String) {
      self.init(unsafeResultMap: ["__typename": "Exercise", "id": id, "exerciseRoutineId": exerciseRoutineId, "sets": sets.map { (value: Set) -> ResultMap in value.resultMap }, "notes": notes])
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

    public var exerciseRoutineId: GraphQLID {
      get {
        return resultMap["exerciseRoutineId"]! as! GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "exerciseRoutineId")
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
}
