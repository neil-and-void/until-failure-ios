//
//  Signup.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-17.
//

import SwiftUI

struct SignupView: View {
    @StateObject private var signupViewModel = SignupViewModel(service: AuthService())
    @EnvironmentObject private var authState: AuthenticationState
    
    var body: some View {
        VStack {
            Text("Signup")
                .font(.system(size: 36))
            
            if let error = signupViewModel.error {
                Text(error)
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
            }
            
            UsernameField(placeholder: "Name", text: $signupViewModel.name)
                .padding()
                .background(.thinMaterial)
                .cornerRadius(10)
                .textInputAutocapitalization(.never)
 
            EmailField(placeholder: "Email", text: $signupViewModel.email)
                .padding()
                .background(.thinMaterial)
                .cornerRadius(10)
                .textInputAutocapitalization(.never)
                .accessibilityIdentifier("signup.emailTextField")
                .keyboardType(.emailAddress)
            
            PasswordField(placeholder: "Password", text: $signupViewModel.password)
                .padding()
                .background(.thinMaterial)
                .cornerRadius(10)
                .accessibilityIdentifier("signup.passwordSecureField")
            
            PasswordField(placeholder: "Confirm Password", text: $signupViewModel.confirmPassword)
                .padding()
                .background(.thinMaterial)
                .cornerRadius(10)
                .padding(.bottom, 15)
            
            Button(action: { signupViewModel.submit(setAuth: authState.setAuth) }) {
                if signupViewModel.isLoading {
                    ProgressView()
                } else {
                    Text("Create account").bold()
                }
            }
            .buttonStyle(RoundedButton())

        }.padding()
    }
}

struct Signup_Previews: PreviewProvider {
    static var previews: some View {
        SignupView().preferredColorScheme(.dark)
    }
}
