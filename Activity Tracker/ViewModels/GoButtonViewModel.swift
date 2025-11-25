//
//  GoButtonViewModel.swift
//  Activity Tracker
//
//  Created by Egor Mironov on 28/09/2025.
//  Copyright © 2025 Egor Mironov. All rights reserved.
//

import SwiftUI

class GoButtonViewModel: ViewModel, ObservableObject {

    enum State {
        case text(Text)
        case image(Image)

        func view() -> AnyView {
            switch self {
            case .text(let text): return AnyView(text)
            case .image(let image): return AnyView(image)
            }
        }
    }

    @Published var state = State.text(Text(Strings.go))

    override init() {
        super.init()

        rideService.state
            .sink {
                switch $0 {
                case .idle, .stopped:
                    withAnimation {
                        self.state = .text(Text(Strings.go))
                    }
                case .paused:
                    withAnimation {
                        self.state = .image(Image(systemName: "play.fill"))
                    }
                case .running:
                    withAnimation {
                        self.state = .image(Image(systemName: "pause.fill"))
                    }
                }
            }
            .store(in: &cancellable)
    }
}
