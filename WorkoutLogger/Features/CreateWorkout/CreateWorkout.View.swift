//
//  CreateWorkoutView.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-20.
//

import SwiftUI

struct CreateWorkoutView: View {
    @EnvironmentObject private var authState: AuthenticationState
    @StateObject private var createWorkoutViewModel = CreateWorkoutViewModel(service: WorkoutLoggerAPIService())
    @State private var showSheet = false
    
    var body: some View {

            Button(action: { showSheet.toggle() }) {
                
                Text("Create Workout +")

            }
            .buttonStyle(TextButton())
            .sheet(isPresented: $showSheet) {
                
                ZStack {
                    
                    HStack {
                        Spacer()
                        
                        VStack(alignment: .leading) {
                            
                            Button(action: { showSheet.toggle()}) {
                                Text("Cancel")
                            }
                            .buttonStyle(TextButton())
                            .padding()
                            
                            Spacer()
                            
                        }
                        
                    }
                    
                    VStack {
                        
                        Text("Give your workout routine a name")
                            .padding()
                        
                        if let error = createWorkoutViewModel.error {
                            Text(error)
                                .foregroundColor(.red)
                                .multilineTextAlignment(.center)
                        }
                        
                        TextField("", text: $createWorkoutViewModel.workoutName)
                            .overlay(VStack{Divider().offset(x: 0, y: 15)})
                            .multilineTextAlignment(.center)
                            .padding()
                    
                        Button(action: { createWorkoutViewModel.createWorkoutRoutine { wasSuccessful in
                            showSheet = !wasSuccessful
                        }}) {
                            
                            Text("Create")

                        }
                        .buttonStyle(RoundedButton())
                        .padding()
                    }
                    
                }.preferredColorScheme(.dark)
                
            }
            
    }
}

struct CreateWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        CreateWorkoutView().preferredColorScheme(.dark)
    }
}
