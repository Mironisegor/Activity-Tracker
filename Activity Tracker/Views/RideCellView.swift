//
//  RideCellView.swift
//  Activity Tracker
//
//  Created by Egor Mironov on 28/09/2025.
//  Copyright © 2025 Egor Mironov. All rights reserved.
//

import SwiftUI
import CoreLocation

struct RideCellView: View {

    var viewModel: RideViewModel

    var body: some View {
        VStack {
            HStack(alignment: .firstTextBaseline) {
                Text(viewModel.title)
                    .lineLimit(3)
                Spacer()
                Text(viewModel.date)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            HStack(alignment: .top) {
                RideMapSnapshotView(viewModel: viewModel, mapSize: viewModel.mapSize)
                    .frame(width: 120, height: 80, alignment: .leading)
                RideSummaryView(viewModel: viewModel)
                    .frame(minWidth: 0, maxWidth: .infinity)
            }
        }
    }
}
