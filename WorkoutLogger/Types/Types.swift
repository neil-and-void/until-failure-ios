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

struct EditableExerciseRoutine: Identifiable {
    var id: String
    var name: String
    var sets: Int
    var reps: Int
}

struct EditableWorkoutRoutine {
    var name: String
    var exerciseRoutines: [EditableExerciseRoutine]
}

