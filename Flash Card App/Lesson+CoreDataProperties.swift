//
//  Lesson+CoreDataProperties.swift
//  Flash Card App
//
//  Created by Pham Tu on 5/10/20.
//  Copyright © 2020 Tu Pham. All rights reserved.
//
//

import Foundation
import CoreData


extension Lesson {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Lesson> {
        return NSFetchRequest<Lesson>(entityName: "Lesson")
    }

    @NSManaged public var date: NSDate?
    @NSManaged public var type: Int16
    @NSManaged public var englishList: NSSet?
    @NSManaged public var hangulList: NSSet?
    @NSManaged public var kanjiList: NSSet?

}

// MARK: Generated accessors for englishList
extension Lesson {

    @objc(addEnglishListObject:)
    @NSManaged public func addToEnglishList(_ value: English)

    @objc(removeEnglishListObject:)
    @NSManaged public func removeFromEnglishList(_ value: English)

    @objc(addEnglishList:)
    @NSManaged public func addToEnglishList(_ values: NSSet)

    @objc(removeEnglishList:)
    @NSManaged public func removeFromEnglishList(_ values: NSSet)

}

// MARK: Generated accessors for hangulList
extension Lesson {

    @objc(addHangulListObject:)
    @NSManaged public func addToHangulList(_ value: Hangul)

    @objc(removeHangulListObject:)
    @NSManaged public func removeFromHangulList(_ value: Hangul)

    @objc(addHangulList:)
    @NSManaged public func addToHangulList(_ values: NSSet)

    @objc(removeHangulList:)
    @NSManaged public func removeFromHangulList(_ values: NSSet)

}

// MARK: Generated accessors for kanjiList
extension Lesson {

    @objc(addKanjiListObject:)
    @NSManaged public func addToKanjiList(_ value: Kanji)

    @objc(removeKanjiListObject:)
    @NSManaged public func removeFromKanjiList(_ value: Kanji)

    @objc(addKanjiList:)
    @NSManaged public func addToKanjiList(_ values: NSSet)

    @objc(removeKanjiList:)
    @NSManaged public func removeFromKanjiList(_ values: NSSet)

}
