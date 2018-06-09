//
//  UIViewExt.swift
//  Core-date
//
//  Created by aunogarafat on 5/26/18.
//  Copyright © 2018 aunogarafat. All rights reserved.
//

import UIKit
extension UIView {
    func bindKeyBoard()  {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)

    }
    @objc func keyboardWillShow(notification: NSNotification) {
        let dusration = notification.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo![UIKeyboardAnimationCurveUserInfoKey] as! UInt
        let startingFrame = (notification.userInfo![UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let enddingFrame = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let deltayY = enddingFrame.origin.y - startingFrame.origin.y
        
        UIView.animateKeyframes(withDuration: dusration, delay: 0.0, options: UIViewKeyframeAnimationOptions(rawValue: curve), animations: {
            self.frame.origin.y += deltayY
        }, completion: nil)
        
    }
    
}
