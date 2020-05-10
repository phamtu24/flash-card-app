//
//  LanguageCell.swift
//  Flash Card App
//
//  Created by Pham Tu on 5/10/20.
//  Copyright © 2020 Tu Pham. All rights reserved.
//

import UIKit

class LanguageCell: UITableViewCell {
    @IBOutlet weak var imgFlag: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: true)
        self.accessoryType = isSelected ? .checkmark : .none
    }
}
