//
//  CustomButtonStyle.swift
//  Test_IunusovIrek
//
//  Created by Reek i on 11.03.2024.
//

import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        RoundedRectangle(cornerRadius: 10)
            .stroke(lineWidth: 1)
            .aspectRatio(contentMode: .fit)
            .overlay {
                configuration.label
            }
            .scaleEffect(configuration.isPressed ? 0.8 : 1)
            .animation(.default, value: configuration.isPressed)
    }
}
