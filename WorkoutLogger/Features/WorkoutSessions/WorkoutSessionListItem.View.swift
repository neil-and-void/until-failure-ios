//
//  WorkoutSessionListItem.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-12-02.
//

import SwiftUI

struct WorkoutSessionListItem: View {
    var active: Bool
    var workoutSession: WorkoutSession
    
    var body: some View {
        
        HStack {
            
            VStack {
                
                Text("Wtf")
                
                Text("July 12")
                
            }
            
            Spacer()
            
            if active {
                
                Text("ACTIVE")
                
            } else {
                
                Text("30 mins")
                
            }
            
        }
        .padding()
        
    }
}

struct WorkoutSessionListItem_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutSessionListItem(
            active: true,
            workoutSession: WorkoutSession(id: "1", start: Date(), workoutRoutineId: "1", exercises: [])
        )
    }
}
