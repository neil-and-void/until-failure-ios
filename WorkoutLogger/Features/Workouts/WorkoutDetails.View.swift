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
    @State var editableWorkoutRoutine: WorkoutRoutine
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
                    workoutRoutine: $editableWorkoutRoutine
                )

            }
                            
        )
        
    }
    
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutDetailsView(
            workoutViewModel: WorkoutViewModel(service: WorkoutLoggerAPIService()),
            editableWorkoutRoutine: WorkoutRoutine(name: "Legs", exerciseRoutines: []),
            workoutRoutine: WorkoutRoutine(name: "Legs", exerciseRoutines: [])
        ).preferredColorScheme(.dark)
    }
}
