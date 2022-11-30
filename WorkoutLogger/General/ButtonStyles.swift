//
//  ButtonStyles.swift
//  WorkoutLogger
//
//  Created by Neil Viloria on 2022-11-27.
//

import SwiftUI

enum ButtonVariation {
    case primary, secondary
}

struct ButtonVariationModifier: ViewModifier {
    var variation = ButtonVariation.primary

    func getBackgroundColor(variation: ButtonVariation) -> Color {
        switch variation {
        case .primary:
            return .primaryColor
        default:
            return .white
        }
    }
    
    func getForegroundColor(variation: ButtonVariation) -> Color {
        switch variation {
        case .primary:
            return .white
        case .secondary:
            return .black
        }
    }

    func body(content: Content) -> some View {
        content
            .background(getBackgroundColor(variation: self.variation))
            .foregroundColor(getForegroundColor(variation: self.variation))
    }
}

struct RoundedButton: ButtonStyle {
    var variation = ButtonVariation.primary

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding([.top, .bottom], 15)
            .padding([.leading, .trailing], 30)
            .modifier(ButtonVariationModifier(variation: variation))
            .fontWeight(.semibold)
            .cornerRadius(.infinity)
            .opacity(configuration.isPressed ? 0.5 : 1.0)
    }
}

struct TextButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding([.top, .bottom], 10)
            .foregroundColor(.white)
            .opacity(configuration.isPressed ? 0.5 : 1.0)
    }
}

struct ButtonStyles_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Button(action:{ }) {
                Text("Button")
            }.buttonStyle(RoundedButton())
            Button(action:{ }) {
                Text("Button")
            }.buttonStyle(RoundedButton(variation: .secondary))
            Button(action: { }) {
                Text("Button")
            }.buttonStyle(TextButton())
        }.preferredColorScheme(.dark)
    }
}
