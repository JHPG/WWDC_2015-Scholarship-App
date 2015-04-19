//
//  PostIt.swift
//  Jorge Garcia
//
//  Created by Jorge Henrique P. Garcia on 4/19/15.
//  Copyright (c) 2015 Jorge Henrique P. Garcia. All rights reserved.
//

import UIKit

class PostIt: UIView {
    
    let animations = Animations()
    var content = UIImageView()
    var base:UIView!
    
    convenience init(base:UIView, newContent:UIImage) {
        self.init()
        
        self.frame = base.frame                              //
        self.backgroundColor = base.backgroundColor          //
        self.layer.cornerRadius = base.layer.cornerRadius    //
        self.frame.origin = CGPoint(x: 0, y: 0)
        
        content.image = newContent
        content.frame = CGRect(x: 20, y: 20, width: self.frame.width-65, height: self.frame.height-40)
        content.center = self.center
        content.autoresizingMask = UIViewAutoresizing()
        self.addSubview(content)
        
        base.addSubview (self)
    }
    
    override func drawRect(rect: CGRect) {
        
    }
    
    func addNextPostIt (base:UIView){
        
        UIView.transitionWithView(base, duration: 0.6, options: UIViewAnimationOptions.TransitionCurlUp, animations: {
            //views.frontView.removeFromSuperview()         // remove the front object...
            
            base.addSubview (self)
            
            }, completion: { finished in
        })
    }
    
    func addPreviousPostIt (base:UIView){
        
        UIView.transitionWithView(base, duration: 0.6, options: UIViewAnimationOptions.TransitionCurlDown, animations: {
            //views.frontView.removeFromSuperview()         // remove the front object...
            
            base.addSubview (self)
            
            }, completion: { finished in
        })
    }

    
    
    //Add a setContent(UIImage)
}
