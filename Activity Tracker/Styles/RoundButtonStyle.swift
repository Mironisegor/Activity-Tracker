//
//  RoundButtonStyle.swift
//  Activity Tracker
//
//  Created by Egor Mironov on 28/09/2025.
//  Copyright © 2025 Egor Mironov. All rights reserved.
//

import SwiftUI

struct RoundButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Circle()
                .fill()
            configuration.label
                .font(Font
                    .system(.title)
                    .bold()
                    .italic()
                )
                .foregroundColor(.white)
                .padding(12)
        }
        .opacity(configuration.isPressed ? 0.9 : 1.0)
        .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}
