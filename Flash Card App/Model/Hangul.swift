//
//  Hangul.swift
//  Flash Card App
//
//  Created by Tu Pham on 7/21/19.
//  Copyright © 2019 Tu Pham. All rights reserved.
//

import Foundation
import CoreData

extension Hangul {
    
    static func insertNewWord(word: String, meaning: String, example: String) {
        guard let context = AppDelegate.managedObjectContext else {return}
        let newWord = NSEntityDescription.insertNewObject(forEntityName: "Hangul", into: context) as! Hangul
        newWord.word = word
        newWord.meaning = meaning
        newWord.example = example
        do {
            try context.save()
        } catch let error {
            print(error)
        }
    }
    
    static func fetchData() -> [Hangul] {
        var result = [Hangul]()
        guard let context = AppDelegate.managedObjectContext else {return result}
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Hangul")
        do {
          result =   try context.fetch(fetchRequest) as! [Hangul]
            return result
        } catch let error {
            print(error)
            return result
        }
        
    }
    
    static func deleteAll() -> Bool {
        guard let context = AppDelegate.managedObjectContext else {return false}
        let fetchRequest = Hangul.fetchData()
        for word in fetchRequest {
            context.delete(word)
        }
        do {
            try context.save()
             return true
        } catch let error {
            print(error)
            return false
        }
    }
    
}
