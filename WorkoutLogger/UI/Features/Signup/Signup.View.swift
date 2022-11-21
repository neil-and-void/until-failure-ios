//
//  Signup.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-17.
//

import SwiftUI

struct Signup: View {
    @StateObject private var signupViewModel = SignupViewModel(service: AuthService())
    @EnvironmentObject private var authState: AuthenticationState
    
    var body: some View {
        VStack {
            Text("Signup")
                .font(.system(size: 36))
            
            if signupViewModel.error.count > 0 {
                Text(signupViewModel.error)
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
            }
            
            TextField("Name", text: $signupViewModel.name)
                .padding()
                .background(.thinMaterial)
                .cornerRadius(10)
                .textInputAutocapitalization(.never)
            
            TextField("Email", text: $signupViewModel.email)
                .padding()
                .background(.thinMaterial)
                .cornerRadius(10)
                .textInputAutocapitalization(.never)
            
            SecureField("Password", text: $signupViewModel.password)
                .padding()
                .background(.thinMaterial)
                .cornerRadius(10)
            
            SecureField("Confirm Password", text: $signupViewModel.confirmPassword)
                .padding()
                .background(.thinMaterial)
                .cornerRadius(10)
                .padding(.bottom, 30)
            
            Button(action: { signupViewModel.submit() { result in
                authState.isAuthenticated = result
            }}) {
                if signupViewModel.isLoading {
                    ProgressView()
                } else {
                    Text("Create account").bold()
                }
            }
            .padding()
            .background(.thinMaterial)
            .cornerRadius(10)
            .padding(.bottom, 15)
        }
    }
}

struct Signup_Previews: PreviewProvider {
    static var previews: some View {
        Signup()
    }
}
