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
        
        UIView.animateWithDuration(1, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            
        el.frame.origin = CGPoint(x: el.frame.origin.x, y: el.frame.origin.x)
        
        //self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func newPostItObject(base: UIView) -> UIView {
        //Base config
        base.layer.shadowColor = UIColor.blackColor().CGColor
        base.layer.shadowOffset = CGSizeMake(4, 4)
        base.layer.shadowOpacity = 0.8
        base.layer.shadowRadius = 5
        base.layer.cornerRadius = 30
        //base.layer.borderWidth = 1
        //base.frame.or
        
        var temp:NSCoding
        
        //Size and color
        var new = UIView()
        new.frame = base.frame                              //
        new.backgroundColor = base.backgroundColor          //
        new.layer.cornerRadius = base.layer.cornerRadius    //
        new.frame.origin = CGPoint(x: 0, y: 0)
        
        base.addSubview (new)
        return new;
    }
    
    func nextPostIt (new:UIView, base:UIView){
        
        UIView.transitionWithView(new, duration: 0.6, options: UIViewAnimationOptions.TransitionCurlUp, animations: {
            // remove the front object...
            //views.frontView.removeFromSuperview()
            
            base.addSubview (new)
            
            }, completion: { finished in
        })
    }
    
    func previousPostIt (new:UIView, base:UIView){
        
        UIView.transitionWithView(new, duration: 0.6, options: UIViewAnimationOptions.TransitionCurlDown, animations: {
            // remove the front object...
            //views.frontView.removeFromSuperview()
            
            base.addSubview (new)
            
            }, completion: { finished in
        })
    }
    
    
    
}
