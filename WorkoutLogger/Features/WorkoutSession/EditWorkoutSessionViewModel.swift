//
//  EditWorkoutSession.ViewModel.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-12-09.
//

class EditWorkoutSessionViewModel: ObservableObject {
    private var service: WorkoutLoggerAPIServiceProtocol
    
    init(service: WorkoutLoggerAPIServiceProtocol) {
        self.service = WorkoutLoggerAPIService()
    }
     
    func getWorkoutSession(workoutSessionId: String) {
        
    }
}

import Foundation
