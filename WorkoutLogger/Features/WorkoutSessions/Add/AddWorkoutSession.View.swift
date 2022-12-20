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
                    
                    VStack {
                        
                        HStack {
                            
                            Button("Cancel") {
                                
                                print("cancel")
                                
                            }
                            .padding()
                            .buttonStyle(TextButton())
                            
                            Spacer()
                            
                        }
                        
                        HStack {
                               
                            Text("Select a Routine...")
                                .font(.system(size: 18, weight: .semibold))
                            
                            Spacer()
                            
                        }.padding(.horizontal)
                    
                        List {
                            
                            ForEach(workoutListViewModel.workoutRoutineList, id: \.self.id) { workoutRoutine in
                                
                                SelectWorkoutRoutine(
                                    name: workoutRoutine.name,
                                    exerciseCount: workoutRoutine.exerciseRoutines.count
                                )
                                .listRowSeparator(.hidden)
                                
                            }

                        }.listStyle(.plain)

                        
                    }
                    
                } else {
                    
                    Text("No routines here...")
                    
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
