//
//  WorkoutSessionParser.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-12-02.
//

import Foundation

protocol WorkoutSessionParserProtocol {
    func parseWorkoutRoutine(_ workoutRoutine: WorkoutRoutine) -> UpdateWorkoutRoutineInput
}

// used for parsing graphql objects to our defined project types
class Parser: WorkoutSessionParserProtocol {
    func parseWorkoutRoutine(_ workoutRoutine: WorkoutRoutine) -> UpdateWorkoutRoutineInput {
        let exerciseRoutines = workoutRoutine.exerciseRoutines.map { exerciseRoutine in
            return UpdateExerciseRoutineInput(
                id: exerciseRoutine.id.count > 0 ? exerciseRoutine.id : nil,
                name: exerciseRoutine.name,
                sets: exerciseRoutine.sets,
                reps: exerciseRoutine.reps
            )
        }
       return UpdateWorkoutRoutineInput(
            id: workoutRoutine.id,
            name: workoutRoutine.name,
            exerciseRoutines: exerciseRoutines
        )
    }
    
}
