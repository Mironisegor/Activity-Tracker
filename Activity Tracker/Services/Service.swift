//
//  Service.swift
//  Activity Tracker
//
//  Created by Egor Mironov on 28/09/2025.
//  Copyright © 2025 Egor Mironov. All rights reserved.
//

protocol Service {

    var shouldAutostart: Bool { get }

    func start()
    func stop()
}
