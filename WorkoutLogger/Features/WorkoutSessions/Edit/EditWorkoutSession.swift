//
//  EditWorkoutSession.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-12-08.
//

import SwiftUI

class SaveState: ObservableObject {
    @State
    var saving = false

    init() {}

    func addSource() {}
}

struct EditWorkoutSession: View {
    @Environment(\.presentationMode) var presentationMode

    @StateObject
    var saveState = SaveState()

    var workoutSessionId: String
    let workoutName: String
    var end: Date?

    @State private var showSheet = false
    @State private var showFinishWorkoutAlert = false
    @StateObject private var workoutSessionViewModel = WorkoutSessionViewModel(service: WorkoutLoggerAPIService())

    func getPrevExercise(exerciseRoutineId: String) -> PrevExercise? {
        if let prevExercise = workoutSessionViewModel.workoutSession?.prevExercises.first(where: { $0.exerciseRoutineId == exerciseRoutineId}) {
            return prevExercise
        }
        return nil
    }
    
    var body: some View {
        
        HStack {
            
            if workoutSessionViewModel.isLoading {
                
                ProgressView()
                
            } else {
                if let workoutSession = Binding<WorkoutSession>($workoutSessionViewModel.workoutSession) {
                    ScrollViewReader { scrollView in
                        List {
                            ForEach(workoutSession.exercises) { exercise in
                                EditExercise(
                                    exercise: exercise,
                                    prevExercise: getPrevExercise(exerciseRoutineId: exercise.exerciseRoutine.id),
                                    onDelete: {
                                        workoutSessionViewModel.getWorkoutSession(workoutSessionId: workoutSessionId, withNetwork: true)
                                    }
                                )
                                .id(exercise.id)
                                .listRowInsets(EdgeInsets())
                                .padding(.bottom, 8)
                                .listRowSeparator(.hidden)
                                .onChange(of: workoutSession.exercises.count, perform: {_ in
                                    withAnimation {
                                        scrollView.scrollTo(workoutSession.exercises[workoutSession.exercises.count - 1].id, anchor: .top)
                                    }
                                })
                            }
                            HStack {
                                Spacer()
                                Button("Add Exercise") { showSheet = true }
                                    .buttonStyle(RoundedButton())
                                    .sheet(isPresented: $showSheet) {
                                        SelectExerciseRoutine(
                                            workoutSessionId: workoutSession.id,
                                            workoutRoutineId: workoutSession.workoutRoutine.id,
                                            onSelectExerciseRoutine: { exercise in
                                                workoutSession.exercises.wrappedValue.append(exercise)
                                            },
                                            showSheet: $showSheet
                                        ).presentationDetents([.medium])
                                    }
                                Spacer()
                            }.listRowSeparator(.hidden)
                        }
                        .listStyle(.plain)
                        .refreshable {
                            workoutSessionViewModel.getWorkoutSession(workoutSessionId: workoutSessionId, withNetwork: true)
                        }
                        .onTapGesture {
                            self.hideKeyboard()
                        }
                        .alert(isPresented: $showFinishWorkoutAlert) {
                            Alert(
                                title: Text("Are you sure you want to finish this workout?"),
                                primaryButton: .default(Text("Confirm"), action: {
                                    workoutSessionViewModel.finishWorkoutSession(id: workoutSessionId)
                                    self.presentationMode.wrappedValue.dismiss()
                                    showFinishWorkoutAlert = false
                                }),
                                secondaryButton: .cancel()
                            )
                        }
                    }

                } else {
                    
                    Text("Nothing here")
                    
                }
                
            }

        }.onAppear {
            workoutSessionViewModel.getWorkoutSession(workoutSessionId: workoutSessionId)
        }
        .navigationTitle(workoutName)
        .navigationBarItems(trailing: end == nil ?  Button("Finish", action: {
            showFinishWorkoutAlert = true
        })
            .foregroundColor(.primaryColor) : nil)
        .environmentObject(saveState)
        
    }
}

struct EditWorkoutSession_Previews: PreviewProvider {
    static var previews: some View {
        EditWorkoutSession(workoutSessionId: "1", workoutName: "legs")
    }
}
