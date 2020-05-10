//
//  Hangul+CoreDataProperties.swift
//  Flash Card App
//
//  Created by Pham Tu on 5/10/20.
//  Copyright © 2020 Tu Pham. All rights reserved.
//
//

import Foundation
import CoreData


extension Hangul {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Hangul> {
        return NSFetchRequest<Hangul>(entityName: "Hangul")
    }

    @NSManaged public var example: String?
    @NSManaged public var meaning: String?
    @NSManaged public var word: String?
    @NSManaged public var lesson: Lesson?

}
