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
    private var showLogoutConfirmation = false
    @State
    private var showDeleteAccountAlert = false
    @State
    private var showDeleteAccountFinalAlert = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                VStack {
                    if (userViewModel.isLoading) {
                        ProgressView()
                    } else if let user = userViewModel.user {
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
                }
                .padding(.vertical, 8)


                Button(action: {
                    showLogoutConfirmation = true
                }, label: {
                    Text("Logout")}
                )
                .buttonStyle(RoundedButton())
                .confirmationDialog("Are you sure?", isPresented: $showLogoutConfirmation) {
                    Button("Logout", role: .destructive, action: {
                        userViewModel.logout() { loggedOut in
                            authState.isAuthenticated = loggedOut
                        }
                    })
                }
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
                    Menu(content: {
                        Button("delete account", role: .destructive) {
                            showDeleteAccountAlert = true
                        }
                    }, label: { Image(systemName: "gearshape") })
                    .alert(isPresented: $showDeleteAccountAlert) {
                        Alert(
                            title: Text("Are you sure you want to delete your account?"),
                            primaryButton: .destructive(Text("Yes") , action: {
                                showDeleteAccountFinalAlert = true
                                showDeleteAccountAlert = false
                            }),
                            secondaryButton: .cancel()
                        )
                    }
                })
            }
        }
        .alert(isPresented: $showDeleteAccountFinalAlert) {
            Alert(
                title: Text("Deleting your account is IRREVERSIBLE! Are you sure?"),
                primaryButton: .destructive(Text("Yes") , action: {
                    userViewModel.deleteUser(success: {
                        showDeleteAccountFinalAlert = false
                        userViewModel.logout(setAuth: { loggedOut in
                            authState.isAuthenticated = loggedOut
                        })
                    })
                }),
                secondaryButton: .cancel()
            )
        }
        .onAppear(perform: {
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
