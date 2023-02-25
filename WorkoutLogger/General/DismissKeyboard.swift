//
//  DismissKeyboard.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2023-02-23.
//

import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
