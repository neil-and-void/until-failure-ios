//
//  ResendCode.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2023-03-16.
//

import SwiftUI

struct ResendVerificationCode: View {
    private var service = AuthService()

    @State
    var email = ""
    @State
    var isLoading = false
    @State
    var error: WorkoutLoggerError?

    @State
    private var sent = false

    func sendCode() {
        isLoading = true
        service.resendEmailVerification(email: email, completion: { result in
            switch result {
            case .success:
                error = nil
                sent = true
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
                Text("Resend Verification")
                    .font(.title)
                Spacer()
            }
            HStack {
                Text("Enter in the email of the account you've already created").foregroundColor(.secondaryText)
                Spacer()
            }
            TextField("Email", text: $email)
                .keyboardType(.emailAddress)
                .textFieldStyle(TappableTextFieldStyle())
            Button(action: {
                if(!sent && !isLoading) {
                    sendCode()
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
