//
//  GradientPolylineRenderer.swift
//  Activity Tracker
//
//  Created by Egor Mironov on 28/09/2025.
//  Copyright © 2025 Egor Mironov. All rights reserved.
//

import MapKit

class GradientPolylineRenderer: MKPolylineRenderer {

    var colors: [UIColor] = []
    let pathDrawer = GradientPathDrawer()

    override func draw(_ mapRect: MKMapRect, zoomScale: MKZoomScale, in context: CGContext) {
        super.draw(mapRect, zoomScale: zoomScale, in: context)
        pathDrawer.draw(context: context, size: path.boundingBoxOfPath.size, path: path, colors: colors)
    }
}
