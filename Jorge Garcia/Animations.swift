//
//  Animations.swift
//  Jorge Garcia
//
//  Created by Jorge Henrique P. Garcia on 4/16/15.
//  Copyright (c) 2015 Jorge Henrique P. Garcia. All rights reserved.
//

import UIKit
import AVFoundation

class Animations: NSObject {
    
    var playerLayer = AVPlayerLayer()
   
    /** Add dynamic animation to background view  */
    func motionBackground (view: UIView, qtd: Int){
        
        let horizontalMotionEffect =
                    UIInterpolatingMotionEffect(keyPath: "center.x", type: .TiltAlongHorizontalAxis)
        horizontalMotionEffect.minimumRelativeValue = -qtd
        horizontalMotionEffect.maximumRelativeValue = qtd
        
//        let inclinationY = UIInterpolatingMotionEffect(keyPath: "transform.rotation.y", type: .TiltAlongHorizontalAxis)
//        inclinationY.minimumRelativeValue = (2 * M_PI)
//        inclinationY.maximumRelativeValue = -(2 * M_PI)
        
        let verticalMotionEffect =
                    UIInterpolatingMotionEffect(keyPath: "center.y", type: .TiltAlongVerticalAxis)
        verticalMotionEffect.minimumRelativeValue = -qtd
        verticalMotionEffect.maximumRelativeValue = qtd
        
        let motionEffectGroup = UIMotionEffectGroup()
//        motionEffectGroup.motionEffects = [horizontalMotionEffect, verticalMotionEffect, inclinationY]
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
            //el.layer.cornerRadius = 0
            //self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func picAnimate(img:UIView, ball:UIView, funcao:()->() ){
        var imgTemp = img.transform
        
        UIView.animateWithDuration(0.7, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
    
            var x = img.center.x
            var y = img.center.y
            img.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_4))

        }, completion:{ (value: Bool) in
            UIView.animateWithDuration(0.2, delay: 0.0, options: nil, animations: {
                img.transform = CGAffineTransformMakeRotation(-CGFloat(M_PI_4))
                ball.center = CGPoint(x: ball.superview!.frame.width, y: -60)
                
            }, completion:{ (value: Bool) in
                
                UIView.animateWithDuration(0.2, delay: 0.0, options: nil, animations: {
                    img.transform = imgTemp
                }, completion: { (value:Bool) in
                    funcao()
                })
            })
        })
    }
    
    func insertBlurView (view: UIView, style: UIBlurEffectStyle) {  //Not in use
        view.backgroundColor = UIColor.clearColor()
        
        var blurEffect = UIBlurEffect(style: style)
        var blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        view.insertSubview(blurEffectView, atIndex: 0)
    }
    
    func popBubble(view:UIView){
        //Construir
    }
    
    func backgroundVideo (name:String, type:String, width:CGFloat, height:CGFloat) -> AVPlayerLayer{
        
        let moviePath: String = NSBundle.mainBundle().pathForResource(name, ofType: type)!
        let urlVideo = NSURL(fileURLWithPath: moviePath)
        playerLayer = AVPlayerLayer(player: AVPlayer(URL: urlVideo))
        
        playerLayer.frame = CGRect(x: 0, y: 20, width: width, height: height)
        //self.view.layer.insertSublayer(playerLayer, atIndex: 0) //Send to back
        playerLayer.player.play()
        
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: "replayBackground:",
            name: AVPlayerItemDidPlayToEndTimeNotification,
            object: playerLayer.player.currentItem)
        
        return playerLayer
    }
    
    func replayBackground(notification: NSNotification){
        playerLayer.player.currentItem.seekToTime(kCMTimeZero)
        playerLayer.player.play()
    }
    
    
}
