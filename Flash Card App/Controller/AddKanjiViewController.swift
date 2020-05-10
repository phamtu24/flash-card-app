//
//  AddViewController.swift
//  Flash Card App
//
//  Created by Tu Pham on 7/21/19.
//  Copyright © 2019 Tu Pham. All rights reserved.
//

import UIKit

class AddKanjiViewController: UIViewController {
    
    @IBOutlet weak var lesson: JapaneseTextField!
    @IBOutlet weak var word: JapaneseTextField!
    @IBOutlet weak var hiragana: JapaneseTextField!
    @IBOutlet weak var meaning: VietnameseTextField!
    @IBOutlet weak var example: JapaneseTextField!
    @IBOutlet weak var popUpView: UIView!
    var listWord = [Kanji]()
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        popUpView.layer.cornerRadius = 10
        showDatePicker()
        // Do any additional setup after loading the view.
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func showDatePicker(){
        //Formate Date
        datePicker.datePickerMode = .date
        
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneDatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        
        toolbar.setItems([cancelButton,spaceButton,doneButton], animated: false)
        lesson.text = NSDate().toString()
        lesson.inputAccessoryView = toolbar
        lesson.inputView = datePicker
        
    }
    
    @objc func doneDatePicker(){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        lesson.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
    
    
    func resetField() {
        word.text = ""
        meaning.text = ""
        example.text = ""
        hiragana.text = ""
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.navigationItem.title = "新しい言葉を追加する"
    }
    @IBAction func onClickInsert(_ sender: Any) {
        //        listWord = Kanji.fetchData()
        //        if listWord.count >= maxWord {
        //            let alert = UIAlertController(title: "Chú ý", message: "Hãy học hết \(maxWord) từ", preferredStyle: .alert)
        //            alert.addAction(UIAlertAction(title: "はい", style: .cancel, handler: nil))
        //            self.present(alert, animated: true, completion: nil)
        //        }
        if word.text == "" || hiragana.text == "" || meaning.text == "" || lesson.text == "" {
            let alert = UIAlertController(title: "Chú ý", message: "Điền đầy đủ thông tin", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "はい", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            //            if  word.text != "" && meaning.text != "" &&  hiragana.text != "" && listWord.count < maxWord
        } else   {
            guard let lessonDate = lesson.text?.toDate() else { return }
            if Lesson.checkExistLesson(date: lessonDate, type: ClassType.japanese) == false {
                Lesson.insertNewLesson(date: lessonDate, type: ClassType.japanese )
            }
            Kanji.insertNewWord(word: word.text!, meaning: meaning.text!, example: example.text ?? "", hiragana: hiragana.text!, lessonDate: lessonDate)
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
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
