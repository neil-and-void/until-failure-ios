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
            
            VStack(alignment: .leading) {
                
                Text(workoutSession.workoutRoutine.name).font(.system(size: 20, weight: .bold))
                
                Text("July 12").font(.system(size: 16)).foregroundColor(.secondaryText)
                
            }
            
            Spacer()
            
            if workoutSession.end != nil {

                Image(systemName: "dumbbell.fill").rotationEffect(.degrees(45)).foregroundColor(.primaryColor)
                
            } else {
                
                Text("30 mins").foregroundColor(.secondaryText)
                
            }
            
        }
        .padding()
        .background(Color.bgSecondary)
        .cornerRadius(10)
        
    }
}

//struct WorkoutSessionListItem_Previews: PreviewProvider {
//    static var previews: some View {
//        WorkoutSessionListItem(
//            active: true,
//            workoutSession: WorkoutSession(id: "1", start: Date(), workoutRoutineId: "1", exercises: [])
//        )
//    }
//}
