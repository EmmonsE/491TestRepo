//
//  UIViewExtensions.swift
//  491TestRepo
//
//  Created by Emily Emmons on 12/4/18.
//  Copyright © 2018 Emily Emmons. All rights reserved.
//

import UIKit

extension UIView {

    func slideInFromRight(_ duration: TimeInterval = 1.0, completionDelegate: CAAnimationDelegate? = nil) {

        let slideInFromRightTransition = CATransition()
        
        if let delegate: CAAnimationDelegate = completionDelegate {
            slideInFromRightTransition.delegate = delegate
        }
        
        slideInFromRightTransition.type = kCATransitionPush
        slideInFromRightTransition.subtype = kCATransitionFromRight
        slideInFromRightTransition.duration = duration
        slideInFromRightTransition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        slideInFromRightTransition.fillMode = kCAFillModeRemoved
        
        self.layer.add(slideInFromRightTransition, forKey: "slideInFromRightTransition")
    }

}
