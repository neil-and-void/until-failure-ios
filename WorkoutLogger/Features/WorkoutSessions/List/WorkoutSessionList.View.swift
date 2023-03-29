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
    @State private var workoutSessionId: String?

    let limit = 30
    
    var body: some View {

        NavigationStack {
            
            VStack {

                if workoutSessionViewModel.isLoading {
                    ProgressView().padding(.vertical, 32)
                }

                List {
                    
                    if !workoutSessionViewModel.isLoading && workoutSessionViewModel.workoutSessionList.count > 0  {

                        ForEach(workoutSessionViewModel.workoutSessionList, id: \.self.id) { workoutSession in

                            NavigationLink(destination: EditWorkoutSession(workoutSessionId: workoutSession.id, workoutName: workoutSession.workoutRoutine.name, end: workoutSession.end)) {
                                
                                WorkoutSessionListItem(active: true, workoutSession: workoutSession)
                                
                            }
                            .swipeActions(allowsFullSwipe: false, content: {
                                Button("Delete") {
                                    showDeleteAlert = true
                                    workoutSessionId = workoutSession.id
                                }.tint(.red)
                            })
                        }
                        .alert(isPresented: $showDeleteAlert) {
                            Alert(
                                title: Text("Are you sure you want to delete this workout?"),
                                primaryButton: .destructive(Text("Yes") , action: {
                                    guard let workoutSessionId = workoutSessionId else { return }
                                    withAnimation{
                                        workoutSessionViewModel.deleteWorkoutSession(id: workoutSessionId, onSuccess: {
                                            // TODO: need to get correct "after" here and delete from cache to not do another network call
                                            workoutSessionViewModel.getWorkoutSessions(limit: limit, after: "", withNetwork: true)
                                        })
                                    }
                                }),
                                secondaryButton: .cancel()
                            )
                        }


                        HStack {
                            Spacer()
                            Text("Showing up to last \(String(limit)) workouts").foregroundColor(.tertiaryText)
                            Spacer()
                        }.listRowSeparator(.hidden)

                    } else if !workoutSessionViewModel.isLoading && workoutSessionViewModel.workoutSessionList.count == 0 {
                        HStack {
                            Spacer()
                            Text("You don't have any workouts here, start a workout by tapping \"+\" button at the top")
                                .foregroundColor(.tertiaryText)
                                .multilineTextAlignment(.center)
                                .padding()
                            Spacer()
                        }.listRowSeparator(.hidden)

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
            .sheet(isPresented: $showSheet) {
                AddWorkoutSession(showSheet: $showSheet, onSelection: { workoutRoutineId in
                    workoutSessionViewModel.addWorkoutSession(
                        workoutRoutineId: workoutRoutineId,
                        start: Date(),
                        onSuccess: {
                            showSheet = false
                            workoutSessionViewModel.getWorkoutSessions(limit: limit, after: "", withNetwork: true)
                        }
                    )
                }).presentationDetents([.medium])

            }

        }.errorAlert($workoutSessionViewModel.error, confirm: {})

    }
}

struct WorkoutSessionListView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutSessionListView().preferredColorScheme(.dark)
    }
}
