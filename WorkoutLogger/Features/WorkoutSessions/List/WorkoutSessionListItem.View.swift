//
//  WorkoutSessionListItem.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-12-02.
//

import SwiftUI

struct WorkoutSessionListItem: View {
    var active: Bool
    var workoutSession: WorkoutSessionFull
    
    func formattedDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d"
        formatter.timeZone = .current
        return formatter.string(from: date)
    }
    
    func formattedDuration(start: Date, end: Date) -> String {
        let duration = end.timeIntervalSinceReferenceDate - start.timeIntervalSinceReferenceDate
        return "\(Int(duration) / 60) mins"
    }
    
    var body: some View {
        
        HStack {
            
            VStack(alignment: .leading) {
                
                Text(workoutSession.workoutRoutine.name).font(.system(size: 20, weight: .bold))
                
                Text("TIME Start")
                    .font(.system(size: 16))
                    .foregroundColor(.secondaryText)
                
            }
            
            Spacer()
            
            if (workoutSession.end != nil) {
                
//                Text(formattedDuration(start: workoutSession.start, end: end))
                Text("TIME END")
                    .foregroundColor(.secondaryText)

            } else {
                
                Image(systemName: "dumbbell.fill")
                    .rotationEffect(.degrees(45))
                    .foregroundColor(.primaryColor)
                
            }
            
        }
        .padding()
        .background(Color.bgSecondary)
        .cornerRadius(10)

    }
}

struct WorkoutSessionListItem_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutSessionListItem(
            active: true,
            workoutSession: WorkoutSessionFull(
                id: "1",
                start: "TIME START",
                workoutRoutine: WorkoutSessionFull.WorkoutRoutine(id: "Bruh", name: "what"),
                exercises: [],
                prevExercises: []
            )
        )
    }
}
