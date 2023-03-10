//
//  EditExercise.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-12-17.
//

import SwiftUI

struct EditExercise: View {
    @StateObject private var exerciseViewModel = ExerciseViewModel(service: WorkoutLoggerAPIService())
    @StateObject var textObserver: TextFieldObserver
    @Binding var exercise: Exercise
    var prevExercise: PrevExercise?
    let onEdit: () -> Void
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
                    Image(systemName: "ellipsis.circle").font(.system(size: 18, weight: .bold))
                }
                
            }
            
            Divider()
            
            EditSetEntryList(
                setEntries: $exercise.sets,
                prevSetEntries: getPrevSetEntries(prevExercise: prevExercise),
                onDelete: {
                    onDelete()
                }
            )
            
            AddSetEntry(
                exerciseId: exercise.id,
                onAdd: { setEntry in
                    // append to exercise sets
                    exercise.sets.append(setEntry)
                },
                onSuccess: {
                    // refreshes the cache entry for this exercise
                    exerciseViewModel.getExercise(id: exercise.id, withNetwork: true)
                }
            )

            Divider()
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Notes")
                        .font(.system(size: 20, weight: .semibold))
                    Spacer()
                    Text("Current")
                    Text("Previous")
                }
                TextField("notes...", text: $textObserver.text, axis: .vertical)
                    .padding(8)
                    .lineLimit(3, reservesSpace: true)
                    .background(.thinMaterial)
                    .cornerRadius(8)
                    .onReceive(textObserver.$debouncedText.dropFirst()) { val in
                        exerciseViewModel.updateExercise(id: exercise.id, notes: val)
                        exercise.notes = val
                    }
            }
        }
        .buttonStyle(PlainButtonStyle())
        .padding(16)
        .background(Color.bgSecondary)
        .cornerRadius(10)
        .padding(.horizontal, 8)
        
    }
    
}

struct EditExercise_Previews: PreviewProvider {
    static var previews: some View {
        
        ScrollView {
            EditExercise(
                textObserver: TextFieldObserver(text: ""),
                exercise: .constant(Exercise(
                    id: "1",
                    exerciseRoutine: ExerciseRoutine(id: "1", name: "Squat", sets: 4, reps: 5),
                    sets: [
                        SetEntry(id: "1", weight: 225, reps: 4),
                        SetEntry(id: "2", weight: 225, reps: 4),
                        SetEntry(id: "3", weight: 225, reps: 4),
                        SetEntry(id: "4", weight: 225, reps: 4),
                    ],
                    notes: "Somwething")
                ), onEdit: {},
                onDelete: {}
            )
            EditExercise(
                textObserver: TextFieldObserver(text: ""),
                exercise: .constant(Exercise(
                    id: "1",
                    exerciseRoutine: ExerciseRoutine(id: "1", name: "Squat", sets: 4, reps: 5),
                    sets: [],
                    notes: "Somwething")
                ), onEdit: {},
                onDelete: {}
            )
        }.preferredColorScheme(.dark)
    }
}
