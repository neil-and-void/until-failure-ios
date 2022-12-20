//
//  EditableExercise.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-12-17.
//

import SwiftUI

struct EditableExercise: View {
    var exercise: Exercise
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct EditableExercise_Previews: PreviewProvider {
    static var previews: some View {
        EditableExercise(exercise: Exercise(
            id: "1",
            exerciseRoutine: EmbeddedExerciseRoutine(id: "1", name: "Squat", sets: 4, reps: 5),
            sets: [SetEntry(id: "1", weight: 225, reps: 4)],
            notes: "Somwething")
        )
    }
}
