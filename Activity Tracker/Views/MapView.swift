//
//  MapView.swift
//  Activity Tracker
//
//  Created by Egor Mironov on 28/09/2025.
//  Copyright © 2025 Egor Mironov. All rights reserved.
//

import MapKit
import SwiftUI
import Combine

struct MapView: View {

    @ObservedObject var viewModel: MapViewModel
    @Environment(\.mkMapView) var mkMapView: MKMapView

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            TrackerMapView(viewModel: viewModel)
            ZStack {
                Rectangle().fill(Color(.systemBackground)).cornerRadius(4).shadow(radius: 2)
                UserTrackingButton().accentColor(Color.green).fixedSize()
            }.fixedSize().padding(EdgeInsets(top: 0, leading: 0, bottom: 32, trailing: 16))
        }
    }
}
