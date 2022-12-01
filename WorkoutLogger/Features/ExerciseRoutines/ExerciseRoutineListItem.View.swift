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

            Text(name).font(.system(size: 20, weight: .semibold))

            Spacer()
            
            HStack {

                Group {
                    
                    Text("\(sets)").font(.system(size: 20, weight: .semibold))

                    Text("sets").foregroundColor(.secondaryText).font(.system(size: 18))
                }.multilineTextAlignment(.leading)
                
                Group {
                    
                    Text("\(reps)").font(.system(size: 20, weight: .semibold))

                    Text("reps").foregroundColor(.secondaryText).font(.system(size: 18))

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
