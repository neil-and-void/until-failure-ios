//
//  AddWorkoutSession.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-12-07.
//

import SwiftUI

struct AddWorkoutSession: View {
    @StateObject var workoutListViewModel = WorkoutListViewModel(service: WorkoutLoggerAPIService())
    var onSelection: (String) -> Void
    
    var body: some View {
        
        Group {
            
            if workoutListViewModel.isLoading {
                
                Text("Loading")
                
            } else {
                
                if workoutListViewModel.workoutRoutineList.count > 0 {
                    
                    List {
                        
                        ForEach(workoutListViewModel.workoutRoutineList, id: \.self.id) { workoutRoutine in
                            
                            Button(workoutRoutine.name) {
                                onSelection(workoutRoutine.id)
                            }.foregroundColor(.white)
                            
                        }

                    }
                    
                } else {
                    
                    Text("Nothing Here")
                    
                }
                
            }
            
        }.onAppear(perform: { workoutListViewModel.getWorkoutRoutines() })
    
    }
}

struct AddWorkoutSession_Previews: PreviewProvider {
    static var previews: some View {
        AddWorkoutSession(onSelection: { _ in }).preferredColorScheme(.dark)
    }
}
