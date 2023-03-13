//
//  TextFields.swift
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

struct EmailField: UIViewRepresentable {
    var placeholder: String
    @Binding
    var text: String

    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.setContentHuggingPriority(.required, for: .vertical)
        textField.delegate = context.coordinator
        textField.placeholder = placeholder
        textField.textContentType = .emailAddress
        return textField
    }

    func updateUIView(_ textField: UITextField, context: Context) {
        textField.text = text
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(text: $text)
    }

    class Coordinator: NSObject, UITextFieldDelegate {
        @Binding var text: String

        init(text: Binding<String>) {
            _text = text
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
        }
    }
}


struct UsernameField: UIViewRepresentable {
    var placeholder: String
    @Binding
    var text: String

    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.setContentHuggingPriority(.required, for: .vertical)
        textField.delegate = context.coordinator
        textField.placeholder = placeholder
        textField.textContentType = .username
        return textField
    }

    func updateUIView(_ textField: UITextField, context: Context) {
        textField.text = text
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(text: $text)
    }

    class Coordinator: NSObject, UITextFieldDelegate {
        @Binding var text: String

        init(text: Binding<String>) {
            _text = text
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
        }
    }
}


struct PasswordField: UIViewRepresentable {
    var placeholder: String
    @Binding
    var text: String

    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.setContentHuggingPriority(.required, for: .vertical)
        textField.delegate = context.coordinator
        textField.placeholder = placeholder
        textField.textContentType = .newPassword
        return textField
    }

    func updateUIView(_ textField: UITextField, context: Context) {
        textField.text = text
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(text: $text)
    }

    class Coordinator: NSObject, UITextFieldDelegate {
        @Binding var text: String

        init(text: Binding<String>) {
            _text = text
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
        }
    }
}
