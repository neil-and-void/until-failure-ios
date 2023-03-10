//
//  EditSetEntryList.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2023-01-24.
//

import SwiftUI

struct EditSetEntryList: View {
    @StateObject private var setEntryViewModel = SetEntryViewModel(service: WorkoutLoggerAPIService())
    @Binding var setEntries: [SetEntry]
    var prevSetEntries: [SetEntry]
    var onDelete: () -> Void

    @State private var showDeleteConfirmation = false
    @State private var setEntryIndexToDelete: Int?

    func confirmDeleteSetEntry(index: Int) {
        showDeleteConfirmation = true
        setEntryIndexToDelete = index
    }

    func getCorrespondingSetEntry(_ prevSetEntries: [SetEntry], _ index: Int) -> SetEntry? {
        if index < prevSetEntries.count {
            return prevSetEntries[index]
        }
        return nil
    }

    var body: some View {
        if setEntries.count == 0 {

            Text("No set entries yet")
                .foregroundColor(.tertiaryText)
                .padding(.vertical, 2)
                .padding(.horizontal, 2)

        } else {

            VStack {

                HStack {
                    Text("Set")
                        .fontWeight(.semibold)
                        .frame(width: 32)
                    Text("Prev")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                    Text("Weight")
                        .fontWeight(.semibold)
                        .frame(width: 64)
                    Text("Reps")
                        .fontWeight(.semibold)
                        .frame(width: 64)
                }

                ForEach(Array(zip(setEntries.indices, $setEntries)), id: \.0) { (index, setEntry) in
                    SwipeItem(
                        content: {
                            EditSetEntryListItem(
                                setNumber: index + 1,
                                prevSetEntry: getCorrespondingSetEntry(prevSetEntries, index),
                                repFieldObserver: IntFieldObserver(text: setEntry.reps.wrappedValue),
                                weightFieldObserver: DoubleFieldObserver(text: setEntry.weight.wrappedValue),
                                onChange: { reps, weight in
                                    setEntryViewModel.updateSetEntry(id: setEntry.id, reps: reps, weight: weight)
                                }
                            )
                        },
                        onDelete: { confirmDeleteSetEntry(index: index) } )
                            .confirmationDialog("Are you sure?", isPresented: $showDeleteConfirmation) {
                                Button("Delete set", role: .destructive) {
                                    guard let index = setEntryIndexToDelete else { return }
                                    let setEntryToDelete = setEntries[index]
                                    setEntries.remove(at: index)
                                    setEntryViewModel.deleteSetEntry(id: setEntryToDelete.id, onSuccess: { onDelete() })
                                }
                            }
                            .frame(height: 28) // TODO: figure out how not to choose hardcoded values
                }

            }
        }

    }
}

struct EditSetEntryList_Previews: PreviewProvider {
    static var previews: some View {
        EditSetEntryList(setEntries: .constant([SetEntry(id: "1", weight: 225.0, reps: 5)]), prevSetEntries: [], onDelete: {})
    }
}
