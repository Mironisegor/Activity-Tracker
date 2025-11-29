//
//  Activity Tracker
//
//  Created by Egor Mironov on 28/09/2025.
//  Copyright © 2025 Egor Mironov. All rights reserved.
//

import UIKit
import SwiftUI
import Injected

protocol ViewRunner {
    associatedtype Content: View
    func start() -> Content
}

class Coordinator {

    private var childCoordinators = [Coordinator]()
    private(set) weak var parent: Coordinator?

    deinit {
        stop()
    }

    func stop() {
        parent?.onChildFinished(self)
        childCoordinators.forEach { $0.stop() }
    }

    private func add(_ coordinator: Coordinator) {
        assert(childCoordinators.contains { $0 === coordinator } == false)
        childCoordinators.append(coordinator)
        coordinator.parent = self
    }

    private func remove(_ coordinator: Coordinator) {
        childCoordinators.removeAll { $0 === coordinator }
        coordinator.parent = nil
    }

    func onChildFinished(_ coordinator: Coordinator) {
        assert(coordinator !== self)
        remove(coordinator)
    }

    func route<C: Coordinator & ViewRunner>(to coordinator: C) -> some View {
        add(coordinator)
        return coordinator.start()
    }
}

class AppCoordinator: Coordinator, ViewRunner {

    @Injected var dataImporter: GPXImporter

    private weak var window: UIWindow?

    init(window: UIWindow?) {
        self.window = window
    }

    @discardableResult
    func start() -> some View {
        route(to: RootCoordinator(window: window))
    }

    func open(URLContexts: Set<UIOpenURLContext>) {
        guard let context = URLContexts.first else {
            return
        }

        do {
            try dataImporter.import(url: context.url)
        } catch {
            debugPrint("GPX Импорт", error)
        }
    }
}
