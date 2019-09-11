//
//  AddEnglishViewController.swift
//  Flash Card App
//
//  Created by Tu Pham on 7/24/19.
//  Copyright © 2019 Tu Pham. All rights reserved.
//


import UIKit

class AddEnglishViewController: UIViewController {
    
    @IBOutlet weak var word: UITextField!
    @IBOutlet weak var meaning: UITextField!
    @IBOutlet weak var example: UITextField!
    @IBOutlet weak var popUpView: UIView!
    var listWord = [English]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        popUpView.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.navigationItem.title = "Add new words"
    }
    @IBAction func onClickInsert(_ sender: Any) {
        listWord = English.fetchData()
        if listWord.count >= 10 {
            let alert = UIAlertController(title: "Alert", message: "Please learn 10 words first", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Yes", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        if word.text == "" || meaning.text == "" {
            let alert = UIAlertController(title: "Alert", message: "Please fill all fields", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Yes", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else if  word.text != "" && meaning.text != "" && listWord.count < 10 {
            English.insertNewWord(word: word.text!, meaning: meaning.text!, example: example.text ?? "")
            UIView.animate(withDuration: 0.8, animations: {
                self.popUpView.alpha = 1
            }) { (true) in
                UIView.animateKeyframes(withDuration: 0.8, delay: 1, animations: {
                    self.popUpView.alpha = 0
                })
            }
            
        }
    }
}
