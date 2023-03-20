//
//  Login.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-18.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var loginViewModel = LoginViewModel(service: AuthService())
    @State private var showSheet = false
    @State var forgotPasswordSheet = false
    @EnvironmentObject private var authState: AuthenticationState
    
    var body: some View {
        
        VStack() {

            Image("until-failure-icon")
                .resizable()
                .frame(width: 128.0, height: 128.0)

            Text("Until Failure")
                .font(.system(size: 32, weight: .semibold))
            
            if let error = loginViewModel.error {
                Text(error)
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
            }
            
            TextField("Email", text: $loginViewModel.email)
                .padding()
                .background(.thinMaterial)
                .cornerRadius(10)
                .textInputAutocapitalization(.never)
                .keyboardType(.emailAddress)
            
            SecureField("Password", text: $loginViewModel.password)
                .padding()
                .background(.thinMaterial)
                .cornerRadius(10)
            
            HStack {
                Button("Signup", action: {
                    showSheet = true
                })
                Spacer()
                Button("Forgot password?", action:{
                    forgotPasswordSheet = true
                })
            }
            .padding(.bottom, 15)
            .foregroundColor(.white)
            .fontWeight(.semibold)
            
            Button(action: { loginViewModel.submit(setAuth: authState.setAuth) } ) {
                if loginViewModel.isLoading {
                    ProgressView()
                } else {
                    Text("Login").bold()
                }
            }.buttonStyle(RoundedButton())

            Spacer()
            
        }
        .padding()
        .sheet(isPresented: $forgotPasswordSheet) {
            VStack {
                HStack {
                    Spacer()
                    Button(action: { forgotPasswordSheet = false }) {
                        Text("Cancel")
                    }
                    .padding()
                    .foregroundColor(.white)
                }
                SendForgotPasswordLink(showSheet: $forgotPasswordSheet)
                Spacer()
            }
            .onTapGesture {
                self.hideKeyboard()
            }
        }
        .sheet(isPresented: $showSheet) {
            NavigationView {
                SignupView()
                    .toolbar {
                        Button(action: { showSheet.toggle()}) {
                            Text("Cancel")
                        }.foregroundColor(.white)
                    }
            }.accentColor(.white)
        }.preferredColorScheme(.dark)
    }
}
