//
//  Animations.swift
//  Jorge Garcia
//
//  Created by Jorge Henrique P. Garcia on 4/16/15.
//  Copyright (c) 2015 Jorge Henrique P. Garcia. All rights reserved.
//

import UIKit

class Animations: NSObject {
   
    /** Add dynamic animation to background view  */
    func motionBackground (view: UIView, qtd: Int){
        
        let horizontalMotionEffect =
                    UIInterpolatingMotionEffect(keyPath: "center.x", type: .TiltAlongHorizontalAxis)
        horizontalMotionEffect.minimumRelativeValue = -qtd
        horizontalMotionEffect.maximumRelativeValue = qtd
        
        let verticalMotionEffect =
                    UIInterpolatingMotionEffect(keyPath: "center.y", type: .TiltAlongVerticalAxis)
        verticalMotionEffect.minimumRelativeValue = -qtd
        verticalMotionEffect.maximumRelativeValue = qtd
        
        let motionEffectGroup = UIMotionEffectGroup()
        motionEffectGroup.motionEffects = [horizontalMotionEffect, verticalMotionEffect]
        
        view.addMotionEffect(motionEffectGroup)
    }
    
    func slideToRight (el: UIView){
        
        let temp:CGPoint = CGPoint(x: el.frame.origin.x, y: el.frame.origin.x)
        el.frame.origin = CGPoint(x: 0, y: el.frame.origin.y)
        
        UIView.animateWithDuration(0.7, delay: 0.1, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            el.frame.origin = temp
            
            //self.view.layoutIfNeeded()
            }, completion: nil)
    }
    
    func bubble (el: UIView){
        el.frame.origin = CGPoint(x: el.frame.origin.x, y: el.superview!.frame.height)
        
        UIView.animateWithDuration(1, delay: 0.7, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            el.frame.origin = CGPoint(x: el.frame.origin.x, y: el.frame.origin.x)
            //self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    
}
