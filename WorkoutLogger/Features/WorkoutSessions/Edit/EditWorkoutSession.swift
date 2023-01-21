//
//  EditWorkoutSession.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-12-08.
//

import SwiftUI

struct EditWorkoutSession: View {
    var workoutSessionId: String

    @State private var showSheet = false
    @StateObject private var workoutSessionViewModel = WorkoutSessionViewModel(service: WorkoutLoggerAPIService())
    
    var body: some View {
        
        Group {
            
            if workoutSessionViewModel.isLoading {
                
                Text("Loading")
                
            } else {
                
                if let workoutSession = Binding<WorkoutSession>($workoutSessionViewModel.workoutSession) {
                    
                    ScrollView {
                        
                        ForEach(workoutSession.exercises) { exercise in
                            
                            EditableExercise(exercise: exercise)
 
                        }
                        
                        Button("+ Add Exercise") {
                            
                            showSheet = true
                            
                        }
                        .buttonStyle(TextButton())
                        .sheet(isPresented: $showSheet) {
                            
                            SelectExerciseRoutine(
                                workoutSessionId: workoutSession.id,
                                workoutRoutineId: workoutSession.workoutRoutine.id,
                                onSelectExerciseRoutine: {
                                    workoutSessionViewModel.getWorkoutSession(workoutSessionId: workoutSessionId, withNetwork: true)
                                },
                                showSheet: $showSheet
                            ).presentationDetents([.medium])
                            
                        }
                        
                    }
                    
                } else {
                    
                    Text("Nothing here")
                    
                }
                
            }
            
        }.onAppear {
            workoutSessionViewModel.getWorkoutSession(workoutSessionId: workoutSessionId)
        }
        
    }
}

struct EditWorkoutSession_Previews: PreviewProvider {
    static var previews: some View {
        EditWorkoutSession(workoutSessionId: "1")
    }
}
