//
//  ReuseCell.swift
//  Flash Card App
//
//  Created by Pham Tu on 5/10/20.
//  Copyright © 2020 Tu Pham. All rights reserved.
//

import UIKit

class ReuseCell : UICollectionViewCell {
    @IBOutlet weak var frontView: UIView!
    @IBOutlet weak var behindView: UIView!
    @IBOutlet weak var behindWord: UILabel!
    @IBOutlet weak var frontWord: UILabel!
    @IBOutlet weak var hiragana: UILabel?
    @IBOutlet weak var meaning: UILabel!
    @IBOutlet weak var example: UILabel!
    var isFlipped = false
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 20
        frontView.layer.cornerRadius = 20
        behindView.layer.cornerRadius = 20
    }
    
    override func prepareForReuse() {
        if isFlipped == true {
            isFlipped = !isFlipped
            
            let cardToFlip = isFlipped ? frontView : behindView
            let bottomCard = isFlipped ? behindView : frontView
            
            UIView.transition(from: cardToFlip!,
                              to: bottomCard!,
                              duration: 0,
                              options: [.transitionFlipFromRight, .showHideTransitionViews],
                              completion: nil)
        }
        
    }
    fileprivate func flip() {
        isFlipped = !isFlipped
        
        let cardToFlip = isFlipped ? frontView : behindView
        let bottomCard = isFlipped ? behindView : frontView
        
        UIView.transition(from: cardToFlip!,
                          to: bottomCard!,
                          duration: 0.5,
                          options: [.transitionFlipFromRight, .showHideTransitionViews],
                          completion: nil)
    }
    
    @IBAction func click(_ sender: Any) {
        flip()
    }
}
