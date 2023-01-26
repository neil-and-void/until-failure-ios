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

    var body: some View {
        if setEntries.count == 0 {

            Text("No set entries yet")
                .foregroundColor(.tertiaryText)
                .padding(.vertical, 2)
                .padding(.horizontal, 2)

        } else {

            Grid {

                GridRow {

                    Text("Set")
                        .fontWeight(.semibold)

                    Text("Prev")
                        .fontWeight(.semibold)

                    Text("Reps")
                        .fontWeight(.semibold)

                    Text("Weight")
                        .fontWeight(.semibold)

                }

                ForEach($setEntries) { setEntry in

                    GridRow {

                        Text(String(1))
                            .fontWeight(.semibold)

                        Text(String("225 lbs x 4 reps"))
                            .frame(maxWidth: .infinity)
                            .padding(4)
                            .lineLimit(1)
                            .multilineTextAlignment(.center)
                            .background(.thinMaterial)
                            .foregroundColor(.secondaryText)
                            .cornerRadius(8)

                        TextField("reps", value: setEntry.reps, formatter: NumberFormatter())
                            .frame(width: 64)
                            .padding(4)
                            .multilineTextAlignment(.center)
                            .background(.thinMaterial)
                            .cornerRadius(8)
                            .keyboardType(.numberPad)

                        TextField("weight", value: setEntry.weight, formatter: NumberFormatter())
                            .frame(width: 64)
                            .padding(4)
                            .multilineTextAlignment(.center)
                            .background(.thinMaterial)
                            .cornerRadius(8)
                            .keyboardType(.decimalPad)

                    }

                }

            }
            .frame(maxWidth: .infinity)

        }
    }
}

struct EditSetEntryList_Previews: PreviewProvider {
    static var previews: some View {
        EditSetEntryList(setEntries: .constant([SetEntry(id: "1", weight: 225.0, reps: 5)]))
    }
}
