//
//  ViewModel.swift
//  Activity Tracker
//
//  Created by Egor Mironov on 28/09/2025.
//  Copyright © 2025 Egor Mironov. All rights reserved.
//

import Combine
import Injected

class ViewModel {
    @Injected var rideService: RideService
    @Injected var locationService: LocationService
    @Injected var bluetoothService: BluetoothScanner

    var cancellable = Set<AnyCancellable>()
}
