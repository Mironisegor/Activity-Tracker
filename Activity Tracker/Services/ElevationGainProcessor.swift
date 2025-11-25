//
//  ElevationGainProcessor.swift
//  Activity Tracker
//
//  Created by Egor Mironov on 28/09/2025.
//  Copyright © 2025 Egor Mironov. All rights reserved.
//

import CoreLocation

class ElevationGainProcessor: InputProcessor {

    var value: CLLocationDistance = .zero
    private var previousAltitude: CLLocationDistance
    private let filter: LowPassFilter

    init(initialAltitude: CLLocationDistance) {
        self.previousAltitude = initialAltitude
        self.filter = LowPassFilter(initialValue: initialAltitude, factor: 0.025)
    }

    func process(input: CLLocationDistance) -> CLLocationDistance {
        let altitude = filter.process(input: input)
        defer {
            previousAltitude = altitude
        }
        value += max(.zero, altitude - previousAltitude)
        return value
    }
}
