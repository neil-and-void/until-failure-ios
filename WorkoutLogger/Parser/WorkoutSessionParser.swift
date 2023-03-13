//
//  WorkoutSessionParser.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-12-02.
//

import Foundation

protocol WorkoutLoggerAPIParserProtocol {
    // parses graphql to our native types
    static func WorkoutRoutine(_ workoutRoutine: WorkoutLoggerAPI.WorkoutRoutineFull) -> WorkoutRoutine
    static func ExerciseRoutine(_ exerciseRoutine: WorkoutLoggerAPI.ExerciseRoutineFull) -> ExerciseRoutine
    static func WorkoutSession(_ workoutSession: WorkoutLoggerAPI.WorkoutSessionFull) -> WorkoutSession
    static func Exercise(_ exercise: WorkoutLoggerAPI.ExerciseDetails) -> Exercise
    static func SetEntry(_ setEntry: WorkoutLoggerAPI.SetEntryFull) -> SetEntry
    
    // parses from our native types to graphql types (mostly graphql inputs)
    static func UpdateWorkoutRoutineInput(_ workoutRoutine: WorkoutRoutine) -> WorkoutLoggerAPI.UpdateWorkoutRoutineInput
    static func AddSetEntryInput(_ setEntry: SetEntry) -> WorkoutLoggerAPI.SetEntryInput
}

// used for parsing graphql objects to our defined project types
class Parser: WorkoutLoggerAPIParserProtocol {
    static func WorkoutRoutine(_ workoutRoutine: WorkoutLoggerAPI.WorkoutRoutineFull) -> WorkoutRoutine {
        let exerciseRoutines = workoutRoutine.exerciseRoutines.compactMap { ExerciseRoutine($0.fragments.exerciseRoutineFull)}
        let sortedExerciseRoutines = exerciseRoutines.sorted(by: { $0.id < $1.id })
        
        return WorkoutLogger.WorkoutRoutine(
            id: workoutRoutine.id,
            name: workoutRoutine.name,
            active: workoutRoutine.active,
            exerciseRoutines: sortedExerciseRoutines
        )
    }
    
    static func ExerciseRoutine(_ exerciseRoutine: WorkoutLoggerAPI.ExerciseRoutineFull) -> ExerciseRoutine {
        return WorkoutLogger.ExerciseRoutine(
            id: exerciseRoutine.id,
            active: exerciseRoutine.active,
            name: exerciseRoutine.name,
            sets: exerciseRoutine.sets,
            reps: exerciseRoutine.reps
        )
    }

    static func ExerciseRoutines(_ exerciseRoutines: [WorkoutLoggerAPI.ExerciseRoutinesQuery.Data.ExerciseRoutine]) -> [ExerciseRoutine] {
        return exerciseRoutines.map({ ExerciseRoutine($0.fragments.exerciseRoutineFull) })
    }
    
    static func WorkoutSession(_ workoutSession: WorkoutLoggerAPI.WorkoutSessionFull) -> WorkoutSession {
        let workoutRoutine = WorkoutLogger.WorkoutRoutine(
            id: workoutSession.workoutRoutine.id,
            name: workoutSession.workoutRoutine.name
        )
        
        let exercises = workoutSession.exercises.compactMap {
            var exercise = Exercise($0.fragments.exerciseDetails)
            let exerciseRoutine = WorkoutLogger.ExerciseRoutine(
                id: $0.exerciseRoutine.id,
                name: $0.exerciseRoutine.name,
                sets: $0.exerciseRoutine.sets,
                reps: $0.exerciseRoutine.reps
            )
            exercise.exerciseRoutine = exerciseRoutine
            return exercise
        }
        let sortedExercises = exercises.sorted(by: { $0.id < $1.id })
 
        let prevExercises = workoutSession.prevExercises.compactMap { PrevExercise($0.fragments.prevExerciseFull) }
    
        return WorkoutLogger.WorkoutSession(
            id: workoutSession.id,
            start: workoutSession.start,
            end: workoutSession.end,
            workoutRoutine: workoutRoutine,
            exercises: sortedExercises,
            prevExercises: prevExercises
        )
    }
   
    static func Exercise(_ exercise: WorkoutLoggerAPI.ExerciseDetails) -> Exercise {
        let setEntries = exercise.sets.compactMap { SetEntry($0.fragments.setEntryFull) }
        let sortedSetEntries = setEntries.sorted(by: { $0.id < $1.id })
        return WorkoutLogger.Exercise(id: exercise.id, sets: sortedSetEntries, notes: exercise.notes)
    }

    static func ExerciseFull(_ exercise: WorkoutLoggerAPI.ExerciseFull) -> Exercise {
        let setEntries = exercise.sets.compactMap { SetEntry($0.fragments.setEntryFull) }
        let sortedSetEntries = setEntries.sorted(by: { $0.id < $1.id })
        let exerciseRoutine = ExerciseRoutine(exercise.exerciseRoutine.fragments.exerciseRoutineFull)
        return WorkoutLogger.Exercise(id: exercise.id, exerciseRoutine: exerciseRoutine, sets: sortedSetEntries, notes: exercise.notes)
    }

    static func PrevExercise(_ prevExercise: WorkoutLoggerAPI.PrevExerciseFull) -> PrevExercise {
        let setEntries = prevExercise.sets.compactMap { SetEntry($0.fragments.setEntryFull) }
        let sortedSetEntries = setEntries.sorted(by: { $0.id < $1.id })
        return WorkoutLogger.PrevExercise(
            id: prevExercise.id,
            exerciseRoutineId: prevExercise.exerciseRoutine.id,
            sets: sortedSetEntries,
            notes: prevExercise.notes
        )
    }
    
    static func SetEntry(_ setEntry: WorkoutLoggerAPI.SetEntryFull) -> SetEntry {
        return WorkoutLogger.SetEntry(id: setEntry.id, weight: setEntry.weight, reps: setEntry.reps)
    }
    
    static func UpdateWorkoutRoutineInput(_ workoutRoutine: WorkoutRoutine) -> WorkoutLoggerAPI.UpdateWorkoutRoutineInput {
        let exerciseRoutines = workoutRoutine.exerciseRoutines.map { exerciseRoutine in
            
            // convert to optional string because since id is required in exercise routine struct
            // but the argument is optional in the update input
            let exerciseRoutineId: String? = exerciseRoutine.id.count > 0 ? exerciseRoutine.id : nil
            
            return WorkoutLoggerAPI.UpdateExerciseRoutineInput(
                id: exerciseRoutineId ?? .none,
                name: exerciseRoutine.name,
                sets: exerciseRoutine.sets,
                reps: exerciseRoutine.reps
            )
        }
        
        return WorkoutLoggerAPI.UpdateWorkoutRoutineInput(
            id: workoutRoutine.id,
            name: workoutRoutine.name,
            exerciseRoutines: exerciseRoutines
        )
    }
    
    static func AddSetEntryInput(_ setEntry: SetEntry) -> WorkoutLoggerAPI.SetEntryInput {
        return WorkoutLoggerAPI.SetEntryInput(weight: setEntry.weight, reps: setEntry.reps)
    }
    
}
