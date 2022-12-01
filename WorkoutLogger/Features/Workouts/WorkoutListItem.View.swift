//
//  WorkoutListItem.View.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-29.
//

import SwiftUI

struct WorkoutListItemView: View {
    var name: String
    var exerciseCount: Int
    
    var body: some View {
        HStack {
            
            Group {
                
                VStack(alignment: .leading) {

                Text(name).fontWeight(.semibold).font(.system(size: 25))

                Text("\(exerciseCount) \(exerciseCount > 1 ? "exercises" : "exercise")")
                    .foregroundColor(.secondaryText)

            }
   
            Spacer()
            
            Image(systemName: "chevron.right")

            }.padding()
            
        }
        .background(Color.bgSecondary)
        .padding(.bottom, 2)
        .cornerRadius(15)

    }
    
}

struct WorkoutListItem_View_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutListItemView(name: "Legs", exerciseCount: 5).preferredColorScheme(.dark)
    }
}
