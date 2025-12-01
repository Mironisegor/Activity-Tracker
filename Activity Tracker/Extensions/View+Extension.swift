///
//  Activity Tracker
//
//  Created by Egor Mironov on 28/09/2025.
//  Copyright © 2025 Egor Mironov. All rights reserved.
//

import SwiftUI

extension View {

    func scaledFont(name: String, size: CGFloat) -> some View {
        modifier(ScaledFont(name: name, size: size))
    }
}
