//
//  HistoryView.swift
//  Activity Tracker
//
//  Created by Egor Mironov on 28/09/2025.
//  Copyright © 2025 Egor Mironov. All rights reserved.
//

import SwiftUI

struct HistoryView: View {

    @ObservedObject var viewModel: HistoryViewModel
    @FetchRequest(sortDescriptors: Ride.sortDescriptors) var rides: FetchedResults<Ride>
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                if rides.isEmpty {
                    VStack {
                        Spacer()
                        Text("Не найдено треков")
                            .font(.headline)
                            .foregroundColor(Color(UIColor.secondaryLabel))
                        Text("Начните вести историю")
                            .font(.caption)
                            .foregroundColor(Color(UIColor.tertiaryLabel))
                        Spacer()
                    }
                } else {
                    List(rides) { ride in
                        NavigationLink(
                            destination:
                            RideViewDetails(viewModel: RideDetailsViewModel(ride: ride))
                                .navigationBarTitle(Text(Strings.summary), displayMode: .inline)
                        ) {
                            RideCellView(viewModel: RideViewModel(ride: ride))
                                .padding([.bottom], 6)
                        }
                    }
                }
            }
            .navigationBarTitle(Text(Strings.rides), displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: { self.presentationMode.wrappedValue.dismiss() }) {
                    Text(Strings.close)
                }
            )
        }
    }
}
