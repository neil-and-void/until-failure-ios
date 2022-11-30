//
//  CreateWorkoutViewModelTests.swift
//  WorkoutLoggerTests
//
//  Created by Neil Viloria on 2022-11-29.
//

import XCTest
@testable import WorkoutLogger

final class CreateWorkoutViewModelTests: XCTestCase {
    var creatWorkoutViewModel: CreateWorkoutViewModel!
    var mockWorkoutAPIService: MockWorkoutLoggerAPIService!

    override func setUp() {
        super.setUp()
        mockWorkoutAPIService = MockWorkoutLoggerAPIService()
        creatWorkoutViewModel = CreateWorkoutViewModel(service: mockWorkoutAPIService)
    }
    
    func testGetWorkoutRoutinesSuccess() throws {
        creatWorkoutViewModel.createWorkoutRoutine(onCompletion: {result in})
        XCTAssertNil(creatWorkoutViewModel.error)
    }

    func testGetWorkoutRoutinesFailure_NetworkError() throws {
        mockWorkoutAPIService.createWorkoutRoutineResult = .failure(APIError.networkError)
  
        creatWorkoutViewModel.createWorkoutRoutine(onCompletion: {result in})

        XCTAssertEqual(APIError.networkError.localizedDescription, creatWorkoutViewModel.error, "Errors did not match")
    }

    func testGetWorkoutRoutines_GraphQLError() throws {
        mockWorkoutAPIService.createWorkoutRoutineResult = .failure(APIError.GraphQLError(gqlError: "Graphql error"))

        creatWorkoutViewModel.createWorkoutRoutine(onCompletion: {result in})

        XCTAssertEqual(APIError.GraphQLError(gqlError: "Graphql error").localizedDescription, creatWorkoutViewModel.error)
    }
    
    func testGetWorkoutRoutines_UnknownError() throws {
        mockWorkoutAPIService.createWorkoutRoutineResult = .failure(APIError.unknown)

        creatWorkoutViewModel.createWorkoutRoutine(onCompletion: {result in})

        XCTAssertEqual(APIError.unknown.localizedDescription, creatWorkoutViewModel.error)
    }
}
