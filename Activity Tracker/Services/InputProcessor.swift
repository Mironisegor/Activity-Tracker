//
//  InputProcessor.swift
//  Activity Tracker
//
//  Created by Egor Mironov on 28/09/2025.
//  Copyright © 2025 Egor Mironov. All rights reserved.
//

import Foundation

protocol InputProcessor {
    associatedtype Input
    associatedtype Output
    func process(input: Input) -> Output
}
