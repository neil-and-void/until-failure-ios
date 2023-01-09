//
//  SelectExerciseRoutine.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-12-22.
//

import SwiftUI

struct AddExerciseRoutine: View {
    let workoutSessionId: String
    let workoutRoutineId: String
    var refetchWorkoutSession: () -> Void
    @StateObject var exerciseRoutineViewModel = ExerciseRoutineViewModel(service: WorkoutLoggerAPIService())
    @Binding var showSheet: Bool
    
    var body: some View {
        Group {
            
            HStack {
                
                Button("Cancel") {
                    
                    showSheet = false
                    
                }
                .padding()
                .buttonStyle(TextButton())
                
                Spacer()
                
            }
            
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
                                    refetchQuery: refetchWorkoutSession
                                )
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
            
        }.onAppear(perform: { exerciseRoutineViewModel.getExerciseRoutines(workoutRoutineId: workoutRoutineId) })
    }
}

struct AddExerciseRoutine_Previews: PreviewProvider {
    static var previews: some View {
        AddExerciseRoutine(workoutSessionId: "1", workoutRoutineId: "1", refetchWorkoutSession: {}, showSheet: .constant(true))
    }
}
