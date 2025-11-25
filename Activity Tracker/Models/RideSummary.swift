//
//  Activity Tracker
//
//  Created by Egor Mironov on 28/09/2025.
//  Copyright © 2025 Egor Mironov. All rights reserved.
//

import CoreData

extension RideSummary {

    public override func awakeFromInsert() {
        super.awakeFromInsert()
        id = UUID()
    }

    @discardableResult
    static func create(context: NSManagedObjectContext) -> RideSummary {
        RideSummary(context: context)
    }
}
