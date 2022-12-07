//
//  EditWorkout.View.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-30.
//

import SwiftUI

struct EditWorkout: View {
    @StateObject var workoutViewModel: WorkoutViewModel
    @State var showAlert: Bool = false
    
    @Binding var showSheet: Bool
    @State var workoutRoutine: WorkoutRoutine

    var body: some View {
        ZStack {

            VStack {
                
                HStack {
                    
                    Button("Cancel") {
                        
                        showSheet = false
                        
                    }.buttonStyle(TextButton())
                    
                    Spacer()
                    
                    Button("Done") {

                        workoutViewModel.updateWorkoutRoutine(workoutRoutine) {
                            showSheet = false
                        }

                    }.buttonStyle(TextButton())

                }
                .padding(.top)
                .padding(.horizontal)
                
                VStack {

                    HStack {

                        EditableWorkoutName(name: $workoutRoutine.name)

                    }

                    List {

                        Button(action: { showAlert.toggle() }) {

                            Text("Add exercise")

                        }
                        .buttonStyle(TextButton())
                        .alert("Add exercise", isPresented: $showAlert) {
                            AddExerciseRoutineAlert(
                                onAdd: { exerciseName in
                                    workoutRoutine.exerciseRoutines.append(ExerciseRoutine(
                                        id: "",
                                        name: exerciseName,
                                        sets: 0,
                                        reps: 0
                                    ))
                                }
                            ).preferredColorScheme(.dark)
                        }

                        ForEach($workoutRoutine.exerciseRoutines, id: \.self._id) { $exerciseRoutine in

                            EditableExerciseRoutineListItem(editableExerciseRoutine: $exerciseRoutine)

                        }.onDelete(perform: { idx in

                            workoutRoutine.exerciseRoutines.remove(atOffsets: idx)

                        })

                    }
                    .listStyle(PlainListStyle())

                }

            }

        }

    }
}

struct EditWorkout_Previews: PreviewProvider {
    static var previews: some View {
        EditWorkout(
            workoutViewModel: WorkoutViewModel(service: WorkoutLoggerAPIService()),
            showSheet: .constant(true),
            workoutRoutine: WorkoutRoutine(id: "0", name: "Legs", exerciseRoutines: [])
        ).preferredColorScheme(.dark)
    }
}
