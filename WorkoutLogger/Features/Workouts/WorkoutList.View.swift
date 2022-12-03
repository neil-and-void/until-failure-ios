//
//  WorkoutListView.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-20.
//

import SwiftUI

struct WorkoutListView: View {
    @StateObject private var workoutListViewModel = WorkoutViewModel(service: WorkoutLoggerAPIService())
    
    // parses and sets a WorkoutRoutineFull to an EditableWorkoutRoutine
    func buildEditableWorkoutRoutine(_ workoutRoutineFull: WorkoutRoutinesFull) -> WorkoutRoutine {
        let exerciseRoutines = workoutRoutineFull.exerciseRoutines.compactMap { exerciseRoutine in
            return ExerciseRoutine(
                id: exerciseRoutine.id,
                name: exerciseRoutine.name,
                sets: exerciseRoutine.sets,
                reps: exerciseRoutine.reps
            )
        }

       return WorkoutRoutine(
            id: workoutRoutineFull.id,
            name: workoutRoutineFull.name,
            exerciseRoutines: exerciseRoutines
        )
    }
     
    var body: some View {
        NavigationStack {
            VStack {
                
                ScrollView{

                    if workoutListViewModel.workoutRoutineList.count > 0 {

                        ForEach(workoutListViewModel.workoutRoutineList, id: \.self.id) { workoutRoutine in
                            
                            NavigationLink(
                                destination: WorkoutDetailsView(
                                    workoutViewModel: workoutListViewModel,
                                    updateWorkoutRoutineDraft: buildEditableWorkoutRoutine(workoutRoutine),
                                    workoutRoutine: buildEditableWorkoutRoutine(workoutRoutine)
                                )
                            ) {
                                
                                WorkoutListItemView(name: workoutRoutine.name, exerciseCount: workoutRoutine.exerciseRoutines.count)
                                
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
                         .font(.largeTitle)
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
