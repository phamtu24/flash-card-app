//
//  LessonTableViewController.swift
//  Flash Card App
//
//  Created by Pham Tu on 5/10/20.
//  Copyright © 2020 Tu Pham. All rights reserved.
//

import UIKit

class LessonTableViewController: UITableViewController {
    
    var lessons: [Lesson]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return lessons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lessonCell", for: indexPath)
        cell.textLabel?.text = lessons[indexPath.row].date?.toString()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let lessonType = lessons[indexPath.row].type
        switch lessonType {
        case 0:
            performSegue(withIdentifier: EntityName.kanji, sender: nil)
        case 1:
            performSegue(withIdentifier: EntityName.hangul, sender: nil)
        default:
            performSegue(withIdentifier: EntityName.english, sender: nil)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let rowNumber = tableView.indexPathForSelectedRow?.row else { return }
        let lessonDate = lessons[rowNumber].date
        switch segue.identifier {
        case EntityName.kanji:
            let vc = segue.destination as! KanjiViewController
            vc.lessonDate = lessonDate
            break
        case EntityName.hangul:
            let vc = segue.destination as! HangulViewController
            vc.lessonDate = lessonDate
            break
        case EntityName.english:
            let vc = segue.destination as! EnglishViewController
            vc.lessonDate = lessonDate
            break
        default: break
            
        }
    }
}
