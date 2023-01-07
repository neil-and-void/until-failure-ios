//
//  TestData.swift
//  WorkoutLoggerTests
//
//  Created by Neil Viloria on 2022-11-29.
//

import Foundation

let exerciseRoutines_mock = [
    WorkoutRoutineFull.ExerciseRoutine(id: "12", active: true, name: "Squat", sets: 4, reps: 8),
    WorkoutRoutineFull.ExerciseRoutine(id: "13", active: true, name: "hamstring curls", sets: 4, reps: 10)
]
let workoutRoutinesfull_mock = [WorkoutRoutineFull(id: "11", name: "Legs", active: true, exerciseRoutines: exerciseRoutines_mock)]

let workoutRoutine_mock = WorkoutRoutine(
    id: "11",
    name: "Legs",
    exerciseRoutines: [
        ExerciseRoutine(id: "1", name: "Squat", sets: 4, reps: 6
                       )]
)

let createWorkoutRoutine_mock = CreateWorkoutRoutineMutation.Data.CreateWorkoutRoutine(id: "11", name: "Legs")

let workoutSessionsFull_mock = [WorkoutSession(id: "11", start: Date(), workoutRoutine: EmbeddedWorkoutRoutine(id: "1", name: "Legs"), exercises: [])]
