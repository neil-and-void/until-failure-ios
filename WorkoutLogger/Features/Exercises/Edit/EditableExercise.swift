//
//  EditableExercise.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-12-17.
//

import SwiftUI

struct EditableExercise: View {
    @Binding var exercise: Exercise
    
    var body: some View {
        
        GeometryReader { geometry in
            
            VStack(alignment: .leading) {
                
                VStack(alignment: .leading) {
                    
                    Text("Squat")
                        .font(.system(size: 24, weight: .semibold))
                    
                    Text("\(String(4)) sets, \(6) reps")
                        .foregroundColor(.secondaryText)
                    
                }
                
                Divider()
                
                
                Grid {
                    
                    GridRow {
                        
                        Text("Sets")
                        
                        Text("Prev")
                        
                        Text("Reps")
                        
                        Text("Sets")
                        
                    }
                    
                    ForEach($exercise.sets) { setEntry in
                        
                        GridRow {
                            
                            Text(String(1))
                                .fontWeight(.semibold)
                            
                            Text(String("225 lbs x 4 reps"))
                                .frame(width: .infinity)
                                .padding(4)
                                .lineLimit(1)
                                .multilineTextAlignment(.center)
                                .background(.thinMaterial)
                                .cornerRadius(8)
                            
                            TextField("reps", value: setEntry.reps, formatter: NumberFormatter())
                                .frame(width: 64)
                                .padding(4)
                                .multilineTextAlignment(.center)
                                .background(.thinMaterial)
                                .cornerRadius(8)
                            
                            TextField("weight", value: setEntry.weight, formatter: NumberFormatter())
                                .frame(width: 64)
                                .padding(4)
                                .multilineTextAlignment(.center)
                                .background(.thinMaterial)
                                .cornerRadius(8)
                            
                        }
                        
                    }
                    
                    Button {
                        
                        print("flksdjf")
                        
                    } label: {
                        
                        Text("+ Add Set")
                        
                    }
                    
                }.frame(width: geometry.size.width)
                
                Divider()
                
                Text("Notes")
                    .font(.system(size: 20, weight: .semibold))
                
                TextField("notes...", text: $exercise.notes, axis: .vertical)
                    .padding(4)
                    .lineLimit(3, reservesSpace: true)
                    .background(.thinMaterial)
                    .cornerRadius(8)
                
            }
            .padding(10)
            .background(Color.bgSecondary)
            .cornerRadius(10)
            
        }
        
        
        
    }
}

struct EditableExercise_Previews: PreviewProvider {
    static var previews: some View {
        EditableExercise(exercise: .constant(Exercise(
            id: "1",
            exerciseRoutine: EmbeddedExerciseRoutine(id: "1", name: "Squat", sets: 4, reps: 5),
            sets: [
                SetEntry(id: "1", weight: 225, reps: 4),
                SetEntry(id: "2", weight: 225, reps: 4),
                SetEntry(id: "3", weight: 225, reps: 4),
                SetEntry(id: "4", weight: 225, reps: 4),
            ],
            notes: "Somwething"))
        ).preferredColorScheme(.dark)
    }
}
