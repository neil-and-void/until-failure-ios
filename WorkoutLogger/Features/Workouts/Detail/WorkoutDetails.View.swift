//
//  WorkoutDetailsView.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-29.
//

import SwiftUI

struct WorkoutDetailsView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @ObservedObject var workoutViewModel = WorkoutViewModel(service: WorkoutLoggerAPIService())
    @State private var showSheet = false
    
    @State var workoutRoutineId: String
    
    var body: some View {
        
        VStack {
 
            if workoutViewModel.isLoading {

                Text("Loading...")

            } else {
                
                if let workoutRoutine = workoutViewModel.workoutRoutine {
                    
                    ExerciseRoutineList(
                        workoutRoutineName: workoutRoutine.name,
                        exerciseRoutines: workoutRoutine.exerciseRoutines
                    )
                    
                } else {

                    Text("Nothing to view here")

                }
                
            }
            
        }
        .navigationBarItems(trailing: Button(action: {
            
            showSheet.toggle()
            
        }, label: { Text("Edit") })
            .buttonStyle(TextButton())
            .sheet(isPresented: $showSheet, onDismiss: { workoutViewModel.getWorkoutRoutine(workoutRoutineId: workoutRoutineId) }) {
                
                if let workoutRoutine = workoutViewModel.workoutRoutine {
                    EditWorkout(
                        workoutViewModel: workoutViewModel,
                        showSheet: $showSheet,
                        originalWorkoutRoutine: workoutRoutine,
                        workoutRoutine: workoutRoutine
                    )
                }
                
            }
                            
        )
        .onAppear(perform: {
            workoutViewModel.getWorkoutRoutine(workoutRoutineId: workoutRoutineId, withNetwork: true)
        })
        
    }
    
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutDetailsView(workoutRoutineId: "23").preferredColorScheme(.dark)
    }
}
