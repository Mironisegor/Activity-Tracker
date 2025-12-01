//
//  Activity Tracker
//
//  Created by Egor Mironov on 28/09/2025.
//  Copyright © 2025 Egor Mironov. All rights reserved.
//

import CoreGraphics

extension CGContext {
    func draw(_ block: (CGContext) -> Void) {
        defer { restoreGState() }
        saveGState()
        block(self)
    }
}
