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
            
            CreateWorkoutView()
            
            List(workoutListViewModel.workoutRoutineList, id: \.id) { workoutRoutine in
                Text(workoutRoutine.name)
                
            }.onAppear(perform: workoutListViewModel.getWorkoutRoutines)
           
        }
    }
}

struct WorkoutListView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutListView().preferredColorScheme(.dark)
    }
}
