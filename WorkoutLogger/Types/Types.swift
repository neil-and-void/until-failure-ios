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

struct ExerciseRoutine: Identifiable {
    var id: String
    var name: String
    var sets: Int
    var reps: Int
}

struct WorkoutRoutine: Identifiable {
    var id: String
    var name: String
    var exerciseRoutines: [ExerciseRoutine]
}

struct WorkoutSession: Identifiable {
    var id: String
    var start: Date
    var end: Date?
    var workoutRoutineId: String
    var exercises: [Exercise]
}

struct Exercise: Identifiable {
    var id: String
    var exerciseRoutineId: String
    var sets: [SetEntry]
    var notes: String
}

struct SetEntry: Identifiable {
    var id: String
    var weight: Float
    var reps: Int
}
