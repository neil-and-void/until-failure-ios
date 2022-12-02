//
//  EditableWorkoutName.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-12-01.
//

import SwiftUI

struct EditableWorkoutName: View {
    @Binding var name: String
    
    var body: some View {

        VStack {

            TextField("Name", text: $name)
                .multilineTextAlignment(.center)
                .font(.system(size: 30))

            Divider()
                .frame(height: 1)
                .background(.gray)

        }.padding(.horizontal)

    }
}

struct EditableWorkoutName_Previews: PreviewProvider { 
    static var previews: some View {
        EditableWorkoutName(name: .constant("Legs"))
            .preferredColorScheme(.dark)
    }
}
