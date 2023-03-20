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
    @State
    var showAlert = false
    
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
                .accessibilityIdentifier("signup.emailTextField")
                .keyboardType(.emailAddress)
                .textInputAutocapitalization(.never)

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

            Button(action: { signupViewModel.submit(success: { showAlert = true }) }) {
                if signupViewModel.isLoading {
                    ProgressView()
                } else {
                    Text("Create account").bold()
                }
            }
            .buttonStyle(RoundedButton())
            .alert("Check your email for a verification link to start using Until Failure!", isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            }.tint(Color.primaryColor)

            Text("Didn't get a code?")
            NavigationLink(destination: ResendVerificationCode()) {
                Text("Resend email verification").fontWeight(.semibold).foregroundColor(.white)
            }
            Spacer()
        }
        .padding()
    }
}

struct Signup_Previews: PreviewProvider {
    static var previews: some View {
        SignupView().preferredColorScheme(.dark)
    }
}
