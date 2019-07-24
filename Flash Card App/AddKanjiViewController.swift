//
//  AddViewController.swift
//  Flash Card App
//
//  Created by Tu Pham on 7/21/19.
//  Copyright © 2019 Tu Pham. All rights reserved.
//

import UIKit

class AddKanjiViewController: UIViewController {

    @IBOutlet weak var word: UITextField!
    @IBOutlet weak var hiragana: UITextField!
    @IBOutlet weak var meaning: UITextField!
    @IBOutlet weak var example: UITextField!
    @IBOutlet weak var popUpView: UIView!
    var listWord = [Kanji]()
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
        tabBarController?.navigationItem.title = "新しい言葉を追加する"
    }
    @IBAction func onClickInsert(_ sender: Any) {
        listWord = Kanji.fetchData()
        if listWord.count >= 10 {
            let alert = UIAlertController(title: "Chú ý", message: "Hãy học hết 10 từ", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "はい", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        if word.text == "" || hiragana.text == "" || meaning.text == "" {
            let alert = UIAlertController(title: "Chú ý", message: "Điền đầy đủ thông tin", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "はい", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else if  word.text != "" && meaning.text != "" &&  hiragana.text != "" && listWord.count < 10  {
            Kanji.insertNewWord(word: word.text!, meaning: meaning.text!, example: example.text ?? "", hiragana: hiragana.text!)
            UIView.animate(withDuration: 0.8, animations: {
                self.popUpView.alpha = 1
            }) { (true) in
                UIView.animateKeyframes(withDuration: 0.8, delay: 1, animations: {
                    self.popUpView.alpha = 0
                })
            }

        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
