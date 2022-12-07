//
//  WorkoutListView.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-20.
//

import SwiftUI

struct WorkoutListView: View {
    @StateObject private var workoutListViewModel = WorkoutListViewModel(service: WorkoutLoggerAPIService())
    
    var body: some View {
        NavigationStack {

            VStack {
                
                ScrollView {
                    
                    PullToRefresh(coordinateSpaceName: "pullToRefreshWorkouts") {
                        workoutListViewModel.getWorkoutRoutines(withNetwork: true)
                    }
                    
                    if workoutListViewModel.workoutRoutineList.count > 0 {
                        
                        ForEach(workoutListViewModel.workoutRoutineList, id: \.self.id) { workoutRoutine in
                            
                            NavigationLink(
                                destination: WorkoutDetailsView(workoutRoutineId: workoutRoutine.id)
                            ) {
                                
                                WorkoutListItemView(name: workoutRoutine.name, exerciseCount: workoutRoutine.exerciseRoutines.count)
                                
                            }
                            
                        }
                        
                    } else {
                        
                        Text("You don't have any routines here, tap the '+' above to add a workout")
                            .foregroundColor(.tertiaryText)
                            .multilineTextAlignment(.center)
                            .padding()
                        
                    }
                    
                }
                .onAppear(perform: { workoutListViewModel.getWorkoutRoutines() })
                
            }
            .coordinateSpace(name: "pullToRefreshWorkouts")
            .padding(.horizontal)
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
