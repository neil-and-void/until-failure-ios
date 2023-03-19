//
//  ErrorAlert.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2023-03-13.
//

import SwiftUI

extension View {
    func errorAlert(_ err: Binding<WorkoutLoggerError?>, confirm onConfirm: @escaping () -> Void) -> some View {
        modifier(ErrorAlert(errorBinding: err, onConfirm: onConfirm))
    }
}

struct ErrorAlert: ViewModifier {
    @EnvironmentObject private var authState: AuthenticationState

    @Binding
    var errorBinding: WorkoutLoggerError?
    let onConfirm: () -> Void

    private var isAlertPresented: Binding<Bool> {
        Binding<Bool>(get: {
            errorBinding != nil
        }, set: { newValue in
            if !newValue {
                errorBinding = nil
            }
        })
    }

    func body(content: Content) -> some View {
        content.alert(isPresented: isAlertPresented, error: errorBinding, actions: {

            if let err = errorBinding {

                switch err {
                case .unauthenticated, .refreshTokenInvalid:
                    Button("Ok", action: {
                        authState.isAuthenticated = false
                    })
                case .GraphQLError, .parsingError, .networkError, .notYetReceived, .unknown:
                    Button("Ok", action: onConfirm)
                }
            }
        })
    }
}
