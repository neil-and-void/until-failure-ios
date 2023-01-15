//
//  LocalCacheMutator.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2023-01-09.
//

import Foundation
import Apollo

class LocalCacheMutator {
    private var store: ApolloStore
    
    init(store: ApolloStore) {
        self.store = store
    }
    
    func addWorkoutRoutine() {}
    
    func updateWorkoutRoutine(workoutRoutine: WorkoutRoutine, completion: @escaping (Result<Void, Error>) -> Void) {
        var exerciseRoutineDict: [String: ExerciseRoutine] = [:]
        
        for exerciseRoutine in workoutRoutine.exerciseRoutines {
            exerciseRoutineDict[exerciseRoutine.id] = exerciseRoutine
        }
        
        store.withinReadWriteTransaction({ transaction in
            try transaction.updateObject(
                ofType: WorkoutLoggerAPI.MutableWorkoutRoutineDetails.self,
                withKey: "WorkoutRoutine:\(workoutRoutine.id)"
            ) { (data: inout WorkoutLoggerAPI.MutableWorkoutRoutineDetails) in
                data.name = workoutRoutine.name
                data.active = workoutRoutine.active
            }
            
            for exerciseRoutine in workoutRoutine.exerciseRoutines {

                if let updatedExerciseRoutine = exerciseRoutineDict[exerciseRoutine.id] {

                    try transaction.updateObject(
                        ofType: WorkoutLoggerAPI.MutableExerciseRoutineDetails.self,
                        withKey: "ExerciseRoutine:\(exerciseRoutine.id)"
                    ) { (exerciseRoutineDetails: inout WorkoutLoggerAPI.MutableExerciseRoutineDetails) in
                        exerciseRoutineDetails.active = updatedExerciseRoutine.active
                        exerciseRoutineDetails.name = updatedExerciseRoutine.name
                        exerciseRoutineDetails.sets = updatedExerciseRoutine.sets
                        exerciseRoutineDetails.reps = updatedExerciseRoutine.reps
                    }
 
                }
                
            }

        }, completion: completion)
    }
    
    func deleteWorkoutRoutine() {}
    
    func addExerciseRoutine() {}
    
    func updateExerciseRoutine() {}
    
    func deleteExerciseRoutine() {}
    
    func addWorkoutSession() {}
    
    func updateWorkoutSession() {}
    
    func deleteWorkoutSession() {}
    
    func addExercise() {}
    
    func updateExercise() {}
    
    func deleteExercise() {}
    
    func addSetEntry() {}
    
    func updateSetEntry() {}
    
    func deleteSetEntry() {}
}
