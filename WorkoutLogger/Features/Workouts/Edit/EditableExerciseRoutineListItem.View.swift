//
//  EditableExerciseRoutineListItem.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-12-01.
//

import SwiftUI

struct EditableExerciseRoutineListItem: View {
    @Binding var exerciseRoutine: ExerciseRoutine
    
    var body: some View {
        
        HStack {
            
            TextField("Name", text: $exerciseRoutine.name)
                .padding(.horizontal)
                .padding(.vertical, 5)
                .background(.thinMaterial)
                .font(.system(size: 16))
                .cornerRadius(10)
            
            Group {
                
                TextField("Sets", value: $exerciseRoutine.sets, formatter: NumberFormatter())
                    .padding(.horizontal)
                    .padding(.vertical, 4)
                    .background(.thinMaterial)
                    .font(.system(size: 16))
                    .cornerRadius(10)
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.center)
                    .frame(width: 76)
                
                TextField("Reps", value: $exerciseRoutine.reps, formatter: NumberFormatter())
                    .padding(.horizontal)
                    .padding(.vertical, 4)
                    .background(.thinMaterial)
                    .font(.system(size: 16))
                    .cornerRadius(10)
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: 76)
                
            }
            
        }
        
    }
}

struct EditableExerciseRoutineListItem_Previews: PreviewProvider {
    static var previews: some View {
        
        VStack {
            EditableExerciseRoutineListItem(
                exerciseRoutine: .constant(ExerciseRoutine(
                    id: "0",
                    name: "Squat",
                    sets: 9999,
                    reps: 9999
                ))
            )

            EditableExerciseRoutineListItem(
                exerciseRoutine: .constant(ExerciseRoutine(
                    id: "0",
                    name: "Squat",
                    sets: 4,
                    reps: 4
                ))
            )
            
        }
        .preferredColorScheme(.dark)
    }
}
