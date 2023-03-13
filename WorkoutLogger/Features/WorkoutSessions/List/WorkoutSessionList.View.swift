//
//  WorkoutSessionListView.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-20.
//

import SwiftUI

struct WorkoutSessionListView: View {
    @StateObject private var workoutSessionViewModel = WorkoutSessionViewModel(service: WorkoutLoggerAPIService())

    @State private var showDeleteAlert = false
    @State private var showSheet = false

    let limit = 21
    
    var body: some View {

        NavigationStack {
            
            VStack {
                
                List {
                    
                    if workoutSessionViewModel.workoutSessionList.count > 0 {

                        ForEach(workoutSessionViewModel.workoutSessionList, id: \.self.id) { workoutSession in

                            NavigationLink(destination: EditWorkoutSession(workoutSessionId: workoutSession.id, workoutName: workoutSession.workoutRoutine.name, end: workoutSession.end)) {
                                
                                WorkoutSessionListItem(active: true, workoutSession: workoutSession)
                                
                            }
                            
                        }
                        .onDelete(perform: { indexSet in
                            showDeleteAlert.toggle()
                            indexSet.forEach({ i in
                                workoutSessionViewModel.deleteWorkoutSession(id: workoutSessionViewModel.workoutSessionList[i].id, onSuccess: {
                                    workoutSessionViewModel.getWorkoutSessions(limit: limit, after: "", withNetwork: true) // TODO: need to get correct "after" here
                                })
                            })
                        })
//                        .alert("Are you sure you want to delete this workout session", isPresented: $showDeleteAlert) {
//                            Button("Cancel", role: .cancel) { showDeleteAlert.toggle() }
//                            Button("Delete", role: .destructive) {
//                                deleteWorkoutRoutine()
//                                showDeleteAlert.toggle()
//                            }
//                        }

                    } else {
                        
                        Text("You don't have any workouts here, start a workout by tapping \"+\" button at the top")
                            .foregroundColor(.tertiaryText)
                            .multilineTextAlignment(.center)
                            .padding()
                        
                    }
                    
                }
                .listStyle(PlainListStyle())
                .onAppear(perform: {
                    workoutSessionViewModel.getWorkoutSessions(limit: limit, after: "")
                })
                .refreshable {
                    workoutSessionViewModel.getWorkoutSessions(limit: limit, after: "", withNetwork: true)
                }
                
            }
            .toolbar {
                
                ToolbarItem(placement: .navigationBarLeading) {
                    
                    Text("Workouts")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    Button(action: { showSheet.toggle() }) {
                        
                        Image(systemName: "plus")
                        
                    }.buttonStyle(TextButton())
                    
                }
                
            }
            .sheet(isPresented: $showSheet, onDismiss: {
                workoutSessionViewModel.getWorkoutSessions(limit: 21, after: "", withNetwork: true) }
            ) {
                AddWorkoutSession(showSheet: $showSheet, onSelection: { workoutRoutineId in
                    workoutSessionViewModel.addWorkoutSession(workoutRoutineId: workoutRoutineId, start: Date())
                    showSheet = false
                }).presentationDetents([.medium])
 
            }

        }
        
    }
}

struct WorkoutSessionListView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutSessionListView().preferredColorScheme(.dark)
    }
}
