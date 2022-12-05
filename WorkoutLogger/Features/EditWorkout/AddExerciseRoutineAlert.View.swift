//
//  AddExerciseRoutineAlert.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-12-02.
//

import SwiftUI

struct AddExerciseRoutineAlert: View {
    @Binding var name: String
    var onAdd: () -> Void
 
    var body: some View {
        VStack {

            TextField("Name", text: $name)
                .padding()
                .background(.thinMaterial)
                .cornerRadius(10)
            
            Button(action: {}) {
                Text("Cancel")
            }

            Button(action: onAdd ) {
                Text("Add")
            }

        }

    }
}

struct AddExerciseRoutineAlert_Previews: PreviewProvider {
    static var previews: some View {
        AddExerciseRoutineAlert(
            name: .constant("Legs"),
            onAdd: { }
        ).preferredColorScheme(.dark)
    }
}
