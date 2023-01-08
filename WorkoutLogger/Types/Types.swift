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

struct NewDraftExerciseRoutine {
    var name: String = ""
    var reps: Int = 0
    var sets: Int = 0
}

struct WorkoutRoutine: Identifiable {
    var id: String
    var name: String
    var active: Bool
    var exerciseRoutines: [ExerciseRoutine]
}

struct ExerciseRoutine: Identifiable {
    var _id = UUID()
    var id: String
    var active: Bool
    var name: String
    var sets: Int
    var reps: Int
}

struct WorkoutSession: Identifiable {
    var id: String
    var start: Date
    var end: Date?
    var workoutRoutine: WorkoutRoutine
    var exercises: [Exercise]
    var prevExercises: [Exercise]
}

struct Exercise: Identifiable {
    var id: String
    var exerciseRoutine: ExerciseRoutine
    var sets: [SetEntry]
    var notes: String
}


struct SetEntry: Identifiable {
    var id: String
    var weight: Double
    var reps: Int
}
