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
        let tempPos = CGPoint(x: el.frame.origin.x, y: el.frame.origin.y)
        el.frame.origin = CGPoint(x: el.frame.origin.x, y: el.superview!.frame.height)
        
        UIView.animateWithDuration(1, delay: 0.8, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            el.frame.origin = tempPos
            //self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func picAnimate(img:UIView, ball:UIView){
        var imgTemp = img.transform
        
        UIView.animateWithDuration(0.7, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            
            var x = img.center.x
            var y = img.center.y
            let transform = CGAffineTransformMakeRotation(CGFloat(M_PI_4))
            img.transform = transform

        }, completion:{ (value: Bool) in
            UIView.animateWithDuration(0.2, delay: 0.0, options: nil, animations: {
                let transform2 = CGAffineTransformMakeRotation(-CGFloat(M_PI_4))
                img.transform = transform2
                ball.frame.origin = CGPoint(x: ball.superview!.frame.width, y: 0)
                
            }, completion:{ (value: Bool) in
                
                UIView.animateWithDuration(0.2, delay: 0.0, options: nil, animations: {
                    img.transform = imgTemp
                }, completion: nil)
            
            })
        })
    }
    
    func insertBlurView (view: UIView, style: UIBlurEffectStyle) {
        view.backgroundColor = UIColor.clearColor()
        
        var blurEffect = UIBlurEffect(style: style)
        var blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        view.insertSubview(blurEffectView, atIndex: 0)
    }
    
    
    
}
