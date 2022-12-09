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
                
                Text(formattedDate(date: workoutSession.start))
                    .font(.system(size: 16))
                    .foregroundColor(.secondaryText)
                
            }
            
            Spacer()
            
            if let end = workoutSession.end {
                
                Text(formattedDuration(start: workoutSession.start, end: end))
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

//struct WorkoutSessionListItem_Previews: PreviewProvider {
//    static var previews: some View {
//        WorkoutSessionListItem(
//            active: true,
//            workoutSession: WorkoutSession(id: "1", start: Date(), workoutRoutineId: "1", exercises: [])
//        )
//    }
//}
