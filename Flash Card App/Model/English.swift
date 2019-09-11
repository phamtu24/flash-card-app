//
//  English.swift
//  Flash Card App
//
//  Created by Tu Pham on 7/24/19.
//  Copyright © 2019 Tu Pham. All rights reserved.
//

import Foundation
import CoreData


extension English {
    
    static func insertNewWord(word: String, meaning: String, example: String) {
        guard let context = AppDelegate.managedObjectContext else {return}
        let newWord = NSEntityDescription.insertNewObject(forEntityName: "English", into: context) as! English
        newWord.word = word
        newWord.meaning = meaning
        newWord.example = example
        do {
            try context.save()
        } catch let error {
            print(error)
        }
    }
    
    static func fetchData() -> [English] {
        var result = [English]()
        guard let context = AppDelegate.managedObjectContext else {return result}
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "English")
        do {
            result =   try context.fetch(fetchRequest) as! [English]
            return result
        } catch let error {
            print(error)
            return result
        }
        
    }
    
    static func deleteAll() -> Bool {
        guard let context = AppDelegate.managedObjectContext else {return false}
        let fetchRequest = English.fetchData()
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
