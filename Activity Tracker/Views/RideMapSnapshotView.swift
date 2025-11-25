//
//  RideMapSnapshotView.swift
//  Activity Tracker
//
//  Created by Egor Mironov on 28/09/2025.
//  Copyright © 2025 Egor Mironov. All rights reserved.
//

import SwiftUI

struct RideMapSnapshotView: View {

    let viewModel: RideViewModel
    let mapSize: CGSize

    var body: some View {
        AsyncMapImage(
            uuid: viewModel.uuid,
            region: viewModel.mapRegion,
            size: mapSize,
            processor: viewModel.mapProcessor()) {
                Rectangle() // placeholder
                    .foregroundColor(Color(UIColor.systemFill))
        }
    }
}
