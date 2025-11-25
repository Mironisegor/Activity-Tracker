//
//  AlertButtonStyle.swift
//  Activity Tracker
//
//  Created by Egor Mironov on 28/09/2025.
//  Copyright © 2025 Egor Mironov. All rights reserved.
//

import SwiftUI

struct AlertButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        GeometryReader { geometry in
            configuration.label
                .font(.system(.body))
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: geometry.size.height / 2)
                        .stroke(lineWidth: 2)
                        .fill()
            )
        }
        .opacity(configuration.isPressed ? 0.5 : 1.0)
        .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}
