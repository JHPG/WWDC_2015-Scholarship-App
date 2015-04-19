//
//  PostIt.swift
//  Jorge Garcia
//
//  Created by Jorge Henrique P. Garcia on 4/19/15.
//  Copyright (c) 2015 Jorge Henrique P. Garcia. All rights reserved.
//

import UIKit

class PostIt: UIView {
    
    var content = ""
    
    convenience init(base:UIView) {
        self.init()
        
        self.frame = base.frame                              //
        self.backgroundColor = base.backgroundColor          //
        self.layer.cornerRadius = base.layer.cornerRadius    //
        self.frame.origin = CGPoint(x: 0, y: 0)
        
        base.addSubview (self)
    }
    
    override func drawRect(rect: CGRect) {
        
        
        
    }
    

}
