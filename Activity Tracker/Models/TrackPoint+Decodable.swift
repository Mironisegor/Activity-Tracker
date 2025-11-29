//
//  Activity Tracker
//
//  Created by Egor Mironov on 28/09/2025.
//  Copyright © 2025 Egor Mironov. All rights reserved.
//

import CoreData

extension TrackPoint: Decodable {

    public convenience init(from decoder: Decoder) throws {
        guard
            let key = CodingUserInfoKey.context,
            let context = decoder.userInfo[key] as? NSManagedObjectContext else {
                throw CodingErrors.missingContext
        }

        self.init(context: context)

        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let id = try container.decodeIfPresent(UUID.self, forKey: .id) {
            self.id = id
        }
        elevation = try container.decode(Double.self, forKey: .elevation)
        latitude = try container.decode(Double.self, forKey: .latitude)
        longitude = try container.decode(Double.self, forKey: .longitude)
        name = try container.decode(String?.self, forKey: .name)
        speed = try container.decode(Double.self, forKey: .speed)
        timestamp = try container.decode(Date.self, forKey: .timestamp)
    }
}
