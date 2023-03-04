//
//  TextFieldStyles.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2023-03-03.
//

import Foundation
import SwiftUI

// allows to highlight a set entry textfield if value is 0 to make it easier to replace
struct SetEntryTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .onReceive(NotificationCenter.default.publisher(for: UITextField.textDidBeginEditingNotification)) { obj in
                if let textField = obj.object as? UITextField {
                    guard textField.text == "0" else { return }
                    textField.selectedTextRange = textField.textRange(from: textField.beginningOfDocument, to: textField.endOfDocument)
                }
            }
    }
}
