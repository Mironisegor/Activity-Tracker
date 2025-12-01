//
//  DistanceView.swift
//  Activity Tracker
//
//  Created by Egor Mironov on 28/09/2025.
//  Copyright © 2025 Egor Mironov. All rights reserved.
//

import SwiftUI
import Combine

class DistanceViewModel: GaugeViewModel {

    override init() {
        super.init()

        rideService.distance
            .removeDuplicates()
            .map { RideViewModel.distance($0, unit: Settings.shared.distanceUnit) }
            .assign(to: \.value, on: self)
            .store(in: &cancellable)
    }
}
