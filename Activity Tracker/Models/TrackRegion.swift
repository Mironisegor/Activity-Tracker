//
//  Activity Tracker
//
//  Created by Egor Mironov on 28/09/2025.
//  Copyright © 2025 Egor Mironov. All rights reserved.
//

import MapKit
import CoreData

extension TrackRegion {

    @discardableResult
    static func create(region: MKCoordinateRegion, context: NSManagedObjectContext) -> TrackRegion {
        TrackRegion(context: context).apply {
            $0.latitudeCenter = region.center.latitude
            $0.longitudeCenter = region.center.longitude
            $0.latitudeDelta = region.span.latitudeDelta
            $0.longitudeDelta = region.span.longitudeDelta
        }
    }

    func asMKCoordinateRegion(scale: (latitude: Double, longitude: Double) = (1, 1)) -> MKCoordinateRegion {
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: latitudeCenter,
                longitude: longitudeCenter),
            span: MKCoordinateSpan(
                latitudeDelta: latitudeDelta * scale.latitude,
                longitudeDelta: longitudeDelta * scale.longitude)
        )
    }
}
