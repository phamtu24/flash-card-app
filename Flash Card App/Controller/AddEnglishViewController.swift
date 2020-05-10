//
//  AddEnglishViewController.swift
//  Flash Card App
//
//  Created by Tu Pham on 7/24/19.
//  Copyright © 2019 Tu Pham. All rights reserved.
//


import UIKit



class AddEnglishViewController: UIViewController {
    
    @IBOutlet weak var word: EnglishTextField!
    @IBOutlet weak var meaning: VietnameseTextField!
    @IBOutlet weak var example: EnglishTextField!
    @IBOutlet weak var popUpView: UIView!
    var listWord = [English]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        for k in UITextInputMode.activeInputModes {
            print(k.primaryLanguage)
        }
        popUpView.layer.cornerRadius = 10
    
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func resetField() {
        word.text = ""
        meaning.text = ""
        example.text = ""
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.navigationItem.title = "Add new words"
    }
    @IBAction func onClickInsert(_ sender: Any) {
        listWord = English.fetchData()
        if listWord.count >= maxWord {
            let alert = UIAlertController(title: "Alert", message: "Please learn \(maxWord) words first", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Yes", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        if word.text == "" || meaning.text == "" {
            let alert = UIAlertController(title: "Alert", message: "Please fill all fields", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Yes", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else if  word.text != "" && meaning.text != "" && listWord.count < maxWord {
            English.insertNewWord(word: word.text!, meaning: meaning.text!, example: example.text ?? "")
            resetField()
            UIView.animate(withDuration: 0.8, animations: {
                self.popUpView.alpha = 1
            }) { (true) in
                UIView.animateKeyframes(withDuration: 0.8, delay: 1, animations: {
                    self.popUpView.alpha = 0
                })
            }
            
        }
         dismissKeyboard()
    }
}
