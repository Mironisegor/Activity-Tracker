//
//  RideViewDetails.swift
//  Activity Tracker
//
//  Created by Egor Mironov on 28/09/2025.
//  Copyright © 2025 Egor Mironov. All rights reserved.
//

import SwiftUI
import Combine
import Injected
import class CoreData.NSManagedObjectID
import struct CoreLocation.CLLocationCoordinate2D

struct RideViewDetails: View {

    let viewModel: RideDetailsViewModel
    @State private var confirmDelete = false
    @State private var sharePresented = false

    var noDataText: some View {
        Text(Strings.no_data_available)
            .font(.caption)
            .foregroundColor(.secondary)
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(32)
    }

    var body: some View {
        GeometryReader { [viewModel] geometry in
            ScrollView {
                VStack(alignment: .leading) {
                    NavigationLink(destination:
                        RideMapView(viewModel: viewModel)
                            .navigationBarTitle(Text(Strings.map), displayMode: .inline)
                    ) {
                        RideMapSnapshotView(viewModel: viewModel, mapSize: viewModel.mapSize)
                            .frame(width: geometry.size.width, height: geometry.size.width/1.5)
                    }.buttonStyle(PlainButtonStyle())
                    if viewModel.isChartVisible(.elevation) {
                        Text(Strings.elevation).padding()
                        LineChartView(xValues: [0, viewModel.distanceValue],
                                      yValues: viewModel.elevations,
                                      fillStyle: viewModel.chartFillStyle,
                                      filter: LowPassFilter(initialValue: viewModel.elevations.first, factor: 0.2),
                                      unit: UnitLength.meters,
                                      outUnit: UnitLength.meters)
                            .animation(.easeInOut(duration: 2/3))
                            .frame(width: geometry.size.width)
                            .frame(height: 180)
                    }

                    RideFullSummaryView(viewModel: viewModel)

                    if viewModel.isChartVisible(.speed) {
                        Text(Strings.speed).padding()
                        LineChartView(xValues: [0, viewModel.distanceValue],
                                      yValues: viewModel.speed,
                                      fillStyle: viewModel.chartFillStyle,
                                      filter: LowPassFilter(initialValue: viewModel.speed.first, factor: 0.2),
                                      unit: UnitSpeed.metersPerSecond,
                                      outUnit: Settings.shared.speedUnit)
                            .animation(.easeInOut(duration: 2/3))
                            .frame(width: geometry.size.width, height: 180)
                    }
                }.padding(.bottom)
            }
        }.actionSheet(isPresented: $confirmDelete) {
            ActionSheet(
                title: Text(Strings.remove_ride_message),
                buttons: [
                    .destructive(Text(Strings.confirm_delete)) { self.viewModel.delete() },
                    .cancel()
                ]
            )
        }.sheet(isPresented: $sharePresented) {
            ShareSheet(activityItems: [self.viewModel.exportURL as Any])
        }.navigationBarItems(
            trailing:
            HStack {
                Button(
                    action: { self.viewModel.export() },
                    label: { Image(systemName: "square.and.arrow.up") }
                )
                Spacer(minLength: 16)
                Button(
                    action: { self.confirmDelete.toggle() },
                    label: {
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                    }
                )
            }
        ).onReceive(viewModel.$exportURL) {
            if $0 != nil { self.sharePresented.toggle() }
        }
    }
}
