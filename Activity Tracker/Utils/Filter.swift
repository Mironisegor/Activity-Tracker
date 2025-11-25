//
//  Filter.swift
//  Activity Tracker
//
//  Created by Egor Mironov on 28/09/2025.
//  Copyright © 2025 Egor Mironov. All rights reserved.
//

import Foundation

class LowPassFilter: InputProcessor {

    var value: Double = 0
    let factor: Double

    init(initialValue: Double? = .zero, factor: Double) {
        self.value = initialValue ?? .zero
        self.factor = factor
    }

    func process(input: Double) -> Double {
        value = factor * input + value * (1.0 - factor)
        return value
    }
}
