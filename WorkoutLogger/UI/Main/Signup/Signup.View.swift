//
//  Signup.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-17.
//

import SwiftUI

struct Signup: View {
    @StateObject private var signupViewModel = SignupViewModel(service: AuthService())
    // move to the view model
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    var body: some View {
        VStack {
            Text("Signup")
            
            TextField("Name", text: $name)
                .autocapitalization(.none)
            
            TextField("Email", text: $email)
                .autocapitalization(.none)
            
            SecureField("Password", text: $password)
            
            SecureField("Confirm Password", text: $confirmPassword)
            
            Button(action: {
                signupViewModel.signup(email: email, name: name, password: password, confirmPassword: confirmPassword)
            }) {
                Text("Sign Up")
            }
        }
    }
}

struct Signup_Previews: PreviewProvider {
    static var previews: some View {
        Signup()
    }
}
