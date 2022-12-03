//
//  UserView.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-20.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject private var authState: AuthenticationState
    @StateObject private var userViewModel = UserViewModel()
    
    var body: some View {
        NavigationStack {
            
            VStack(spacing: 20) {
                
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
                
                Button(action: {
                    userViewModel.logout() { loggedOut in
                        authState.isAuthenticated = loggedOut
                    }}) {
                        
                        Text("Logout")
                        
                    }.buttonStyle(RoundedButton())
                
                Spacer()
                
            }
            .padding(.horizontal)
            .toolbar {
                
                ToolbarItem(placement: .navigationBarLeading) {
                    
                    Text("Profile")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                }
                
            }
            
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(AuthenticationState())
            .preferredColorScheme(.dark)
    }
}
