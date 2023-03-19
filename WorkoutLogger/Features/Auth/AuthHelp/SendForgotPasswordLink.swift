//
//  ForgotPassword.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2023-03-16.
//

import SwiftUI

struct SendForgotPasswordLink: View {
    var service = AuthService()

    @Binding
    var showSheet: Bool

    @State
    var email = ""
    @State
    var isLoading = false
    @State
    var error: WorkoutLoggerError?

    @State
    var sent = false

    func sendForgotPasswordLink() {
        isLoading = true
        service.sendForgotPasswordLink(email: email, completion: { result in
            switch result {
            case .success:
                error = nil
                sent = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    showSheet = false
                }
            case .failure(let err):
                error = err
                sent = false
            }
            isLoading = false
        })
    }

    var body: some View {
        VStack {
            HStack{
                Text("Reset Password")
                    .font(.title)
                Spacer()
            }
            HStack {
                Text("Enter in the email of account you forgot your password for").foregroundColor(.secondaryText)
                Spacer()
            }
            TextField("Email", text: $email)
                .keyboardType(.emailAddress)
                .textFieldStyle(TappableTextFieldStyle())
            Button(action: {
                if(!sent && !isLoading) {
                    sendForgotPasswordLink()
                }
            }, label: {
                HStack {
                    Text(sent ? "Sent" : "Send")
                    if isLoading {
                        ProgressView()
                    }
                    if sent {
                        Image(systemName: "checkmark.circle")
                            .foregroundColor(.green)
                    }
                }
            })
            .buttonStyle(RoundedButton())
        }
        .onTapGesture {
            self.hideKeyboard()
        }
        .errorAlert($error, confirm: {})
        .padding()
    }
}
