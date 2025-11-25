//
//  Activity Tracker
//
//  Created by Egor Mironov on 28/09/2025.
//  Copyright © 2025 Egor Mironov. All rights reserved.
//

import SwiftUI

class HistoryCoordinator: Coordinator, ViewRunner {

    private var isPresented: Binding<Bool>

    init(isPresented: Binding<Bool>) {
        self.isPresented = isPresented
    }

    func start() -> some View {
        NavigationLink(destination: EmptyView(), isActive: isPresented) {
            EmptyView()
        }
    }
}
