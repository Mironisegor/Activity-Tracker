//
//  Activity Tracker
//
//  Created by Egor Mironov on 28/09/2025.
//  Copyright © 2025 Egor Mironov. All rights reserved.
//

import struct CoreGraphics.CGPoint
import struct CoreGraphics.CGRect
import struct CoreGraphics.CGSize

extension CGRect {
    func scaled(by scale: CGPoint) -> CGRect {
        CGRect(origin: origin, size: size.scaled(by: scale))
    }
}

extension CGSize {
    func scaled(by scale: CGPoint) -> CGSize {
        CGSize(width: width * scale.x, height: height * scale.y)
    }
}
