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
     
    func updateWorkoutRoutine(workoutRoutine: WorkoutRoutine, completion: @escaping (Result<Void, Error>) -> Void) {
        var exerciseRoutineDict: [String: ExerciseRoutine] = [:]
        
        for exerciseRoutine in workoutRoutine.exerciseRoutines where exerciseRoutine.id != "" {
            exerciseRoutineDict[exerciseRoutine.id] = exerciseRoutine
        }
        
        self.store.withinReadWriteTransaction({ transaction in
            let data = try transaction.readObject(
                ofType: WorkoutLoggerAPI.MutableWorkoutRoutineDetails.self,
                withKey: "WorkoutRoutine:\(workoutRoutine.id)"
            )
            
            // delete workout routines that are in cache but not updated workout routine
            for exerciseRoutine in data.exerciseRoutines {
                let exerciseRoutineDeleted = exerciseRoutineDict[exerciseRoutine.id] == nil
                if exerciseRoutineDeleted {
                    try transaction.removeObject(for: "ExerciseRoutine:\(exerciseRoutine.id)")
                }
            }
            
        })
        
        self.store.withinReadWriteTransaction({ transaction in
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
             
            // dispatch queue on main thread so the completion handler can update the view
        }, callbackQueue: .main, completion: completion)
        
    }
    
    func deleteWorkoutRoutine(id: String, completion: @escaping ((Result<Void, Error>) -> Void)) {
        self.store.withinReadWriteTransaction({ transaction in
            let data = try transaction.readObject(
                ofType: WorkoutLoggerAPI.MutableWorkoutRoutineDetails.self,
                withKey: "WorkoutRoutine:\(id)"
            )

            // delete workout routines and cascade changes on exercise routines
            try transaction.removeObject(for: "WorkoutRoutine:\(id)")
            for exerciseRoutine in data.exerciseRoutines {
                try transaction.removeObject(for: "ExerciseRoutine:\(exerciseRoutine.id)")
            }
            
        }, callbackQueue: .main, completion: completion)
    }
    
    func addWorkoutSession() {}
    
    func updateWorkoutSession() {}
    
    func deleteWorkoutSession(id: String, completion: @escaping ((Result<Void, Error>) -> Void)) {
        self.store.withinReadWriteTransaction({ transaction in
            try transaction.removeObject(for: "WorkoutSession:\(id)")

            // TODO: cascade onto other objects
        }, callbackQueue: .main, completion: completion)
    }
    
    func addExercise() {}
    
    func updateExercise() {}
    
    func deleteExercise() {}
    
    func addSetEntry() {}
    
    func updateSetEntry() {}
    
    func deleteSetEntry() {}
}
