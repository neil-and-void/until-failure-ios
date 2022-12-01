//
//  WorkoutDetailsView.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-29.
//

import SwiftUI

struct WorkoutDetailsView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    var workout: WorkoutRoutinesFull

    var body: some View {
 
        Group {
            
            Text(workout.name)
                .font(.title)
                .fontWeight(.bold)

                ExerciseRoutineList(exerciseRoutines: workout.exerciseRoutines?.compactMap { routine in
                    return WorkoutRoutinesFull.ExerciseRoutine(
                        id: routine?.id ?? "",
                        name: routine?.name ?? "",
                        sets: routine?.sets ?? 0,
                        reps: routine?.reps ?? 0
                    )
                } ?? [])
   
        }
        .navigationBarItems(
            trailing: Button(action: {}, label: {Text("Edit")}).buttonStyle(TextButton())
        )

    }

}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutDetailsView(workout: WorkoutRoutinesFull(id: "0", name: "Leg Day"))
    }
}
