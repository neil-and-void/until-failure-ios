//
//  ExerciseRoutineListItem.View.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-30.
//

import SwiftUI

struct ExerciseRoutineListItem: View {
    var name: String
    var sets: Int
    var reps: Int

    var body: some View {
        HStack {

            Text(name).font(.system(size: 18, weight: .medium))

            Spacer()
            
            HStack {

                Group {
                    
                    Text("\(sets)").font(.system(size: 18, weight: .medium))

                    Text("sets").foregroundColor(.secondaryText)

                }.multilineTextAlignment(.leading)
                
                Group {
                    
                    Text("\(reps)").font(.system(size: 18, weight: .medium))

                    Text("reps").foregroundColor(.secondaryText)

                }.multilineTextAlignment(.leading)
                
            }
            
        }
        .padding()
        .background(Color.bgSecondary)
        .cornerRadius(10)

    }
}

struct ExerciseRoutineListItem_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseRoutineListItem(name: "Legs", sets: 4, reps: 4).preferredColorScheme(.dark)
    }
}
