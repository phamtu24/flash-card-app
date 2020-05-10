//
//  Lesson.swift
//  Flash Card App
//
//  Created by Pham Tu on 5/10/20.
//  Copyright © 2020 Tu Pham. All rights reserved.
//

import Foundation
import CoreData

extension Lesson {
    static func getAllLesson(type: Int) -> [Lesson] {
        var lessons = [Lesson]()
        guard let context = AppDelegate.managedObjectContext else { return lessons }
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: EntityName.lesson)
        fetchRequest.predicate = NSPredicate(format: "type == \(type)")
        let sort = NSSortDescriptor(key: "date", ascending: true)
        fetchRequest.sortDescriptors = [sort]
        do {
            lessons = try context.fetch(fetchRequest) as! [Lesson]
            return lessons
        } catch let err {
            print(err)
            return lessons
        }
    }
    
    static func insertNewLesson(date: NSDate, type: Int) {
        guard let context = AppDelegate.managedObjectContext else { return }
        let newLesson = NSEntityDescription.insertNewObject(forEntityName: EntityName.lesson, into: context) as! Lesson
        newLesson.date = date
        newLesson.type = Int16(type)
        do {
            try context.save()
            print("insert lesson done")
        } catch let err {
            print(err)
        }
        
    }
    
    static func checkExistLesson(date: NSDate, type: Int) -> Bool {
        guard let context = AppDelegate.managedObjectContext else { return false }
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: EntityName.lesson)
        fetchRequest.predicate = NSPredicate(format: "type == \(type) AND date == %@", date)
        
        do {
            let lessons = try context.fetch(fetchRequest) as! [Lesson]
            if lessons.count > 0 {
                return true
            } else {
                return false
            }
        } catch let err {
            print(err)
            return false
        }
    }
}
