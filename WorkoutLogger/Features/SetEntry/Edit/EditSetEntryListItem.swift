//
//  EditSetEntryListItem.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2023-02-06.
//

import SwiftUI


struct EditSetEntryListItem: View {
    var setNumber: Int

    var prevSetEntry: SetEntry?

    @StateObject
    var repFieldObserver: IntFieldObserver

    @StateObject
    var weightFieldObserver: DoubleFieldObserver

    let onChange: (_ reps: Int?, _ weight: Double?) -> Void

    let decimalNumberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 3
        return numberFormatter
    }()

    func formattedPrevSetEntryString(_ prevSetEntry: SetEntry?) -> String {
        if let prevSetEntry = prevSetEntry {
            return "\(prevSetEntry.weight) lbs x \(prevSetEntry.reps) reps"
        }
        return ""
    }

    var body: some View {
        HStack {
            Text(String(setNumber))
                .fontWeight(.semibold)
                .frame(width: 32)

            Text(formattedPrevSetEntryString(prevSetEntry))
                .padding(4)
                .lineLimit(1)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .background(.thinMaterial)
                .foregroundColor(.secondaryText)
                .cornerRadius(8)

            TextField("reps", value: $repFieldObserver.int, formatter: NumberFormatter())
                .padding(4)
                .multilineTextAlignment(.center)
                .frame(width: 64)
                .background(.thinMaterial)
                .cornerRadius(8)
                .keyboardType(.numberPad)
                .onReceive(repFieldObserver.$debouncedInt.dropFirst()) { val in
                    onChange(val, nil)
                }
                .textFieldStyle(SetEntryTextFieldStyle())
            TextField("weight", value: $weightFieldObserver.double, formatter: decimalNumberFormatter)
                .padding(4)
                .multilineTextAlignment(.center)
                .frame(width: 64)
                .background(.thinMaterial)
                .cornerRadius(8)
                .keyboardType(.decimalPad)
                .onReceive(weightFieldObserver.$debouncedDouble.dropFirst()) { val in
                    onChange(nil, val)
                }
                .textFieldStyle(SetEntryTextFieldStyle())
        }
    }
}

struct EditSetEntryListItem_Previews: PreviewProvider {
    static var previews: some View {
        EditSetEntryListItem(setNumber: 1, repFieldObserver: IntFieldObserver(text: 0), weightFieldObserver: DoubleFieldObserver(text: 0)) { reps, weight in
            
        }
    }
}
