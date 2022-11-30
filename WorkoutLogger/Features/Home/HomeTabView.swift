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
                    Label("Workouts", systemImage: "figure.strengthtraining.traditional")
                }

            WorkoutListView()
                .tabItem {
                    Label("Routines", systemImage: "dumbbell.fill")
                }

            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle.fill")
                }

            }

        }.accentColor(.white)
    }
}


struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
