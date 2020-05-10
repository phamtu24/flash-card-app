//
//  HangulViewController.swift
//  Flash Card App
//
//  Created by Tu Pham on 7/21/19.
//  Copyright © 2019 Tu Pham. All rights reserved.
//

import UIKit

class HangulViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var listWord = [Hangul]()
    @IBOutlet weak var totalPage: UILabel!
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var popUpView: UIView!
    let itemSize: CGFloat = 15
    let innerItemSpacing: CGFloat = 15
    var lessonDate:NSDate?
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .white
        fetchData()
        totalPage.text = "1 / \(listWord.count)"
        // Do any additional setup after loading the view.
    }
    
    
    
    func fetchData() {
        listWord = Hangul.fetchData()
        listWord.shuffle()
        collectionView.reloadData()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width
        let height = collectionView.frame.size.height
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 0
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return CGSize(width: width, height: height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let location = scrollView.panGestureRecognizer.location(in: collectionView)
        guard let indexPath = collectionView.indexPathForItem(at: location) else {return}
        totalPage.text = "\(indexPath.item + 1) / \(listWord.count)"
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listWord.count
    }
    
    func collectionView(_ collectionView1: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView1.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ReuseCell
        cell.frontWord.text = listWord[indexPath.row].word
        cell.behindWord.text = cell.frontWord.text
        cell.meaning.text = listWord[indexPath.row].meaning
        cell.example.text = listWord[indexPath.row].example
        
        return cell
    }
    
    @IBAction func deleteAllWord(_ sender: Any) {
        
        let alert = UIAlertController(title: "Chú ý", message: "Bạn đã chắc chắn học hết từ ?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "はい", style: .default, handler: { (action) in
            Hangul.deleteAll()
            self.listWord.removeAll()
            UIView.animate(withDuration: 0.8, animations: {
                self.popUpView.alpha = 1
            }) { (true) in
                UIView.animateKeyframes(withDuration: 0.8, delay: 1, animations: {
                    self.popUpView.alpha = 0
                })
            }
            self.totalPage.text = "0 / 0"
            self.collectionView.reloadData()
            
        }))
        alert.addAction(UIAlertAction(title: "いいえ", style: .cancel, handler: nil))
        self.present(alert, animated: true)
        
        
    }
    
}
