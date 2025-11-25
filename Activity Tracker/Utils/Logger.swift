//
//  Logger.swift
//  Activity Tracker
//
//  Created by Egor Mironov on 28/09/2025.
//  Copyright © 2025 Egor Mironov. All rights reserved.
//

import os

struct Logger {

    static let main = Logger()

    private let logger = OSLog(subsystem: "fiets", category: "gps")

    func log(_ message: String) {
        os_log(.error, log: logger, "%{public}@", message)
    }
}
