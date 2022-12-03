//
//  WorkoutSessionListView.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-20.
//

import SwiftUI

struct WorkoutSessionListView: View {
    @StateObject private var workoutSessionViewModel = WorkoutSessionViewModel(service: WorkoutLoggerAPIService())
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                ScrollView {
                    
                    if workoutSessionViewModel.workoutSessionList.count > 0 {

                        ForEach(workoutSessionViewModel.workoutSessionList, id: \.self.id) { workoutSession in

                            WorkoutSessionListItem(active: true, workoutSession: workoutSession)
                            
                        }

                    } else {
                        
                        Text("You don't have any workouts here, start a workout by tapping \"+\" button at the top")
                            .foregroundColor(.tertiaryText)
                            .multilineTextAlignment(.center)
                            .padding()
                        
                    }
                    
                }.onAppear(perform: { workoutSessionViewModel.getWorkoutSessions() })
                
            }
            .padding(.horizontal)
            .toolbar {
                
                ToolbarItem(placement: .navigationBarLeading) {
                    
                    Text("Workouts")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    Button(action: {}) {
                        
                        Image(systemName: "plus")
                        
                    }.buttonStyle(TextButton())
                    
                }
                
            }
            
        }
        
    }
}

struct WorkoutSessionListView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutSessionListView().preferredColorScheme(.dark)
    }
}
