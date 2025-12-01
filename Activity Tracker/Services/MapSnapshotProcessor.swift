//
//  MapSnapshotProcessor.swift
//  Activity Tracker
//
//  Created by Egor Mironov on 28/09/2025.
//  Copyright © 2025 Egor Mironov. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

protocol MapSnapshotProcessor {
    func process(_ snapshot: MKMapSnapshotter.Snapshot?) -> UIImage?
}
