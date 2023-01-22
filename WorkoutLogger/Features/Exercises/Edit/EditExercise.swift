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
    let onDelete: () -> Void

    func addSetEntry() {
        // optimisitically update ui by passing a uuid for now and then updating later
        let setEntry = SetEntry(id: UUID().uuidString, weight: 0, reps: 0)
        exercise.sets.append(setEntry)

        exerciseViewModel.addSetEntry(
            exerciseId: exercise.id,
            setEntry: setEntry
        )
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
                    }.padding()
                } label: {
                    Image(systemName: "ellipsis").font(.system(size: 18, weight: .bold))
                }
                
            }
            
            Divider()
            
            if exercise.sets.count == 0 {
                
                Text("No set entries yet")
                    .foregroundColor(.tertiaryText)
                    .padding(.vertical, 2)
                    .padding(.horizontal, 2)
                
            } else {
                
                Grid {
                    
                    GridRow {
                        
                        Text("Set")
                            .fontWeight(.semibold)
                        
                        Text("Prev")
                            .fontWeight(.semibold)
                        
                        Text("Reps")
                            .fontWeight(.semibold)
                        
                        Text("Weight")
                            .fontWeight(.semibold)
                        
                    }
                    
                    ForEach($exercise.sets) { setEntry in
                        
                        GridRow {
                            
                            Text(String(1))
                                .fontWeight(.semibold)
                            
                            Text(String("225 lbs x 4 reps"))
                                .frame(maxWidth: .infinity)
                                .padding(4)
                                .lineLimit(1)
                                .multilineTextAlignment(.center)
                                .background(.thinMaterial)
                                .foregroundColor(.secondaryText)
                                .cornerRadius(8)
                            
                            TextField("reps", value: setEntry.reps, formatter: NumberFormatter())
                                .frame(width: 64)
                                .padding(4)
                                .multilineTextAlignment(.center)
                                .background(.thinMaterial)
                                .cornerRadius(8)
                                .keyboardType(.numberPad)
                            
                            TextField("weight", value: setEntry.weight, formatter: NumberFormatter())
                                .frame(width: 64)
                                .padding(4)
                                .multilineTextAlignment(.center)
                                .background(.thinMaterial)
                                .cornerRadius(8)
                                .keyboardType(.decimalPad)
                            
                        }
                        
                    }
                    
                }
                .frame(maxWidth: .infinity)
                
            }
            
            Button {
                
                addSetEntry()

            } label: {
                
                Text("+ Add Set")
                
            }.buttonStyle(TextButton())

            Divider()
            
            VStack(alignment: .leading) {
                
                Text("Notes")
                    .font(.system(size: 20, weight: .semibold))
                
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
                ),
                onDelete: {}
            )
            EditExercise(
                textObserver: TextFieldObserver(text: ""),
                exercise: .constant(Exercise(
                    id: "1",
                    exerciseRoutine: ExerciseRoutine(id: "1", name: "Squat", sets: 4, reps: 5),
                    sets: [],
                    notes: "Somwething")
                ),
                onDelete: {}
            )
        }.preferredColorScheme(.dark)
    }
}
