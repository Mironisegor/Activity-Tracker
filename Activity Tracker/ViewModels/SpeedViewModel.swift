//
//  SpeedViewModel.swift
//  Activity Tracker
//
//  Created by Egor Mironov on 28/09/2025.
//  Copyright © 2025 Egor Mironov. All rights reserved.
//

import Combine
import Foundation
import CoreLocation

class SpeedViewModel: GaugeViewModel {

    override init() {
        super.init()

        fontSize = 160
        title = Strings.current_speed.uppercased()

        locationService.speed.map { _ in .zero }.debounce(for: .seconds(10), scheduler: RunLoop.main)
            .merge(with: locationService.speed)
            .removeDuplicates()
            .sink { value in // m/s
                let formatted = RideViewModel.speed(value, unit: Settings.shared.speedUnit)
                self.value = formatted.value
                self.units = formatted.units.uppercased()
            }
            .store(in: &cancellable)
    }
}
