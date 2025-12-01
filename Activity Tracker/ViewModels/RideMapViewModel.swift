//
//  RideMapViewModel.swift
//  Activity Tracker
//
//  Created by Egor Mironov on 28/09/2025.
//  Copyright © 2025 Egor Mironov. All rights reserved.
//

import MapKit
import SwiftUI

class RideMapViewModel {

    let ride: Ride

    var region: MKCoordinateRegion? {
        ride.track?.region?.asMKCoordinateRegion()
    }

    var locations: [CLLocation] {
        ride.track?.locations() ?? []
    }

    var coordinates: [CLLocationCoordinate2D] {
        locations.map { $0.coordinate }
    }

    init(ride: Ride) {
        self.ride = ride
    }
}
