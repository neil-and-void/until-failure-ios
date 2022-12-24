//
//  EditWorkoutSession.ViewModel.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-12-09.
//

import Foundation

class EditWorkoutSessionViewModel: ObservableObject {
    private var service: WorkoutLoggerAPIServiceProtocol
    
    @Published var isLoading = false
    @Published var error: String?
    @Published var workoutSession: WorkoutSession?
    
    init(service: WorkoutLoggerAPIServiceProtocol) {
        self.service = WorkoutLoggerAPIService()
    }
     
    func getWorkoutSession(workoutSessionId: String, workoutRoutineId: String, withNetwork: Bool = false) {
        self.isLoading = true
        self.service.getWorkoutSession(
            workoutRoutineId: workoutRoutineId,
            workoutSessionId: workoutSessionId
        ) { result in
            switch result {
            case .success(let workoutSession):
                self.workoutSession = workoutSession
            case .failure(let err):
                self.error = err.localizedDescription
            }
            self.isLoading = false
        }
    }
}
