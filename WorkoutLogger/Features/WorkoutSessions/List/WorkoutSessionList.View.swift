//
//  WorkoutSessionListView.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-20.
//

import SwiftUI

struct WorkoutSessionListView: View {
    @StateObject private var workoutSessionViewModel = WorkoutSessionViewModel(service: WorkoutLoggerAPIService())
    @State var workoutSessionId: String?
    @State private var showSheet = false
    
    var body: some View {

        NavigationStack {
            
            VStack {
                
                List {
                    
                    if workoutSessionViewModel.workoutSessionList.count > 0 {

                        ForEach(workoutSessionViewModel.workoutSessionList, id: \.self.id) { workoutSession in

                            NavigationLink(destination: EditWorkoutSession(workoutSessionId: workoutSession.id, workoutRoutineId: workoutSession.workoutRoutine.id)) {
                                
                                WorkoutSessionListItem(active: true, workoutSession: workoutSession)
                                
                            }
                            
                        }
                        .onDelete(perform: { _ in
                            print("TODO: Delete workout session")
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 12).fill(Color.bgSecondary))
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 0))

                    } else {
                        
                        Text("You don't have any workouts here, start a workout by tapping \"+\" button at the top")
                            .foregroundColor(.tertiaryText)
                            .multilineTextAlignment(.center)
                            .padding()
                        
                    }
                    
                }
                .onAppear(perform: {
                    workoutSessionViewModel.getWorkoutSessions()
                })
                .refreshable {
                    workoutSessionViewModel.getWorkoutSessions(withNetwork: true)
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
            .sheet(isPresented: $showSheet) {
                
                AddWorkoutSession(showSheet: $showSheet) { workoutRoutineId in 
                    workoutSessionViewModel.addWorkoutSession(workoutRoutineId: workoutRoutineId, start: Date(), onSuccess: {
                        showSheet = false
                        workoutSessionViewModel.getWorkoutSessions(withNetwork: true)
                    })
                }.presentationDetents([.medium])
 
            }

        }
        
    }
}

struct WorkoutSessionListView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutSessionListView().preferredColorScheme(.dark)
    }
}
