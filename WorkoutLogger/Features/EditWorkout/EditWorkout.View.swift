//
//  EditWorkout.View.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-30.
//

import SwiftUI

struct EditWorkout: View {
    @StateObject var editWorkoutViewModel = EditWorkoutViewModel(service: WorkoutLoggerAPIService())
    @Binding var showSheet: Bool
    
    @State var showAlert: Bool = false

    var body: some View {
        ZStack {

            VStack {
                
                HStack {
                    
                    Button("Cancel") {
                        
                        showSheet = false
                        
                    }.buttonStyle(TextButton())
                    
                    Spacer()
                    
                    Button("Done") {

                        // TODO update 

                    }.buttonStyle(TextButton())

                }
                .padding(.top)
                .padding(.horizontal)
                
//                VStack {
//                    
//                    HStack {
//                        
//                        EditableWorkoutName(name: $workoutRoutine.name)
//                        
//                    }
//                    
//                    List {
//                        
//                        Button(action: { showAlert.toggle() }) {
//                            
//                            Text("Add exercise")
//                            
//                        }
//                        .buttonStyle(TextButton())
//                        .alert("Add exercise", isPresented: $showAlert) {
//                            AddExerciseRoutineAlert(
//                                name: $newExerciseRoutineName,
//                                onAdd: {
//                                    workoutRoutine.exerciseRoutines.append(ExerciseRoutine(
//                                        id: "",
//                                        name: newExerciseRoutineName,
//                                        sets: 0,
//                                        reps: 0
//                                    ))
//                                }
//                            ).preferredColorScheme(.dark)
//                        }
//                        
//                        ForEach($workoutRoutine.exerciseRoutines) { $exerciseRoutine in
//                            
//                            EditableExerciseRoutineListItem(editableExerciseRoutine: $exerciseRoutine)
//                            
//                        }.onDelete(perform: { idx in
//                            
//                            workoutRoutine.exerciseRoutines.remove(atOffsets: idx)
// 
//                        })
//                        
//                    }
//                    .listStyle(PlainListStyle())
//                    
//                }
//                
            }

        }

    }
}

struct EditWorkout_Previews: PreviewProvider {
    static var previews: some View {
        EditWorkout(showSheet: .constant(true)).preferredColorScheme(.dark)
    }
}
