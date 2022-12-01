//
//  WorkoutSessionListView.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-20.
//

import SwiftUI

struct WorkoutSessionListView: View {
    var body: some View {
        NavigationStack {
            VStack {
                
                List {
                    Text("A List Item")
                    Text("A Second List Item")
                    Text("A Third List Item")
                }
                
            }
            
            .padding(.horizontal)
            .toolbar {
                 
                 ToolbarItem(placement: .navigationBarLeading) {

                     Text("Workouts")
                         .font(.title)
                         .fontWeight(.bold)

                }

                ToolbarItem(placement: .navigationBarTrailing) {

                    Button(action: {}) {
                        
                        Image(systemName: "plus")

                    }.buttonStyle(TextButton())

                 }

            }
            
        }
        
    }
}

struct WorkoutSessionListView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutSessionListView().preferredColorScheme(.dark)
    }
}
