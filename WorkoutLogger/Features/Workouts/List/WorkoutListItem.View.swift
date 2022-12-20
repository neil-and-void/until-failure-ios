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
                    
                    Text(name).fontWeight(.semibold).font(.system(size: 20))
                    
                    Text("\(exerciseCount) \(exerciseCount > 1 ? "exercises" : "exercise")")
                        .font(.system(size: 16))
                        .foregroundColor(.secondaryText)
                    
                }
                
            }
            
        }
 
    }
    
}

struct WorkoutListItem_View_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutListItemView(name: "Legs", exerciseCount: 5).preferredColorScheme(.dark)
    }
}
