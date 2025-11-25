//
//  Activity Tracker
//
//  Created by Egor Mironov on 28/09/2025.
//  Copyright © 2025 Egor Mironov. All rights reserved.
//

import Combine
import Injected
import CoreDataStorage

protocol RideRepository {
    typealias RidesFuture = Future<[Ride], Error>
    func fetchRides() -> RidesFuture
}

struct CoreDataRideRepository: RideRepository {

    @Injected var storage: CoreDataStorage

    func fetchRides() -> RidesFuture {
        let context = storage.backgroundContext
        return RidesFuture { promise in
            context.perform {
                do {
                    let rides = try context.fetch(Ride.fetchRequest())
                    promise(.success(rides))
                } catch {
                    promise(.failure(error))
                }
            }
        }
    }
}
