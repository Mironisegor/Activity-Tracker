//
//  ElevationTests.swift
//  Activity Tracker
//
//  Created by Egor Mironov on 28/09/2025.
//  Copyright © 2025 Egor Mironov. All rights reserved.
//

import XCTest
@testable import Velik

class ElevationTests: XCTestCase {

    func testElevationGain() throws {
        let xml = GPXUtils.read(file: .long)
        let gpx: GPXTrack = try XMLDecoder.decode(xml)

        let elevationGainProcessor = ElevationGainProcessor(initialAltitude: gpx.locations.first!.altitude)
        var elevationGain = 0.0

        gpx.locations.dropFirst().forEach {
            elevationGain = elevationGainProcessor.process(input: $0.altitude)
        }

        XCTAssertEqual(17.2, elevationGain, accuracy: 1)
    }
}
