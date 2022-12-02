//
//  MockServices.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-28.
//

import Foundation
import Apollo

final class MockAuthenticationService: AuthServiceProtocol {
    var authResult: Result<AuthResult, APIError> = .success(AuthResult(refreshToken: "refresh_token", accessToken: "access_token"))
    var refreshAccessTokenResult: Result<String, APIError> = .success("access_token")

    init() {}

    func signup(
        email: String,
        name: String,
        password: String,
        confirmPassword: String,
        completion: @escaping (Result<AuthResult, APIError>) -> Void
    ) {
        completion(authResult)
    }
    
    func login(
        email: String,
        password: String,
        completion: @escaping (Result<AuthResult, APIError>) -> Void
    ) {
        completion(authResult)
    }
    
    func refreshAccessToken(
        refreshToken: String,
        completion: @escaping (Result<String, APIError>) -> Void
    ) {
        completion(refreshAccessTokenResult)
    }
}

final class MockWorkoutLoggerAPIService: WorkoutLoggerAPIServiceProtocol {
    var getWorkoutRoutinesResult: Result<[WorkoutRoutinesFull], APIError> = .success(workoutRoutinesfull_mock)
    var createWorkoutRoutineResult: Result<CreateWorkoutRoutineMutation.Data.CreateWorkoutRoutine, APIError> = .success(createWorkoutRoutine_mock)
    var getWorkoutSessions: Result<[WorkoutSessionFull], APIError> = .success(workoutSessionsFull_mock)
   
    init() {}
    
    func getWorkoutRoutines(completion: @escaping (Result<[WorkoutRoutinesFull], APIError>) -> Void) {
        completion(getWorkoutRoutinesResult)
    }
    
    func createWorkoutRoutine(name: String, completion: @escaping (Result<CreateWorkoutRoutineMutation.Data.CreateWorkoutRoutine, APIError>) -> Void) {
        completion(createWorkoutRoutineResult)
    }
    
    func getWorkoutSessions(completion: @escaping (Result<[WorkoutSessionFull], APIError>) -> Void) {
        completion(getWorkoutSessions)
    }
}
