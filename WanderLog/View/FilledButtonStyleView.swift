//
//  FilledButtonStyleView.swift
//  WanderLog
//
//  Created by Tanushree Arora on 3/21/24.
//

// FilledButtonStyle.swift

import SwiftUI

struct FilledButtonStyleView: ButtonStyle {
    var backgroundColor: Color = .blue
    var foregroundColor: Color = .white
    var pressedOpacity: Double = 0.6
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(backgroundColor.opacity(configuration.isPressed ? pressedOpacity : 1))
            .foregroundColor(foregroundColor)
            .cornerRadius(10)
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}

struct FilledButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button("Test Button") {
            // Button action
        }
        .buttonStyle(FilledButtonStyleView())
    }
}

//#Preview{
//    FilledButtonStyleView()
//}




