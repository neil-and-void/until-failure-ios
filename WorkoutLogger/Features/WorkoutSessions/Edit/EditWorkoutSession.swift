//
//  EditWorkoutSession.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-12-08.
//

import SwiftUI

struct EditWorkoutSession: View {
    var workoutSessionId: String
    var workoutRoutineId: String
    
    @State private var showSheet = false
    @StateObject private var editWorkoutSessionViewModel = EditWorkoutSessionViewModel(service: WorkoutLoggerAPIService())
    
    var body: some View {
        
        Group {
            
            if editWorkoutSessionViewModel.isLoading {
                
                Text("Loading")
                
            } else {
                
                if let workoutSession = Binding<WorkoutSession>($editWorkoutSessionViewModel.workoutSession) {
                    
                    ScrollView {
                        
                        ForEach(workoutSession.exercises) { exercise in
                            
                            EditableExercise(exercise: exercise)
 
                        }
                        
                        Button("+ Add Exercise") {
                            
                            showSheet = true
                            
                        }
                        .buttonStyle(TextButton())
                        .sheet(isPresented: $showSheet) {
                            
                            AddExerciseRoutine(
                                workoutSessionId: workoutSession.id,
                                workoutRoutineId: workoutSession.workoutRoutine.id,
                                showSheet: $showSheet
                            ).presentationDetents([.medium])
                            
                        }
                        
                    }
                    
                } else {
                    
                    Text("Nothing here")
                    
                }
                
            }
            
        }.onAppear {
            editWorkoutSessionViewModel.getWorkoutSession(
                workoutSessionId: workoutSessionId,
                workoutRoutineId: workoutRoutineId
            )
        }
        
    }
}

struct EditWorkoutSession_Previews: PreviewProvider {
    static var previews: some View {
        EditWorkoutSession(workoutSessionId: "1", workoutRoutineId: "1")
    }
}
