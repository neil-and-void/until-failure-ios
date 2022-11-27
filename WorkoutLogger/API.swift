// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

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
        GraphQLField("workoutRoutines", type: .list(.object(WorkoutRoutine.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(workoutRoutines: [WorkoutRoutine?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "workoutRoutines": workoutRoutines.flatMap { (value: [WorkoutRoutine?]) -> [ResultMap?] in value.map { (value: WorkoutRoutine?) -> ResultMap? in value.flatMap { (value: WorkoutRoutine) -> ResultMap in value.resultMap } } }])
    }

    public var workoutRoutines: [WorkoutRoutine?]? {
      get {
        return (resultMap["workoutRoutines"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [WorkoutRoutine?] in value.map { (value: ResultMap?) -> WorkoutRoutine? in value.flatMap { (value: ResultMap) -> WorkoutRoutine in WorkoutRoutine(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [WorkoutRoutine?]) -> [ResultMap?] in value.map { (value: WorkoutRoutine?) -> ResultMap? in value.flatMap { (value: WorkoutRoutine) -> ResultMap in value.resultMap } } }, forKey: "workoutRoutines")
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
      GraphQLField("exerciseRoutines", type: .list(.object(ExerciseRoutine.selections))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, name: String, exerciseRoutines: [ExerciseRoutine?]? = nil) {
    self.init(unsafeResultMap: ["__typename": "WorkoutRoutine", "id": id, "name": name, "exerciseRoutines": exerciseRoutines.flatMap { (value: [ExerciseRoutine?]) -> [ResultMap?] in value.map { (value: ExerciseRoutine?) -> ResultMap? in value.flatMap { (value: ExerciseRoutine) -> ResultMap in value.resultMap } } }])
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

  public var exerciseRoutines: [ExerciseRoutine?]? {
    get {
      return (resultMap["exerciseRoutines"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [ExerciseRoutine?] in value.map { (value: ResultMap?) -> ExerciseRoutine? in value.flatMap { (value: ResultMap) -> ExerciseRoutine in ExerciseRoutine(unsafeResultMap: value) } } }
    }
    set {
      resultMap.updateValue(newValue.flatMap { (value: [ExerciseRoutine?]) -> [ResultMap?] in value.map { (value: ExerciseRoutine?) -> ResultMap? in value.flatMap { (value: ExerciseRoutine) -> ResultMap in value.resultMap } } }, forKey: "exerciseRoutines")
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
