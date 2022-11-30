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
        VStack {
            HStack {
                Text("Routines")
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer()
                
                CreateWorkoutView()

            }.padding(.horizontal)
            
            ScrollView{
                
                ForEach(workoutListViewModel.workoutRoutineList, id: \.self.id) { workoutRoutine in

                    WorkoutListItemView(name: workoutRoutine.name, exerciseCount: workoutRoutine.exerciseRoutines?.count ?? 12)
                    
                }
                
            }
            .onAppear(perform: { workoutListViewModel.getWorkoutRoutines() })
            .padding(.horizontal)
                 
        }
    }
}

struct WorkoutListView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutListView().preferredColorScheme(.dark)
    }
}
