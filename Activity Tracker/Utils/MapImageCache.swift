//
//  MapImageCache.swift
//  Activity Tracker
//
//  Created by Egor Mironov on 28/09/2025.
//  Copyright © 2025 Egor Mironov. All rights reserved.
//

import UIKit

class MapImageCache {

    // Just to have CGSize Hashable
    struct Size: Hashable {
        let width: CGFloat
        let height: CGFloat

        init(_ size: CGSize) {
            self.width = size.width
            self.height = size.height
        }
    }

    // Keep different size caches
    struct Key: Hashable {
        let uuid: UUID
        let size: Size
    }

    static var inMemory = [Key: UIImage]()

    static func key(uuid: UUID, size: CGSize) -> Key {
        Key(uuid: uuid, size: Size(size))
    }
}
