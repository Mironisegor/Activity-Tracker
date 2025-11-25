//
//  ValueDescriptionView.swift
//  Activity Tracker
//
//  Created by Egor Mironov on 28/09/2025.
//  Copyright © 2025 Egor Mironov. All rights reserved.
//
import SwiftUI

struct ValueDescriptionView: View {
    let text: String
    let details: String

    var body: some View {
        VStack {
            Text(text)
                .font(.headline)
            Text(details.localizedUppercase)
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }
}
