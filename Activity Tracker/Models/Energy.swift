//
//  Activity Tracker
//
//  Created by Egor Mironov on 28/09/2025.
//  Copyright © 2025 Egor Mironov. All rights reserved.
//

import Foundation

struct Energy {

    static func energy(power: Measurement<UnitPower>, duration: Measurement<UnitDuration>) -> Measurement<UnitEnergy> {
        let watts = power.converted(to: .watts)
        let seconds = duration.converted(to: .seconds)
        let kilojoules = watts.value / 1000 * seconds
        return Measurement(value: kilojoules.value, unit: UnitEnergy.kilojoules)
    }
}
