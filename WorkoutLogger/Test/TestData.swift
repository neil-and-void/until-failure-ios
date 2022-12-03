//
//  TestData.swift
//  WorkoutLoggerTests
//
//  Created by Neil Viloria on 2022-11-29.
//

import Foundation

let exerciseRoutines_mock = [
    WorkoutRoutinesFull.ExerciseRoutine(id: "12", name: "Squat", sets: 4, reps: 8),
    WorkoutRoutinesFull.ExerciseRoutine(id: "13", name: "hamstring curls", sets: 4, reps: 10)
]
let workoutRoutinesfull_mock = [WorkoutRoutinesFull(id: "11", name: "Legs", exerciseRoutines: exerciseRoutines_mock)]

let createWorkoutRoutine_mock = CreateWorkoutRoutineMutation.Data.CreateWorkoutRoutine(id: "11", name: "Legs")

let workoutSessionsFull_mock = [WorkoutSession(id: "11", start: Date(), workoutRoutine: EmbeddedWorkoutRoutine(id: "1", name: "Legs"), exercises: [])]
