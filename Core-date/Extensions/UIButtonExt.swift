//
//  UIButtonExt.swift
//  Core-date
//
//  Created by aunogarafat on 5/26/18.
//  Copyright © 2018 aunogarafat. All rights reserved.
//

import UIKit

extension UIButton {
    func selectedColour() {
        self.backgroundColor = #colorLiteral(red: 0, green: 0.5603182912, blue: 0, alpha: 1)
    }
    func deselectedColour() {
        self.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
    }
}
