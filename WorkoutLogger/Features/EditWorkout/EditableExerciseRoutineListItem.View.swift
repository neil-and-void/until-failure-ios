//
//  EditableExerciseRoutineListItem.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-12-01.
//

import SwiftUI

struct EditableExerciseRoutineListItem: View {
    @Binding var editableExerciseRoutine: EditableExerciseRoutine
    
    var body: some View {
        
        HStack {
            
            TextField("Name", text: $editableExerciseRoutine.name)
                .padding(.horizontal)
                .padding(.vertical, 10)
                .background(.thinMaterial)
                .font(.system(size: 20))
                .cornerRadius(10)
            
            Group {
                
                TextField("Sets", value: $editableExerciseRoutine.sets, formatter: NumberFormatter())
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .background(.thinMaterial)
                    .font(.system(size: 20))
                    .cornerRadius(10)
                    .keyboardType(.numberPad)
                
                TextField("Reps", value: $editableExerciseRoutine.reps, formatter: NumberFormatter())
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .background(.thinMaterial)
                    .font(.system(size: 20))
                    .cornerRadius(10)
                    .keyboardType(.numberPad)
                
            }
            
        }
        
    }
}

struct EditableExerciseRoutineListItem_Previews: PreviewProvider {
    static var previews: some View {
        EditableExerciseRoutineListItem(editableExerciseRoutine: .constant(EditableExerciseRoutine(
            id: "0",
            name: "Squat",
            sets: 4,
            reps: 4
        ))).preferredColorScheme(.dark)
    }
}
