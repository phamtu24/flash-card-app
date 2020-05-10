//
//  AddHangulViewController.swift
//  Flash Card App
//
//  Created by Tu Pham on 7/21/19.
//  Copyright © 2019 Tu Pham. All rights reserved.
//

import UIKit

class AddHangulViewController: UIViewController {

    @IBOutlet weak var word: KoreanTextField!
    @IBOutlet weak var meaning: VietnameseTextField!
    @IBOutlet weak var example: KoreanTextField!
    @IBOutlet weak var popUpView: UIView!
    var listWord = [Hangul]()
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
    
    func resetField() {
        word.text = ""
        meaning.text = ""
        example.text = ""
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.navigationItem.title = "새로운 단어를 추가하다"
    }
    @IBAction func onClickInsert(_ sender: Any) {
        listWord = Hangul.fetchData()
        if listWord.count >= maxWord {
            let alert = UIAlertController(title: "Chú ý", message: "Hãy học hết \(maxWord) từ", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "はい", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        if word.text == "" || meaning.text == "" {
            let alert = UIAlertController(title: "Chú ý", message: "Điền đầy đủ thông tin", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "はい", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else if  word.text != "" && meaning.text != "" && listWord.count < maxWord {
            Hangul.insertNewWord(word: word.text!, meaning: meaning.text!, example: example.text ?? "")
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
