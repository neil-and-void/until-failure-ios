//
//  ContentView.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-20.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var authState: AuthenticationState
 
    var body: some View {
        Group {
            if authState.isAuthenticated {
                HomeTabView()
            } else {
                LoginView()
            }
        }.preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(AuthenticationState()).preferredColorScheme(.dark)
    }
}
