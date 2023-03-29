//
//  EditExercise.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-12-17.
//

import SwiftUI

struct EditExercise: View {
    @StateObject private var exerciseViewModel = ExerciseViewModel(service: WorkoutLoggerAPIService())
    @Binding var exercise: Exercise
    var prevExercise: PrevExercise?
    let onDelete: () -> Void
    
    func getPrevSetEntries(prevExercise: PrevExercise?) -> [SetEntry] {
        if let prevSetEntries = prevExercise?.sets {
            return prevSetEntries
        }
        return []
    }
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                VStack(alignment: .leading) {
                    Text(exercise.exerciseRoutine.name)
                        .font(.system(size: 24, weight: .semibold))
                    Text("\(String(exercise.exerciseRoutine.sets)) sets, \(String(exercise.exerciseRoutine.reps)) reps")
                        .foregroundColor(.secondaryText)
                }
                Spacer()
                Menu {
                    Button("delete", role: .destructive) {
                        exerciseViewModel.deleteExercise(exerciseId: exercise.id, onSuccess: onDelete)
                    }
                } label: {
                    Image(systemName: "ellipsis.circle").font(.system(size: 22, weight: .bold))
                }
                
            }
            
            Divider()
            
            EditSetEntryList(
                setEntries: $exercise.sets,
                exerciseId: exercise.id,
                prevSetEntries: getPrevSetEntries(prevExercise: prevExercise)
            )
            
            AddSetEntry(
                exerciseId: exercise.id,
                onAdd: {  setEntry in
                    exercise.sets.append(setEntry)
                }
            )
            .padding(.vertical, 8)
            
            Divider()
            
            NotesView(
                textObserver: TextFieldObserver(text: $exercise.wrappedValue.notes),
                prevNotes: prevExercise?.notes,
                onChange: { val in
                    exerciseViewModel.updateExercise(id: exercise.id, notes: val)
                    exercise.notes = val
                }
            )
        }
        .buttonStyle(PlainButtonStyle())
        .padding(16)
        .background(Color.bgSecondary)
        .cornerRadius(10)
        .padding(.horizontal, 8)
        
    }
    
}
