//
//  CreateWorkoutViewModelTests.swift
//  WorkoutLoggerTests
//
//  Created by Neil Viloria on 2022-11-29.
//

import XCTest
@testable import WorkoutLogger

final class CreateWorkoutViewModelTests: XCTestCase {
    var workoutListViewModel: WorkoutListViewModel!
    var mockWorkoutAPIService: MockWorkoutLoggerAPIService!
    
    override func setUp() {
        super.setUp()
        mockWorkoutAPIService = MockWorkoutLoggerAPIService()
        workoutListViewModel = WorkoutListViewModel(service: mockWorkoutAPIService)
    }
    
    func testGetWorkoutRoutinesSuccess() throws {
        workoutListViewModel.createWorkoutRoutine(name: "stuff",completion: {result in})
        XCTAssertNil(workoutListViewModel.error)
    }
    
    func testGetWorkoutRoutinesFailure_NetworkError() throws {
        mockWorkoutAPIService.createWorkoutRoutineResult = .failure(APIError.networkError)
        
        workoutListViewModel.createWorkoutRoutine(name: "stuff",completion: {result in})
        
        XCTAssertEqual(APIError.networkError.localizedDescription, workoutListViewModel.error, "Errors did not match")
    }
    
    func testGetWorkoutRoutines_GraphQLError() throws {
        mockWorkoutAPIService.createWorkoutRoutineResult = .failure(APIError.GraphQLError(gqlError: "Graphql error"))
        
        workoutListViewModel.createWorkoutRoutine(name: "stuff",completion: {result in})
        
        XCTAssertEqual(APIError.GraphQLError(gqlError: "Graphql error").localizedDescription, workoutListViewModel.error)
    }
    
    func testGetWorkoutRoutines_UnknownError() throws {
        mockWorkoutAPIService.createWorkoutRoutineResult = .failure(APIError.unknown)
        
        workoutListViewModel.createWorkoutRoutine(name: "stuff", completion: {result in})
        
        XCTAssertEqual(APIError.unknown.localizedDescription, workoutListViewModel.error)
    }
}
