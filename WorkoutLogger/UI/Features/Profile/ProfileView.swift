//
//  UserView.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-20.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            
            HStack {
                
                Text("Name:")
                
                Spacer()
                
                Text("Name")
                
            }
            
            HStack {
                
                Text("Email:")
                
                Spacer()
                
                Text("Email")
                
            }
            
            Button(action: {} ) {
                
                Text("Logout")
                
            }.buttonStyle(RoundedButton())
            
            Spacer()

        }.padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView().preferredColorScheme(.dark)
    }
}
