//
//  Timer2.swift
//  Activity Tracker
//
//  Created by Egor Mironov on 28/09/2025.
//  Copyright © 2025 Egor Mironov. All rights reserved.
//
import Combine
import Foundation

class Timer2 {

    let timer = Timer.TimerPublisher(interval: 1.0, runLoop: .main, mode: .default)
    private var cancellable = Set<AnyCancellable>()

    init() {
        timer
            .connect()
            .store(in: &cancellable)
    }

    deinit {
        cancellable.forEach { $0.cancel() }
    }
}
