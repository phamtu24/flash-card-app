//
//  Extension.swift
//  Flash Card App
//
//  Created by Pham Tu on 5/10/20.
//  Copyright © 2020 Tu Pham. All rights reserved.
//

import Foundation

extension NSDate {
    func toString() -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: self as Date)
    }
    
}

extension String {
    func toDate() -> NSDate {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.date(from: self)! as NSDate
    }
}
