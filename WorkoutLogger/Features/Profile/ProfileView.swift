//
//  UserView.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-20.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject
    private var authState: AuthenticationState
    @StateObject
    private var userViewModel = UserViewModel(service: WorkoutLoggerAPIService())
    @State
    private var showDeleteAccountAlert = false
    
    var body: some View {

        NavigationStack {
            if (userViewModel.isLoading) {
                ProgressView()
            }
            else if let user = userViewModel.user {
                VStack(spacing: 20) {
                    VStack {
                        Group {
                            HStack {
                                Text("Name:")
                                Spacer()
                                Text(user.name).foregroundColor(.secondaryText)
                            }
                            HStack {
                                Text("Email:")
                                Spacer()
                                Text(user.email).foregroundColor(.secondaryText)
                            }
                        }.padding(.vertical, 16)
                    }
                    .padding(.vertical, 8)
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
                    ToolbarItem(placement: .navigationBarTrailing, content: {
                        Menu {
                            Button("delete account", role: .destructive) {
                                showDeleteAccountAlert = true
                            }
                        } label: {
                            Image(systemName: "gearshape")
                        }
                    })
                }
                .alert(isPresented: $showDeleteAccountAlert) {
                    Alert(
                        title: Text("Are you sure you want to delete your account?"),
                        primaryButton: .destructive(Text("Yes") , action: {
                            userViewModel.deleteUser(success: {
                                showDeleteAccountAlert = false
                                userViewModel.logout(setAuth: { loggedOut in
                                    authState.isAuthenticated = loggedOut
                                })
                            })
                        }),
                        secondaryButton: .cancel()
                    )
                }
            }
        }.onAppear(perform: {
            userViewModel.getUser()
        })

    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(AuthenticationState())
            .preferredColorScheme(.dark)
    }
}
