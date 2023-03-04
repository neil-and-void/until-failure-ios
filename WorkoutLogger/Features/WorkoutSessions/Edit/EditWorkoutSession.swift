//
//  EditWorkoutSession.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-12-08.
//

import SwiftUI

struct EditWorkoutSession: View {
    @Environment(\.presentationMode) var presentationMode

    var workoutSessionId: String
    var end: Date?

    @State private var showSheet = false
    @StateObject private var workoutSessionViewModel = WorkoutSessionViewModel(service: WorkoutLoggerAPIService())
    
    var body: some View {
        
        Group {
            
            if workoutSessionViewModel.isLoading {
                
                Text("Loading")
                
            } else {
                
                if let workoutSession = Binding<WorkoutSession>($workoutSessionViewModel.workoutSession) {
                    
                    List {
                        
                        ForEach(workoutSession.exercises) { exercise in
                            
                            EditExercise(
                                textObserver: TextFieldObserver(text: exercise.wrappedValue.notes),
                                exercise: exercise,
                                onEdit: {},
                                onDelete: {
                                    workoutSessionViewModel.getWorkoutSession(workoutSessionId: workoutSessionId, withNetwork: true)
                                }
                            )
                            .listRowInsets(EdgeInsets())
                            .padding(.bottom, 8)
                            .onTapGesture {
                                self.hideKeyboard()
                            }
 
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
                        
                    }.listStyle(.plain).refreshable {
                        workoutSessionViewModel.getWorkoutSession(workoutSessionId: workoutSessionId, withNetwork: true)
                    }
                    
                } else {
                    
                    Text("Nothing here")
                    
                }
                
            }
            
        }.onAppear {
            workoutSessionViewModel.getWorkoutSession(workoutSessionId: workoutSessionId)
        }
        .navigationBarItems(trailing: end == nil ?  Button("Finish", action: {
            workoutSessionViewModel.finishWorkoutSession(id: workoutSessionId)
            self.presentationMode.wrappedValue.dismiss()
        }) : nil)

        
    }
}

struct EditWorkoutSession_Previews: PreviewProvider {
    static var previews: some View {
        EditWorkoutSession(workoutSessionId: "1")
    }
}
