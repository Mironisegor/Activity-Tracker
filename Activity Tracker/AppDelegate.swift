//
//  AppDelegate.swift
//  Activity Tracker
//
//  Created by Egor Mironov on 28/09/2025.
//  Copyright © 2025 Egor Mironov. All rights reserved.
//

import UIKit
import Combine
import CoreData
import Injected

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    private var cancellable = Set<AnyCancellable>()

    let dependencies = Dependencies {
        Dependency { LocationPermissions() }
        Dependency { StorageService() }
        Dependency { LocationService() }
        Dependency { RideService() }
        Dependency { HeartRateService() }
        Dependency { GPXImporter() }
        Dependency { GPXExporter() }
    }

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }


    func application(_ application: UIApplication,
                     configurationForConnecting connectingSceneSession: UISceneSession,
                     options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
}
