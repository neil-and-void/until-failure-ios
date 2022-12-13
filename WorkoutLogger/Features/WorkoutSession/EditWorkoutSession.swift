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
    
    @StateObject private var editWorkoutSessionViewModel = EditWorkoutSessionViewModel(service: WorkoutLoggerAPIService())
    
    var body: some View {
        
        Group {
            
            if editWorkoutSessionViewModel.isLoading {
                
                Text("Loading")
                
            } else {
                
                if let workoutSession = editWorkoutSessionViewModel.workoutSession {
                    
                    List(workoutSession.exercises) { exercise in
                        
                        Text(exercise.exerciseRoutine.name)
                        
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
