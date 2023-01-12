//
//  EditWorkoutName.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-12-01.
//

import SwiftUI

struct EditWorkoutName: View {
    @Binding var name: String
    
    var body: some View {

        VStack {

            TextField("Name", text: $name)
                .multilineTextAlignment(.center)
                .font(.system(size: 30, weight: .semibold))

            Divider()
                .frame(height: 1)
                .background(.gray)

        }.padding(.horizontal)

    }
}

struct EditableWorkoutName_Previews: PreviewProvider { 
    static var previews: some View {
        EditWorkoutName(name: .constant("Legs"))
            .preferredColorScheme(.dark)
    }
}
