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
    
    func deleteWorkoutSession(id: String, completion: @escaping ((Result<Void, Error>) -> Void)) {
        self.store.withinReadWriteTransaction({ transaction in
            try transaction.removeObject(for: "WorkoutSession:\(id)")

            // TODO: cascade onto other objects
        }, callbackQueue: .main, completion: completion)
    }

    func addExercise(workoutSessionId: String, exercise: Exercise, completion: @escaping ((Result<Void, Error>) -> Void)) {
        self.store.withinReadWriteTransaction({ transaction in
            try transaction.updateObject(
                ofType: WorkoutLoggerAPI.MutableWorkoutSessionDetails.self,
                withKey: "WorkoutSession:\(workoutSessionId)"
            ) { (data: inout WorkoutLoggerAPI.MutableWorkoutSessionDetails) in
                // idk why but this needs to be set for transaction to succeed
                // so we set it to the default value
                data.end = nil

                // set entry cache mutation
                var setEntries: [WorkoutLoggerAPI.MutableWorkoutSessionDetails.Exercise.Set] = []
                var setEntriesJson: [[String: AnyHashable]] = []
                for setEntry in exercise.sets {
                    let setEntryJson: [String: AnyHashable] = [
                        "__typename": "SetEntry",
                        "id": setEntry.id,
                        "reps": setEntry.reps,
                        "weight": setEntry.weight,
                    ]
                    setEntriesJson.append(setEntryJson)
                    setEntries.append(WorkoutLoggerAPI.MutableWorkoutSessionDetails.Exercise.Set(data: DataDict(setEntryJson, variables: nil)))
                }

                // exercise routine
                let exerciseRoutineJson: [String: AnyHashable] = [
                    "__typename": "ExerciseRoutine",
                    "id": exercise.exerciseRoutine.id,
                    "active": exercise.exerciseRoutine.active,
                    "name": exercise.exerciseRoutine.name,
                    "sets": exercise.exerciseRoutine.sets,
                    "reps": exercise.exerciseRoutine.reps,
                ]

                // exercise cache mutation
                let exerciseJson: [String: AnyHashable] = [
                    "__typename": "Exercise",
                    "id": exercise.id,
                    "exerciseRoutine": exerciseRoutineJson,
                    "sets": setEntriesJson,
                    "notes": exercise.notes
                ]

                let exerciseObj = WorkoutLoggerAPI.MutableWorkoutSessionDetails.Exercise(data: DataDict(exerciseJson, variables: nil))
                data.exercises.append(exerciseObj)

            }
        }, callbackQueue: .main, completion: completion)
    }
    
    func updateExercise(id: String, notes: String, completion: @escaping ((Result<Void, Error>) -> Void)) {
        self.store.withinReadWriteTransaction({ transaction in
            try transaction.updateObject(
                ofType: WorkoutLoggerAPI.MutableExerciseDetails.self,
                withKey: "Exercise:\(id)"
            ) { (data: inout WorkoutLoggerAPI.MutableExerciseDetails) in
                data.notes = notes
            }
        }, callbackQueue: .main, completion: completion)
    }

    func updateSetEntry(id: String, reps: Int?, weight: Double?, completion: @escaping ((Result<Void, Error>) -> Void)) {
        self.store.withinReadWriteTransaction({ transaction in
            try transaction.updateObject(
                ofType: WorkoutLoggerAPI.MutableSetEntryDetails.self,
                withKey: "SetEntry:\(id)"
            ) { (data: inout WorkoutLoggerAPI.MutableSetEntryDetails) in
                data.reps = reps ?? 0
                data.weight = weight ?? 0
            }
        })
    }

    func addSetEntry(exerciseId: String, setEntry: SetEntry, completion: @escaping ((Result<Void, Error>) -> Void)) {
        self.store.withinReadWriteTransaction({ transaction in
            try transaction.updateObject(
                ofType: WorkoutLoggerAPI.MutableExerciseDetails.self,
                withKey: "Exercise:\(exerciseId)"
            ) { (data: inout WorkoutLoggerAPI.MutableExerciseDetails) in
                let json: [String: AnyHashable] = [
                    "__typename": "SetEntry",
                    "id": setEntry.id,
                    "reps": setEntry.reps,
                    "weight": setEntry.weight,
                ]
                data.sets.append(WorkoutLoggerAPI.MutableExerciseDetails.Set(data: DataDict(json, variables: nil)))
            }
        }, callbackQueue: .main, completion: completion)
    }

    func deleteSetEntry(id: String, exerciseId: String) {
        self.store.withinReadWriteTransaction({ transaction in
            try transaction.removeObject(for: "SetEntry:\(id)")

            try transaction.updateObject(
                ofType: WorkoutLoggerAPI.MutableExerciseDetails.self,
                withKey: "Exercise:\(exerciseId)"
            ) { (data: inout WorkoutLoggerAPI.MutableExerciseDetails) in
                guard let idx = data.sets.firstIndex(where: { $0.id == id }) else { return }
                data.sets.remove(at: idx)
            }
        }, callbackQueue: .main)
    }
}
