//
//  Types.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-18.
//

import Foundation
import Apollo

struct AuthResult {
    var refreshToken: String
    var accessToken: String
}

struct User {
    var id: String
    var name: String
    var email: String
}

struct WorkoutRoutine: Identifiable {
    var id: String
    var name: String
    var active: Bool = true
    var exerciseRoutines: [ExerciseRoutine] = []
}

struct ExerciseRoutine: Identifiable {
    var _id = UUID()
    var id: String
    var active: Bool = true
    var name: String = ""
    var sets: Int = 0
    var reps: Int = 0
}

struct WorkoutSession: Identifiable {
    var id: String
    var start: Date
    var end: Date?
    var workoutRoutine: WorkoutRoutine
    var exercises: [Exercise]
    var prevExercises: [PrevExercise]
}

struct Exercise: Identifiable {
    var id: String
    var exerciseRoutine: ExerciseRoutine = ExerciseRoutine(id: "", active: true, name: "", sets: 0, reps: 0)
    var sets: [SetEntry]
    var notes: String
}

struct PrevExercise: Identifiable{
    var id: String
    var exerciseRoutineId: String
    var sets: [SetEntry]
    var notes: String
}

struct SetEntry: Identifiable {
    var _id = UUID()
    var id: String = ""
    var weight: Double
    var reps: Int
}
