//
//  NotesView.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2023-03-10.
//

import SwiftUI

struct NotesView: View {
    @StateObject
    var textObserver: TextFieldObserver
    var prevNotes: String?
    var onChange: (String) -> Void

    @State
    private var tabIndex = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Notes").font(.system(size: 20, weight: .semibold))
                Spacer()
                Button("Today", action: { tabIndex = 0 }).underline(tabIndex == 0)
                Button("Previous", action: { tabIndex = 1 }).underline(tabIndex == 1)
            }
            if tabIndex == 0 {
                TextField("notes...", text: $textObserver.text, axis: .vertical)
                    .padding(8)
                    .lineLimit(3, reservesSpace: true)
                    .background(.thinMaterial)
                    .cornerRadius(8)
                    .onReceive(textObserver.$debouncedText.dropFirst()) { val in
                        onChange(val)
                    }
            }
            else if tabIndex == 1 {
                if let prevNotes = prevNotes, prevNotes.count > 0 {
                    Text(prevNotes)
                        .padding(8)
                        .lineLimit(3, reservesSpace: true)
                        .cornerRadius(8)
                } else {
                    Text("No notes")
                        .padding(8)
                        .foregroundColor(.secondaryText)
                        .lineLimit(3, reservesSpace: true)
                        .cornerRadius(8)
                }
            }
        }
    }
}
