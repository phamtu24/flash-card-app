//
//  CircleCollectionViewCell.swift
//  Flash Card App
//
//  Created by Tu Pham on 7/19/19.
//  Copyright © 2019 Tu Pham. All rights reserved.
//



//    func setUpInnerCircle(item: Int) {
//        let indexPath = IndexPath(item: item, section: 0)
//        guard let frameCircle = circleCollectionView.layoutAttributesForItem(at: indexPath)?.frame else {return}
//        let frameCircleInSuperView = circleCollectionView.convert(frameCircle, to: circleCollectionView.superview)
//        innerCircle  = UIView.init(frame: frameCircleInSuperView)
//        innerCircle.backgroundColor = .red
//        innerCircle.layer.cornerRadius = innerCircle.bounds.size.height / 2
//        innerCircle.layer.borderColor = UIColor.gray.cgColor
//        innerCircle.layer.borderWidth = 1
//        mainView.addSubview(innerCircle)
//        innerCircle.alpha = 0
//    }


import UIKit

class CircleCollectionView: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
    var listWord = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return listWord
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CircleCollectionViewCell
        cell.circle.backgroundColor = .white
        cell.circle.layer.borderColor = UIColor.gray.cgColor
        cell.circle.layer.borderWidth = 1
        
        return cell
    }
}

class CircleCollectionViewCell : UICollectionViewCell {
    @IBOutlet weak var circle: UIView!
    override func awakeFromNib() {
        circle.layer.cornerRadius = circle.bounds.size.height / 2
        
    }
}
