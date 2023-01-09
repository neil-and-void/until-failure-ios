//
//  Workout.ViewModel.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-22.
//

import Foundation

class WorkoutListViewModel: ObservableObject {
    private let service: WorkoutLoggerAPIServiceProtocol
    
    @Published var error: String?
    @Published var isLoading = false
    @Published var workoutRoutineList: [WorkoutRoutine] = []
    
    init(service: WorkoutLoggerAPIServiceProtocol) {
        self.service = service
    }
    
    func getWorkoutRoutines(withNetwork: Bool = false) {
        print("fetch the stuypdi thing")
        self.isLoading = true
        self.service.getWorkoutRoutines(limit: 8, after: "", withNetwork: withNetwork) { result in
            switch result {
            case .success(let workoutRoutines):
                self.error = nil
                self.workoutRoutineList = workoutRoutines
                print("thsese are workotu routeins: ", workoutRoutines)
            case .failure(let err):
                self.error = err.localizedDescription
                print("fvererrrorr:", err.localizedDescription)
            }
            self.isLoading = false
        }
    }
    
    func createWorkoutRoutine(name: String, completion: @escaping (Bool) -> Void) {
        self.isLoading = true
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
        self.isLoading = false
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
