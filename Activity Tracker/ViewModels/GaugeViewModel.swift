//
//  GaugeViewModel.swift
//  Activity Tracker
//
//  Created by Egor Mironov on 28/09/2025.
//  Copyright © 2025 Egor Mironov. All rights reserved.
//

import Combine
import Injected

class GaugeViewModel: ViewModel, ObservableObject {

    @Published var value = ""
    @Published var units = ""
    @Published var title = ""
    @Published var fontName = "DIN Alternate"
    @Published var fontSize = 28
}
