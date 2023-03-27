//
//  WorkoutLoggerApp.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-17.
//

import SwiftUI

@main
struct WorkoutLoggerApp: App {
    @StateObject
    var authState = AuthenticationState()
    @State
    private var showSheet = false
    @State
    private var forgotPasswordCode: String? = nil

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authState)
                .preferredColorScheme(.dark)
                .onOpenURL(perform: { url in
                    guard let code = url.getQueryParam("code") else { return }
                    showSheet = true
                    forgotPasswordCode = code
                })
                .sheet(isPresented: $showSheet) {
                    ZStack {
                        VStack {
                            HStack {
                                Button("Close", action: { showSheet = false })
                                    .padding()
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            Spacer()
                        }
                        ResetPassword(forgotPasswordCode: $forgotPasswordCode, showSheet: $showSheet)
                    }.interactiveDismissDisabled()
                }
                .onAppear(perform: {
                    let keychain = KeychainService()
                    if let _ = keychain.read(
                        service: WORKOUT_LOGGER_KEYCHAIN_SERVICE,
                        account: WORKOUT_LOGGER_KEYCHAIN_ACCOUNT,
                        type: AuthTokens.self
                    ) {
                        authState.isAuthenticated = true
                    }
                })
        }
    }
}
