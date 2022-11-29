//
//  UserView.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-20.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(spacing: 20) {
            
            HStack {
                Text("Profile")
                    .font(.title)
                    .fontWeight(.bold)

                Spacer()
            }
            
            HStack {
                
                Text("Name:")
                
                Spacer()
                
                Text("Name").foregroundColor(.secondaryText)
                
            }
            
            HStack {
                
                Text("Email:")
                
                Spacer()
                
                Text("Email").foregroundColor(.secondaryText)
                
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
