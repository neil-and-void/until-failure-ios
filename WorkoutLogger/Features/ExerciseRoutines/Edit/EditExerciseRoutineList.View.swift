//
//  EditExerciseRoutineList.View.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2023-01-10.
//

import SwiftUI

struct EditExerciseRoutineList: View {
    @Binding var exerciseRoutines: [ExerciseRoutine]
    let onDelete: (_ idx: IndexSet) -> Void
    
    var body: some View {
        
        List {
            
            HStack {
                
                Text("Name")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                
                Text("Sets")
                    .font(.headline)
                    .frame(width: 76)
                
                Text("Reps")
                    .font(.headline)
                    .frame(width: 76)
                
            }
            
            ForEach($exerciseRoutines, id: \._id) { exerciseRoutine in
                
                EditWorkoutRoutineListItem(exerciseRoutine: exerciseRoutine).listRowSeparator(.hidden)
                
            }.onDelete(perform: onDelete)
            
        }.listStyle(PlainListStyle())
        
    }
}

struct EditExerciseRoutineList_Previews: PreviewProvider {
    static var previews: some View {
        EditExerciseRoutineList(exerciseRoutines: .constant([
            ExerciseRoutine(id: "1", name: "exercise", sets: 5, reps: 4),
            ExerciseRoutine(id: "2", name: "exercise", sets: 5, reps: 4),
            ExerciseRoutine(id: "3", name: "exercise", sets: 5, reps: 4)
        ]), onDelete: {_ in})
    }
}
