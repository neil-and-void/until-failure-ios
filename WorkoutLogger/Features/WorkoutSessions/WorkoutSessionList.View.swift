//
//  WorkoutSessionListView.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-20.
//

import SwiftUI

struct WorkoutSessionListView: View {
    var body: some View {
        VStack {
            
            HStack {
                Text("Workouts")
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer()
                
                Button(action: {}) {
                    
                    Image(systemName: "plus")

                }.buttonStyle(TextButton())

            }.padding(.horizontal)
            
            List {
                Text("A List Item")
                Text("A Second List Item")
                Text("A Third List Item")
            }
        }
    }
}

struct WorkoutSessionListView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutSessionListView().preferredColorScheme(.dark)
    }
}
