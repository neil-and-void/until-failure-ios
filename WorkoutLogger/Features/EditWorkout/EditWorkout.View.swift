//
//  EditWorkout.View.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-30.
//

import SwiftUI

struct EditWorkout: View {
    var workoutViewModel: WorkoutViewModel
    @Binding var showSheet: Bool
    @Binding var workoutRoutine: WorkoutRoutine
    
    var body: some View {

        VStack {

            HStack {

                Button(action: { showSheet = false }) {

                    Text("Cancel")

                }.buttonStyle(TextButton())

                Spacer()

                Button(action: {
                    workoutViewModel.updateWorkoutRoutine(workoutRoutine) { 
                        showSheet = false
                    }
                }) {

                    Text("Done")

                }.buttonStyle(TextButton())

            }
            .padding(.top)
            .padding(.horizontal)

                VStack {

                    HStack {

                        EditableWorkoutName(name: $workoutRoutine.name)

                    }

                    List {

                        ForEach($workoutRoutine.exerciseRoutines) { $exerciseRoutine in

                            EditableExerciseRoutineListItem(editableExerciseRoutine: $exerciseRoutine)

                        }.onDelete(perform: { idx in

                            print("skldfjlskd", idx)

                        })

                    }
                    .listStyle(PlainListStyle())
                    
                }


        }
    }
}

struct EditWorkout_Previews: PreviewProvider {
    static var previews: some View {
        EditWorkout(
            workoutViewModel: WorkoutViewModel(service: WorkoutLoggerAPIService()),
            showSheet: .constant(true),
            workoutRoutine: .constant(WorkoutRoutine(id: "2", name: "Name", exerciseRoutines: []))
        ).preferredColorScheme(.dark)
    }
}
