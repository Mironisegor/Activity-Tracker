//
//  MapSnapshotService.swift
//  Activity Tracker
//
//  Created by Egor Mironov on 28/09/2025.
//  Copyright © 2025 Egor Mironov. All rights reserved.
//

import UIKit
import MapKit
import Combine
import struct CoreLocation.CLLocationCoordinate2D

protocol MapSnapshotProtocol {
    func makeSnapshot(region: MKCoordinateRegion,
                      size: CGSize,
                      processor: MapSnapshotProcessor) -> AnyPublisher<UIImage?, Error>
}

class MapKitSnapshot: MapSnapshotProtocol {

    func makeSnapshot(region: MKCoordinateRegion,
                      size: CGSize,
                      processor: MapSnapshotProcessor) -> AnyPublisher<UIImage?, Error> {

        MKMapSnapshotter
            .Publisher(region: region, size: size, processor: processor)
            .eraseToAnyPublisher()
    }
}
