//
//  Activity Tracker
//
//  Created by Egor Mironov on 28/09/2025.
//  Copyright © 2025 Egor Mironov. All rights reserved.
//

import CoreData

extension NSPersistentContainer {
    convenience init(_ name: String) throws {
        self.init(
            name: name,
            managedObjectModel: try! PersistentContainer.model(name: name)
        )
    }
}
