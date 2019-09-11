//
//  Kanji.swift
//  Flash Card App
//
//  Created by Tu Pham on 7/18/19.
//  Copyright © 2019 Tu Pham. All rights reserved.
//

import Foundation
import CoreData
import UIKit

extension Kanji {
    
    
    static func insertNewWord(word: String, meaning: String, example: String, hiragana: String){
        guard let context = AppDelegate.managedObjectContext else {return}
        let newWord = NSEntityDescription.insertNewObject(forEntityName: "Kanji", into: context) as! Kanji
        newWord.word = word
        newWord.hiragana = hiragana
        newWord.meaning = meaning
        newWord.example = example
        do {
           try context.save()
            print("done")
        } catch let error {
            print("エラは \(error)")
        }
        
    }
    
    static func fetchData() -> [Kanji] {
        var result = [Kanji]()
        guard let context = AppDelegate.managedObjectContext else {return result}
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Kanji")
        do {
            result = try context.fetch(fetchRequest) as! [Kanji]
        } catch let error {
            print(error)
            return result
        }
        return result
    }
    
    static func deleteAll(){
        guard let context = AppDelegate.managedObjectContext else {return}
        let fetchRequest = Kanji.fetchData()
        for element in fetchRequest {
            context.delete(element)
        }
        do {
            try AppDelegate.managedObjectContext?.save()
            print("ok")
            return
            
        } catch let error {
             print(error)
            return
        }
    }
}
