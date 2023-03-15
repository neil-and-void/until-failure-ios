//
//  AddSetEntry.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2023-01-24.
//

import SwiftUI

struct AddSetEntry: View {
    @StateObject private var setEntryViewModel = SetEntryViewModel(service: WorkoutLoggerAPIService())

    let exerciseId: String
    let onAdd: (SetEntry) -> Void

    var body: some View {
        Button(action: {
            setEntryViewModel.addSetEntry(
                exerciseId: exerciseId,
                setEntry: SetEntry(weight: 0, reps: 0),
                onSuccess: onAdd
            )
        }, label: {
            HStack{
                Text("Add Set").font(.system(size: 16, weight: .medium))
                if setEntryViewModel.isLoading {
                    ProgressView().padding(.leading, 8)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 8)
            .background(.thinMaterial)
            .cornerRadius(8)
        })
    }
}

struct AddSetEntry_Previews: PreviewProvider {
    static var previews: some View {
        AddSetEntry(exerciseId: "1", onAdd: {_ in})
    }
}
