//
//  WorkoutLoggerApp.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-17.
//

import SwiftUI

@main
struct WorkoutLoggerApp: App {
    @State
    private var showSheet = false
    @State
    private var forgotPasswordCode: String? = nil

    var body: some Scene {
        WindowGroup {
            ContentView()
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
        }
    }
}
