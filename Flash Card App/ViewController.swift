//
//  ViewController.swift
//  Flash Card App
//
//  Created by Tu Pham on 7/18/19.
//  Copyright © 2019 Tu Pham. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    var languageList = ["日本語", "한국어", "English"]
 
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .white
        // Do any additional setup after loading the view, typically from a nib.
    }
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath?{
        let delay = 0.35
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            if indexPath.row == 0 {
                self.performSegue(withIdentifier: "segue", sender: nil)
            } else if indexPath.row == 1 {
                self.performSegue(withIdentifier: "segue1", sender: nil)
            } else {
                self.performSegue(withIdentifier: "segue2", sender: nil)
            }
            
        }
        return indexPath
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let delay = 0.7
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
        tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languageList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LanguageCell
        cell.imgFlag.layer.cornerRadius =  cell.imgFlag.bounds.size.height / 2
        cell.imgFlag.layer.borderColor = UIColor.lightGray.cgColor
        cell.imgFlag.layer.borderWidth = 1
        
        if indexPath.row == 0 {
            cell.imgFlag.image = UIImage(named: "jp")
            cell.imgFlag.layer.cornerRadius =  cell.imgFlag.bounds.size.height / 2
            cell.label.text = languageList[indexPath.row]
        } else if indexPath.row == 1 {
            cell.imgFlag.image = UIImage(named: "kr")
            cell.label.text = languageList[indexPath.row]
        } else {
            cell.imgFlag.image = UIImage(named: "us")
            cell.label.text = languageList[indexPath.row]
        }
        return cell
    }
}

class LanguageCell: UITableViewCell {
    @IBOutlet weak var imgFlag: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: true)
        self.accessoryType = isSelected ? .checkmark : .none
    }
}

