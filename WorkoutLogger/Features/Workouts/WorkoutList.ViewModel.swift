//
//  Workout.ViewModel.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-22.
//

import Foundation
import Apollo

class WorkoutListViewModel: ObservableObject {
    private let service: WorkoutLoggerAPIServiceProtocol
    
    @Published var error: String?
    @Published var workoutRoutineList: [WorkoutRoutineFull] = []
    
    init(service: WorkoutLoggerAPIServiceProtocol) {
        self.service = service
    }
    
    func getWorkoutRoutines(withNetwork: Bool = false) {
        self.service.getWorkoutRoutines(withNetwork: withNetwork) { result in
            switch result {
            case .success(let workoutRoutines):
                self.error = nil
                self.workoutRoutineList = workoutRoutines
            case .failure(let err):
                self.error = err.localizedDescription
            }
        }
    }
    
    func createWorkoutRoutine(name: String, completion: @escaping (Bool) -> Void) {
        self.service.createWorkoutRoutine(name: name) { result in
            switch result {
            case .success:
                self.error = nil
                self.getWorkoutRoutines(withNetwork: true)
                completion(true)
            case .failure(let err):
                self.error = err.localizedDescription
            }
        }
    }
    
    func deleteWorkoutRoutine(id: String) {
        self.service.deleteWorkoutRoutine(id: id) { result in
            switch result {
            case .success:
                print(result as Any)
                self.error = nil
            case .failure(let err):
                self.error = err.localizedDescription
            }
        }
    }
}
