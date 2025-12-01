//
//  AvgSpeedViewModel.swift
//  Activity Tracker
//
//  Created by Egor Mironov on 28/09/2025.
//  Copyright © 2025 Egor Mironov. All rights reserved.
//

import Foundation

class AvgSpeedViewModel: GaugeViewModel {

    override init() {
        super.init()

        fontSize = 160
        title = Strings.avg_speed.uppercased()
        rideService.avgSpeed
            .removeDuplicates()
            .sink { value in // m/s
                let formatted = RideViewModel.speed(value, unit: Settings.shared.speedUnit)
                self.value = formatted.value
                self.units = formatted.units.uppercased()
            }
            .store(in: &cancellable)
    }
}
