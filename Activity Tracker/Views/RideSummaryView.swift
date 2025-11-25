//
//  RideSummaryView.swift
//  Activity Tracker
//
//  Created by Egor Mironov on 28/09/2025.
//  Copyright © 2025 Egor Mironov. All rights reserved.
//

import SwiftUI

struct RideSummaryView: View {
    var viewModel: RideViewModel
    var body: some View {
        HStack {
            Spacer()
            VStack(spacing: 8) {
                ValueDescriptionView(text: viewModel.duration, details: viewModel.durationLabel)
                ValueDescriptionView(text: viewModel.avgSpeed, details: viewModel.avgSpeedLabel)
            }
            Spacer()
            VStack(spacing: 8) {
                ValueDescriptionView(text: viewModel.distance, details: viewModel.distanceLabel)
                ValueDescriptionView(text: viewModel.maxSpeed, details: viewModel.maxSpeedLabel)
            }
            Spacer()
        }
    }
}
