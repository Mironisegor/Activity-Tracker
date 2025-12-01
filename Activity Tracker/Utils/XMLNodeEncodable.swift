//
//  XMLNodeEncodable.swift
//  Activity Tracker
//
//  Created by Egor Mironov on 28/09/2025.
//  Copyright © 2025 Egor Mironov. All rights reserved.
//

import Foundation

protocol XMLNodeEncodable {
    static func nodeEncoding(forKey key: CodingKey) -> XMLEncoder.NodeEncodingStrategy
}

extension Optional where Wrapped == XMLNodeEncodable {
    func encoding(forKey key: CodingKey) -> XMLEncoder.NodeEncodingStrategy {
        switch self {
        case .some(let object):
            return type(of: object).nodeEncoding(forKey: key)
        default:
            return .element
        }
    }
}
