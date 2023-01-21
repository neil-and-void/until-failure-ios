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
    
    func deleteWorkoutRoutine(id: String) {
        workoutListViewModel.deleteWorkoutRoutine(id: id, onSuccess: {
            workoutListViewModel.getWorkoutRoutines()
        })
    }
    
    var body: some View {

        NavigationStack {
            
            VStack {
                
                List {
                    
                    if workoutListViewModel.workoutRoutineList.count > 0 {
                        
                        ForEach(workoutListViewModel.workoutRoutineList, id: \.self.id) { workoutRoutine in
                            
                            NavigationLink(
                                destination: WorkoutDetailsView(workoutRoutineId: workoutRoutine.id).navigationTitle("Routine Details")
                            ) {
                                
                                WorkoutListItemView(
                                    name: workoutRoutine.name,
                                    exerciseCount: workoutRoutine.exerciseRoutines.count
                                )
 
                            }

                            
                        }
                        .onDelete(perform: { indexSet in
//                            showAlert.toggle()
                            indexSet.forEach({ i in
                                deleteWorkoutRoutine(id: workoutListViewModel.workoutRoutineList[i].id)
                            })
                        })
//                        .alert("Are you sure you want to delete this workout routine", isPresented: $showAlert) {
//                            Button("Cancel", role: .cancel) { showAlert.toggle() }
//                            Button("Delete", role: .destructive) {
//                                deleteWorkoutRoutine()
//                                showAlert.toggle()
//                            }
//                        }
 
                    } else {
                        
                        Text("You don't have any routines here, tap the '+' above to add a workout")
                            .foregroundColor(.tertiaryText)
                            .multilineTextAlignment(.center)
                            .padding()
                        
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
