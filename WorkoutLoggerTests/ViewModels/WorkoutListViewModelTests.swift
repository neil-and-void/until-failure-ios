//
//  WorkoutViewModelTests.swift
//  WorkoutLoggerTests
//
//  Created by Neil Viloria on 2022-11-29.
//

import XCTest
@testable import WorkoutLogger

final class WorkoutListViewModelTests: XCTestCase {
    var workoutViewModel: WorkoutViewModel!
    var mockWorkoutAPIService: MockWorkoutLoggerAPIService!

    override func setUp() {
        super.setUp()
        mockWorkoutAPIService = MockWorkoutLoggerAPIService()
        workoutViewModel = WorkoutViewModel(service: mockWorkoutAPIService)
    }
    
    func testGetWorkoutRoutinesSuccess() throws {
        workoutViewModel.getWorkoutRoutines()
        XCTAssertNil(workoutViewModel.error)
        
        for (idx, workoutRoutine) in workoutViewModel.workoutRoutineList.enumerated() {
            XCTAssertEqual(workoutRoutinesfull_mock[idx].id, workoutRoutine.id)
            XCTAssertEqual(workoutRoutinesfull_mock[idx].name, workoutRoutine.name)
        }
    }

    func testGetWorkoutRoutinesFailure_NetworkError() throws {
        mockWorkoutAPIService.getWorkoutRoutinesResult = .failure(APIError.networkError)
  
        workoutViewModel.getWorkoutRoutines()

        XCTAssertEqual(APIError.networkError.localizedDescription, workoutViewModel.error, "Errors did not match")
    }

    func testGetWorkoutRoutines_GraphQLError() throws {
        mockWorkoutAPIService.getWorkoutRoutinesResult = .failure(APIError.GraphQLError(gqlError: "Graphql error"))

        workoutViewModel.getWorkoutRoutines()

        XCTAssertEqual(APIError.GraphQLError(gqlError: "Graphql error").localizedDescription, workoutViewModel.error)
    }
    
    func testGetWorkoutRoutines_UnknownError() throws {
        mockWorkoutAPIService.getWorkoutRoutinesResult = .failure(APIError.unknown)

        workoutViewModel.getWorkoutRoutines()

        XCTAssertEqual(APIError.unknown.localizedDescription, workoutViewModel.error)
    }
}
