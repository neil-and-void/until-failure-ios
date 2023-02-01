//
//  AddWorkoutSession.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-12-07.
//

import SwiftUI

struct AddWorkoutSession: View {
    @StateObject var workoutViewModel = WorkoutViewModel(service: WorkoutLoggerAPIService())
    @Binding var showSheet: Bool
    var onSelection: (String) -> Void
    
    var body: some View {
        
        Group {
            
            if workoutViewModel.isLoading {
                
                Text("Loading")
                
            } else {
                
                if workoutViewModel.workoutRoutineList.count > 0 {
                    
                    VStack {
                        
                        HStack {
                            
                            Button("Cancel") {
                                
                                showSheet = false
                                
                            }
                            .padding()
                            .buttonStyle(TextButton())
                            
                            Spacer()
                            
                        }
                        
                        HStack {
                            
                            Text("What are you hitting?")
                                .font(.system(size: 18, weight: .semibold))
                            
                            Spacer()
                            
                        }.padding(.horizontal)
                        
                        List {

                            ForEach(workoutViewModel.workoutRoutineList, id: \.self.id) { workoutRoutine in

                                Button(action: { onSelection(workoutRoutine.id) }) {

                                    HStack {

                                        Text(workoutRoutine.name)

                                        Spacer()

                                        Text("\(String(workoutRoutine.exerciseRoutines.count)) exercises")
                                            .foregroundColor(.secondaryText)

                                    }

                                }.listRowSeparator(.hidden)

                            }
                            // TODO: probably put a forEach here
                            
                        }.listStyle(.plain)
                        
                        
                    }
                    
                } else {
                    
                    Text("No routines here...")
                    
                }
                
            }
            
        }.onAppear(perform: { workoutViewModel.getWorkoutRoutines() })
        
    }
}

struct AddWorkoutSession_Previews: PreviewProvider {
    static var previews: some View {
        AddWorkoutSession(showSheet: .constant(true), onSelection: { _ in }).preferredColorScheme(.dark)
    }
}
