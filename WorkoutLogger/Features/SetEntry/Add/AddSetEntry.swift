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
    let onSuccess: () -> Void

    var body: some View {
        Button("Add Set", action: {
            let setEntry = SetEntry(weight: 0, reps: 0)

            // local
            onAdd(setEntry)

            // server
            setEntryViewModel.addSetEntry(
                exerciseId: exerciseId,
                setEntry: setEntry,
                onSuccess: onSuccess
            )
        }).buttonStyle(TextButton())
    }
}

struct AddSetEntry_Previews: PreviewProvider {
    static var previews: some View {
        AddSetEntry(exerciseId: "1", onAdd: {_ in}, onSuccess: {})
    }
}
