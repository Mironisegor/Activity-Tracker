//
//  DurationViewModel.swift
//  Activity Tracker
//
//  Created by Egor Mironov on 28/09/2025.
//  Copyright © 2025 Egor Mironov. All rights reserved.
//

import SwiftUI
import Combine

class DurationViewModel: GaugeViewModel {

    override init() {
        super.init()

        rideService.elapsed
            .removeDuplicates()
            .map { RideViewModel.duration($0) }
            .assign(to: \.value, on: self)
            .store(in: &cancellable)
    }
}
