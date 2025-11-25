//
//  StopButtonViewModel.swift
//  Activity Tracker
//
//  Created by Egor Mironov on 28/09/2025.
//  Copyright © 2025 Egor Mironov. All rights reserved.
//

import SwiftUI

class StopButtonViewModel: ViewModel, ObservableObject {

    @Published var isVisible = false
    @Published var isToggled = false

    var title: String { isToggled ? Strings.cancel : Strings.stop }

    override init() {
        super.init()

        rideService.state
            .sink {
                switch $0 {
                case .idle, .stopped:
                    withAnimation { self.isVisible = false }
                case .paused:
                    withAnimation { self.isVisible = true }
                case .running:
                    withAnimation { self.isVisible = true }
                }
        }
        .store(in: &cancellable)
    }
}
