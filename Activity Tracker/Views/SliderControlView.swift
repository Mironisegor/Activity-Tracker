//
//  SliderControlView.swift
//  Activity Tracker
//
//  Created by Egor Mironov on 28/09/2025.
//  Copyright © 2025 Egor Mironov. All rights reserved.
//

import SwiftUI

struct SliderControlView: View {

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(UIColor.systemBackground))
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 24, maxHeight: 24)
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(Color(UIColor.separator))
                .frame(width: 48, height: 3)
        }
    }
}
