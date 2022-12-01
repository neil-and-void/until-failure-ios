//
//  WorkoutListView.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-20.
//

import SwiftUI

struct WorkoutListView: View {
    @StateObject private var workoutListViewModel = WorkoutViewModel(service: WorkoutLoggerAPIService())
    
    var body: some View {
        NavigationStack {
            VStack {
                
                ScrollView{

                    if workoutListViewModel.workoutRoutineList.count > 0 {
                        ForEach(workoutListViewModel.workoutRoutineList, id: \.self.id) { workoutRoutine in
                            
                            NavigationLink(destination: WorkoutDetailsView(workout: workoutRoutine)) {
                                
                                WorkoutListItemView(name: workoutRoutine.name, exerciseCount: workoutRoutine.exerciseRoutines?.count ?? 12)
                                
                            }

                        }

                    } else {

                            Text("You don't have any routines here... ADD ONE AND HIT THE GYM")
                                .foregroundColor(.tertiaryText)
                                .multilineTextAlignment(.center)
                                .padding()
                    }


                }
                .onAppear(perform: { workoutListViewModel.getWorkoutRoutines() })
     
            }
            .padding(.horizontal)
            .toolbar {
                 
                 ToolbarItem(placement: .navigationBarLeading) {

                     Text("Routines")
                         .font(.title)
                         .fontWeight(.bold)

                }

                ToolbarItem(placement: .navigationBarTrailing) {

                    CreateWorkoutView()

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
