//
//  UiViewControllerExt.swift
//  Core-date
//
//  Created by aunogarafat on 5/26/18.
//  Copyright © 2018 aunogarafat. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentDetail(_viewControllerToPrsent: UIViewController){
        let transition = CATransition()
        transition.duration = 1.0
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        self.view.window?.layer.add(transition,forKey: kCATransition)
        present(_viewControllerToPrsent,animated: false, completion: nil)
    }
    func prsentSecendarDetail(_ viewControllerToPresent: UIViewController)  {
        let transition = CATransition()
        transition.duration = 1.0
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        guard let presentedViewController = presentedViewController else {
            return
        }
        presentedViewController.dismiss(animated: false) {
            self.view.window?.layer.add(transition,forKey: kCATransition)
            self.present(viewControllerToPresent,animated: false,completion: nil)
        }
        
    }
    func dissMiss() {
        let transition = CATransition()
        transition.duration = 1.0
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        self.view.window?.layer.add(transition, forKey: kCATransition)
        dismiss(animated: false, completion: nil)
        
    }
}
