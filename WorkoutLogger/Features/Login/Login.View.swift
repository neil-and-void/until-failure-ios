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
    @EnvironmentObject private var authState: AuthenticationState
    
    var body: some View {
        
        VStack() {
            Text("Login")
                .font(.system(size: 36))
            
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
                .padding(.bottom, 15)

            Button(action: { loginViewModel.submit(setAuth: authState.setAuth) } ) {
                if loginViewModel.isLoading {
                    ProgressView()
                } else {
                    Text("Login").bold()
                }
            }.buttonStyle(RoundedButton())
            
            Button(action: { showSheet.toggle() }) {
                Text("Create an account")
            }
            .buttonStyle(TextButton())
            .sheet(isPresented: $showSheet) {
                ZStack {
                    HStack {
                        VStack(alignment: .leading) {
                            
                            Button(action: { showSheet.toggle()}) {
                                Text("Cancel")
                            }
                            .buttonStyle(TextButton())
                            .padding()
 
                            Spacer()
                        }
                        
                        Spacer()
                    }
                    
                    SignupView()

                }.preferredColorScheme(.dark)

            }
        }.padding()
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(AuthenticationState()).preferredColorScheme(.dark)
    }
}
