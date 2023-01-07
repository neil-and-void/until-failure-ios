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
    var getWorkoutRoutinesResult: Result<[WorkoutRoutineFull], APIError> = .success(workoutRoutinesfull_mock)
    var createWorkoutRoutineResult: Result<CreateWorkoutRoutineMutation.Data.CreateWorkoutRoutine, APIError> = .success(createWorkoutRoutine_mock)
    var getWorkoutSessionsResult: Result<[WorkoutSession], APIError> = .success(workoutSessionsFull_mock)
    var updateWorkoutRoutineResult: Result<WorkoutRoutineFull, APIError> = .success(workoutRoutinesfull_mock[0])
    var getWorkoutRoutineResult: Result<WorkoutRoutine, APIError> = .success(workoutRoutine_mock)
   
    init() {}
    
    func deleteWorkoutRoutine(id: String, completion: @escaping (Result<Int, APIError>) -> Void) {}
    
    func getWorkoutRoutines(completion: @escaping (Result<[WorkoutRoutineFull], APIError>) -> Void) {
        completion(getWorkoutRoutinesResult)
    }
    
    func getWorkoutRoutine(workoutRoutineId: String, completion: @escaping (Result<WorkoutRoutine, APIError>) -> Void) {
        completion(getWorkoutRoutineResult)
    }
    
    func createWorkoutRoutine(name: String, completion: @escaping (Result<CreateWorkoutRoutineMutation.Data.CreateWorkoutRoutine, APIError>) -> Void) {
        completion(createWorkoutRoutineResult)
    }
    
    func updateWorkoutRoutine(_ workoutRoutine: WorkoutRoutine, completion: @escaping (Result<WorkoutRoutineFull, APIError>) -> Void) {
        completion(updateWorkoutRoutineResult)
    }
    
    func getWorkoutSessions(completion: @escaping (Result<[WorkoutSession], APIError>) -> Void) {
        completion(getWorkoutSessionsResult)
    }
    
    func addWorkoutSession(id: String, start: String, completion: @escaping (Result<String, APIError>) -> Void) {
        
    }
    
    func getWorkoutSession(workoutRoutineId: String, workoutSessionId: String, completion: @escaping (Result<WorkoutSession, APIError>) -> Void) {
        
    }
    
    func addExercise(workoutSessionId: String, exerciseRoutineId: String, completion: @escaping (Result<String, APIError>) -> Void) {
        
    }
}
