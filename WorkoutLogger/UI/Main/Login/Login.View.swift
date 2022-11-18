//
//  Login.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-18.
//

import SwiftUI

struct Login: View {
    @StateObject private var loginViewModel = LoginViewModel(service: AuthService())
    
    var body: some View {
        VStack {
            Text("Login")
            
            TextField("Email", text: $loginViewModel.email)
                .autocapitalization(.none)

            SecureField("Password", text: $loginViewModel.password)
            
            Button(action: { loginViewModel.submit() }) {
                Text("Login")
            }
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
