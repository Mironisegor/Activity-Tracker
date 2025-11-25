//
//  Activity Tracker
//
//  Created by Egor Mironov on 28/09/2025.
//  Copyright © 2025 Egor Mironov. All rights reserved.
//

import Foundation

struct Weight {

    static func loss(energy: Measurement<UnitEnergy>) -> Measurement<UnitMass> {
        // 3,500 kcal ~ 0.45 kg of fat
        // 1 kcal = 0.000128571 kg
        let kcal = energy.converted(to: .kilocalories)
        return Measurement(value: 0.000128571 * kcal.value, unit: UnitMass.kilograms)
    }
}
