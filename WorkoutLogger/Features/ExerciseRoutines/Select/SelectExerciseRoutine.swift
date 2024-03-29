//
//  SelectExerciseRoutine.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-12-22.
//

import SwiftUI

struct SelectExerciseRoutine: View {
    let workoutSessionId: String
    let workoutRoutineId: String
    let onSelectExerciseRoutine: (Exercise) -> Void
    @StateObject var exerciseRoutineViewModel = ExerciseRoutineViewModel(service: WorkoutLoggerAPIService())
    @Binding var showSheet: Bool
    
    var body: some View {
        VStack {
            HStack {
                Button("Cancel") {
                    showSheet = false
                }
                .buttonStyle(TextButton())
                Spacer()
                Button(action: {
                    exerciseRoutineViewModel.getExerciseRoutines(workoutRoutineId: workoutRoutineId, withNetwork: true)
                }, label: {
                    HStack {
                        Text("Refresh")
                        Image(systemName: "arrow.clockwise")
                    }.foregroundColor(Color.white)
                })
            }
            .padding()
            if exerciseRoutineViewModel.isLoading {
                ProgressView()
            } else {
                
                if let exerciseRoutines = exerciseRoutineViewModel.exerciseRoutines {
                    
                    VStack(alignment: .leading) {
                        
                        Group {
                            
                            Text("Select an Exercise to do...")
                                .font(.system(size: 18, weight: .semibold))
                            
                            if let error = exerciseRoutineViewModel.error {
                                
                                Text(error)
                                    .foregroundColor(.red)
                                
                            }
                            
                        }.padding(.horizontal)
                        
                        List(exerciseRoutines) { exerciseRoutine in
                            
                            Button(action: {
                                exerciseRoutineViewModel.addExercise(
                                    workoutSessionId: workoutSessionId,
                                    exerciseRoutineId: exerciseRoutine.id,
                                    sets: exerciseRoutine.sets,
                                    onSuccess: onSelectExerciseRoutine
                                )
                                showSheet = false
                            }) {
                                
                                HStack {
                                    
                                    Text(exerciseRoutine.name)
                                    
                                    Spacer()
                                    
                                    Text("\(exerciseRoutine.sets) sets x \(exerciseRoutine.reps) reps")
                                        .foregroundColor(.secondaryText)
                                    
                                }
                                
                            }.listRowSeparator(.hidden)
                            
                        }.listStyle(.plain)
                        
                    }
                    
                } else {
                    
                    Text("No exercises for this workout routine").foregroundColor(.tertiaryText)
                    
                }
                
            }
            Spacer()
            
        }.onAppear(perform: { exerciseRoutineViewModel.getExerciseRoutines(workoutRoutineId: workoutRoutineId) })
    }
}

struct AddExerciseRoutine_Previews: PreviewProvider {
    static var previews: some View {
        SelectExerciseRoutine(workoutSessionId: "1", workoutRoutineId: "1", onSelectExerciseRoutine: {_ in }, showSheet: .constant(true))
    }
}
