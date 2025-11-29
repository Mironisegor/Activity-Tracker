//
//  Activity Tracker
//
//  Created by Egor Mironov on 28/09/2025.
//  Copyright © 2025 Egor Mironov. All rights reserved.
//

import MapKit

extension MKMapSnapshotter.Options {
    convenience init(region: MKCoordinateRegion, size: CGSize) {
        self.init()
        self.region = region
        self.size = size
    }
}

extension MKMapSnapshotter {
    static func Publisher(region: MKCoordinateRegion,
                          size: CGSize = CGSize(width: 1200, height: 800),
                          processor: MapSnapshotProcessor) -> MKMapSnapshotterPublisher {
        let options = MKMapSnapshotter.Options(region: region, size: size)
        let snapshotter = MKMapSnapshotter(options: options)
        return MKMapSnapshotterPublisher(snapshotter: snapshotter, processor: processor)
    }
}
