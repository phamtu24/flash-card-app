//
//  English+CoreDataProperties.swift
//  Flash Card App
//
//  Created by Pham Tu on 5/10/20.
//  Copyright © 2020 Tu Pham. All rights reserved.
//
//

import Foundation
import CoreData


extension English {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<English> {
        return NSFetchRequest<English>(entityName: "English")
    }

    @NSManaged public var example: String?
    @NSManaged public var meaning: String?
    @NSManaged public var word: String?
    @NSManaged public var lession: Lesson?

}
