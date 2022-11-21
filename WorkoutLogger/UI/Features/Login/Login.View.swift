//
//  Login.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-18.
//

import SwiftUI

struct Login: View {
    @StateObject private var loginViewModel = LoginViewModel(service: AuthService())
    @State private var showSheet = false
    @EnvironmentObject private var authState: AuthenticationState
    
    var body: some View {
        
        VStack() {
            Text("Login")
                .font(.system(size: 36))
            
            if loginViewModel.error.count > 0 {
                Text(loginViewModel.error)
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
            }
            
            TextField("Email", text: $loginViewModel.email)
                .padding()
                .background(.thinMaterial)
                .cornerRadius(10)
                .textInputAutocapitalization(.never)
            
            SecureField("Password", text: $loginViewModel.password)
                .padding()
                .background(.thinMaterial)
                .cornerRadius(10)
                .padding(.bottom, 15)
            
            Button(action: { loginViewModel.submit() { result in
                authState.isAuthenticated = result
            } }) {
                if loginViewModel.isLoading {
                    ProgressView()
                } else {
                    Text("Login").bold()
                }
            }
            .padding()
            .background(.thinMaterial)
            .cornerRadius(10)
            .padding(.bottom, 15)
            
            Button("Create an account") {
                showSheet.toggle()
            }
            .sheet(isPresented: $showSheet) {
                ZStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Button(action: { showSheet.toggle()}) {
                                Text("Cancel").padding()
                            }
                            Spacer()
                        }
                        Spacer()
                    }
                    Signup()
                }
            }
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login().environmentObject(AuthenticationState())
    }
}
