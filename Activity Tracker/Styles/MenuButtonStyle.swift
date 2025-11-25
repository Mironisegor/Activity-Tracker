//
//  MenuButtonStyle.swift
//  Activity Tracker
//
//  Created by Egor Mironov on 28/09/2025.
//  Copyright © 2025 Egor Mironov. All rights reserved.
//

import SwiftUI

struct MenuButtonStyle: ButtonStyle {

    let tintColor = Color(UIColor.systemGreen)
    let backgroundColor = Color(UIColor.systemBackground)

    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Circle()
                .fill()
                .foregroundColor(configuration.isPressed ? tintColor : backgroundColor)
                .frame(width: 36, height: 36)
                .shadow(radius: 2)
            configuration.label
                .foregroundColor(configuration.isPressed ? backgroundColor : tintColor)
        }
    }
}
