//
//  HomeTabView.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-20.
//

import SwiftUI

struct HomeTabView: View {
    var body: some View {
        TabView {
            Group {
                
            WorkoutSessionListView()
                .tabItem {
                    Label("Workouts", systemImage: "tray.and.arrow.down.fill")
                }
            WorkoutListView()
                .tabItem {
                    Label("Routines", systemImage: "tray.and.arrow.up.fill")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "tray.and.arrow.up.fill")
                }
            }
            .toolbar(.visible, for: .tabBar)
            .toolbarBackground(Color.yellow, for: .tabBar)
        }
        }
    }


struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
