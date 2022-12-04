//
//  WorkoutSessionParser.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-12-02.
//

import Foundation

protocol WorkoutSessionParserProtocol {
    func parseGraphQL(workoutSessions: [WorkoutSessionsQuery.Data.WorkoutSession], workoutRoutines: [WorkoutSessionsQuery.Data.WorkoutRoutine]) -> [WorkoutSession]
//    func parseWorkoutSession() ->
}

// used for parsing graphql objects to our defined project types
class WorkoutSessionParser: WorkoutSessionParserProtocol {
    func parseGraphQL(workoutSessions: [WorkoutSessionsQuery.Data.WorkoutSession], workoutRoutines: [WorkoutSessionsQuery.Data.WorkoutRoutine]) -> [WorkoutSession] {
        var workoutRoutineDict: [String:  WorkoutRoutineFull] = [:]
        var exerciseRoutineDict: [String: WorkoutRoutineFull.ExerciseRoutine] = [:]

        for wr in workoutRoutines {
            let workoutRoutine = wr.fragments.workoutRoutineFull
            workoutRoutineDict[workoutRoutine.id] = workoutRoutine

            workoutRoutine.exerciseRoutines.forEach { exerciseRoutine in
                exerciseRoutineDict[exerciseRoutine.id] = exerciseRoutine
            }
        }

        let formatter = ISO8601DateFormatter()
        return workoutSessions.compactMap { ws in
            let workoutSession = ws.fragments.workoutSessionFull
            
            var exercises = workoutSession.exercises.compactMap { exercise in
                var setEntries = exercise.sets.map { setEntry in
                    SetEntry(
                        id: setEntry.id,
                        weight: setEntry.weight,
                        reps: setEntry.reps
                    )
                }

                if let exerciseRoutine = exerciseRoutineDict[exercise.exerciseRoutineId] {
                    return Exercise(
                        id: exercise.id,
                        exerciseRoutine: EmbeddedExerciseRoutine(
                            id: exerciseRoutine.id,
                            name: exerciseRoutine.name,
                            sets: exerciseRoutine.sets,
                            reps: exerciseRoutine.reps
                        ),
                        sets: setEntries,
                        notes: exercise.notes
                    )
                }
                return nil
            }


            if let workoutRoutine = workoutRoutineDict[workoutSession.workoutRoutineId] {
                return WorkoutSession(
                    id: workoutSession.id,
                    start: formatter.date(from: workoutSession.start) ?? Date(),
                    end: formatter.date(from: workoutSession.end ?? ""),
                    workoutRoutine: EmbeddedWorkoutRoutine(id: workoutRoutine.id, name: workoutRoutine.name),
                    exercises: exercises
                )
            }
            return nil
        }
    }
}
