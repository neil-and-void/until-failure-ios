//
//  WorkoutListView.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-20.
//

import SwiftUI

struct WorkoutListView: View {
    @StateObject private var workoutListViewModel = WorkoutViewModel(service: WorkoutLoggerAPIService())
    @State private var showDeleteAlert = false
    @State private var workoutRoutineId: String?
    
    func deleteWorkoutRoutine(id: String) {
        workoutListViewModel.deleteWorkoutRoutine(id: id, onSuccess: {
            workoutListViewModel.getWorkoutRoutines()
        })
    }
    
    var body: some View {

        NavigationStack {
            
            VStack {

                if workoutListViewModel.isLoading {
                    ProgressView().padding(.vertical, 32)
                }
                
                List {
                    
                    if !workoutListViewModel.isLoading && workoutListViewModel.workoutRoutineList.count > 0  {

                        
                        ForEach(workoutListViewModel.workoutRoutineList, id: \.self.id) { workoutRoutine in
                            
                            NavigationLink(
                                destination: WorkoutDetailsView(workoutRoutineId: workoutRoutine.id).navigationTitle("Routine Details")
                            ) {
                                
                                WorkoutListItemView(
                                    name: workoutRoutine.name,
                                    exerciseCount: workoutRoutine.exerciseRoutines.count
                                )

                            }
                            .swipeActions(allowsFullSwipe: false, content: {
                                Button("Delete") {
                                    showDeleteAlert = true
                                    workoutRoutineId = workoutRoutine.id
                                }.tint(.red)
                            })
                        }
                        .alert(isPresented: $showDeleteAlert) {
                            Alert(
                                title: Text("Are you sure you want to delete this routine? It will also delete all workouts associated with it"),
                                primaryButton: .destructive(Text("Yes") , action: {
                                    guard let workoutRoutineId = workoutRoutineId else { return }
                                    withAnimation{
                                        deleteWorkoutRoutine(id: workoutRoutineId)
                                    }
                                }),
                                secondaryButton: .cancel()
                            )
                        }

                    } else if !workoutListViewModel.isLoading && workoutListViewModel.workoutRoutineList.count == 0 {

                        
                        Text("You don't have any routines here, tap the '+' above to add a workout")
                            .foregroundColor(.tertiaryText)
                            .multilineTextAlignment(.center)
                            .padding()
                            .listRowSeparator(.hidden)
                        
                    }
                    
                }
                .listStyle(PlainListStyle())
                .onAppear(perform: { workoutListViewModel.getWorkoutRoutines() })
                .refreshable {
                    workoutListViewModel.getWorkoutRoutines(withNetwork: true)
                }
                
            }
            .coordinateSpace(name: "pullToRefreshWorkouts")
            .toolbar {
                
                ToolbarItem(placement: .navigationBarLeading) {
                    
                    Text("Routines")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    CreateWorkoutView(workoutListViewModel: workoutListViewModel)
                    
                }
                
            }
            
        }
        
    }
}

struct WorkoutListView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutListView().preferredColorScheme(.dark)
    }
}
