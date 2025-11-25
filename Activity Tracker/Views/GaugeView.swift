//
//  GaugeView.swift
//  Activity Tracker
//
//  Created by Egor Mironov on 28/09/2025.
//  Copyright © 2025 Egor Mironov. All rights reserved.
//

import SwiftUI

struct GaugeView<ViewModel: GaugeViewModel>: View {

    @ObservedObject var viewModel: ViewModel
    @State var offset = CGSize.zero

    var body: some View {
        Text(viewModel.value)
            .minimumScaleFactor(0.2)
            .scaledFont(name: viewModel.fontName, size: CGFloat(viewModel.fontSize))
    }
}
