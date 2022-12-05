//
//  EditWorkout.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-12-05.
//

import Foundation

protocol EditWorkoutViewModelProtocol {}

class EditWorkoutViewModel: ObservableObject {
    private var service: WorkoutLoggerAPIServiceProtocol
    
    init(service: WorkoutLoggerAPIServiceProtocol) {
        self.service = service
    }
}
