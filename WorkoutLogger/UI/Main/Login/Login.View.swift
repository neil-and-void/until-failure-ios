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
    
    var body: some View {
        
        VStack {
            Text("Login")
                .font(.system(size: 36))
            
            Text(loginViewModel.error)
                .foregroundColor(.red)
            
            TextField("Email", text: $loginViewModel.email)
                .padding()
                .background(.thinMaterial)
                .cornerRadius(10)
                .textInputAutocapitalization(.never)
            
            SecureField("Password", text: $loginViewModel.password)
                .padding()
                .background(.thinMaterial)
                .cornerRadius(10)
                .padding(.bottom, 30)
            
            Button(action: { loginViewModel.submit() }) {
                Text("Login")
                    .bold()
                    .frame(width: 360, height: 50)
                    .background(.thinMaterial)
                    .cornerRadius(10)
            }
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
        Login()
    }
}
