//
//  WorkoutList.ViewModel.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-22.
//

import Foundation

class WorkoutViewModel: ObservableObject {
    private let service: WorkoutLoggerAPIServiceProtocol
   
    @Published var error: String = ""
//    @Published var workoutRoutineList: WorkoutRoutinesResult
    
    init(service: WorkoutLoggerAPIServiceProtocol) {
        self.service = service
    }
    
    func getWorkoutRoutines() {
        self.service.getWorkoutRoutines() { result in
            print(result)
            switch result {
            case .success(let workoutRoutines):
                self.error = ""
                print(workoutRoutines)
            case .failure(let err):
                self.error = err.error
                print(err.error)
            }
        }
    }
}
