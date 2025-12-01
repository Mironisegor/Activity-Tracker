//
//  Permissions.swift
//  Activity Tracker
//
//  Created by Egor Mironov on 28/09/2025.
//  Copyright © 2025 Egor Mironov. All rights reserved.
//

import UIKit
import Combine
import CoreLocation

protocol Permissions: Service {
    associatedtype Status

    var status: AnyPublisher<Status, Never> { get }

    func request() -> Future<Status, Never>
}
