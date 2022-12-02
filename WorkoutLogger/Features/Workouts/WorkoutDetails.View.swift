//
//  WorkoutDetailsView.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-29.
//

import SwiftUI

struct WorkoutDetailsView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @ObservedObject var workoutViewModel: WorkoutViewModel
    @State private var showSheet = false
    @State var updateWorkoutRoutineDraft: WorkoutRoutine
    var workoutRoutine: WorkoutRoutine
    
    var body: some View {
        
        Group {
            
            Text(workoutRoutine.name)
                .font(.title)
                .fontWeight(.bold)
            
            ExerciseRoutineList(exerciseRoutines: workoutRoutine.exerciseRoutines)
            
        }
        .navigationBarItems(trailing:
                                Button(action: { showSheet.toggle() }, label: { Text("Edit") })
            .buttonStyle(TextButton())
            .sheet(isPresented: $showSheet) {

                EditWorkout(
                    workoutViewModel: workoutViewModel,
                    showSheet: $showSheet,
                    workoutRoutine: $updateWorkoutRoutineDraft
                )

            }
                            
        )
        
    }
    
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutDetailsView(
            workoutViewModel: WorkoutViewModel(service: WorkoutLoggerAPIService()),
            updateWorkoutRoutineDraft: WorkoutRoutine(id: "0", name: "Legs", exerciseRoutines: []),
            workoutRoutine: WorkoutRoutine(id: "0" , name: "Legs", exerciseRoutines: [])
        ).preferredColorScheme(.dark)
    }
}
