//
//  GaugesView.swift
//  Activity Tracker
//
//  Created by Egor Mironov on 28/09/2025.
//  Copyright © 2025 Egor Mironov. All rights reserved.
//

import SwiftUI
import PageView

struct GaugesView: View {

    @ObservedObject var viewModel: ContentViewModel
    @Binding var pageIndex: Int

    var body: some View {
        PageView(index: self.$pageIndex) {
            PageView.Page {
                AnyView(
                    ZStack {
                        VStack {
                            SpeedView(viewModel: viewModel.speedViewModel)
                                .frame(minHeight: 0, maxHeight: .infinity)
                            HStack {
                                GaugeView(viewModel: viewModel.durationViewModel)
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                GaugeView(viewModel: viewModel.distanceViewModel)
                                    .frame(minWidth: 0, maxWidth: .infinity)
                            }.padding(EdgeInsets(top: 0, leading: 0, bottom: 18, trailing: 0))
                        }
                    }.background(Color(UIColor.systemBackground))
                )
            }
            PageView.Page {
                AnyView(
                    ZStack {
                        VStack {
                            SpeedView(viewModel: viewModel.avgSpeedViewModel)
                                .frame(minHeight: 0, maxHeight: .infinity)
                            HStack {
                                GaugeView(viewModel: viewModel.durationViewModel)
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                GaugeView(viewModel: viewModel.distanceViewModel)
                                    .frame(minWidth: 0, maxWidth: .infinity)
                            }.padding(EdgeInsets(top: 0, leading: 0, bottom: 18, trailing: 0))
                        }
                    }.background(Color(UIColor.systemBackground))
                )
            }
        }
    }
}
