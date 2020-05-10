//
//  Kanji+CoreDataProperties.swift
//  Flash Card App
//
//  Created by Pham Tu on 5/10/20.
//  Copyright © 2020 Tu Pham. All rights reserved.
//
//

import Foundation
import CoreData


extension Kanji {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Kanji> {
        return NSFetchRequest<Kanji>(entityName: "Kanji")
    }

    @NSManaged public var example: String?
    @NSManaged public var hiragana: String?
    @NSManaged public var lessonDate: NSDate?
    @NSManaged public var meaning: String?
    @NSManaged public var word: String?
    @NSManaged public var lesson: Lesson?

}
