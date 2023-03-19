//
//  ResetPassword.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2023-03-17.
//

import SwiftUI

struct ResetPassword: View {
    @Binding
    var forgotPasswordCode: String?
    @Binding
    var showSheet: Bool

    @State
    var password = ""
    @State
    var confirmPassword = ""
    @State
    var isLoading = false
    @State
    var error: WorkoutLoggerError?
    @State
    private var sent = false

    var service = AuthService()

    func resetPassword() {
        isLoading = true
        guard let forgotPasswordCode = forgotPasswordCode else {
            error = WorkoutLoggerError.unknown
            return
        }
        service.resetPassword(newPassword: password, confirmPassword: confirmPassword, code: forgotPasswordCode) { result in
            switch result {
            case .success:
                error = nil
                sent = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    showSheet = false
                }
            case .failure(let err):
                error = err
                sent = false
            }
            isLoading = false
        }
    }

    var body: some View {
        VStack {
            if forgotPasswordCode != nil {
                HStack {
                    Text("Reset Password").font(.title)
                    Spacer()
                }
                TextField("New password", text: $password)
                    .textFieldStyle(TappableTextFieldStyle())
                TextField("Confirm new password", text: $confirmPassword)
                    .textFieldStyle(TappableTextFieldStyle())
                Button(action: {
                    if(!sent && !isLoading) {
                        resetPassword()
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
            } else {
                Text("Hmmm... something went wrong...")
            }
        }.padding()
    }
}
