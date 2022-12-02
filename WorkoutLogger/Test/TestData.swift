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

let workoutSessionsFull_mock = [WorkoutSessionFull(id: "11", start: "july 12", end: "july 13", workoutRoutineId: "1", exercises: [])]
