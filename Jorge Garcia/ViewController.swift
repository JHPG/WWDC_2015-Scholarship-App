//
//  ViewController.swift
//  Jorge Garcia
//
//  Created by Jorge Henrique P. Garcia on 4/15/15.
//  Copyright (c) 2015 Jorge Henrique P. Garcia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btiOSSkills: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
        //Início dos frames
        self.btiOSSkills.frame.origin = CGPoint(x: btiOSSkills.frame.origin.x, y: view.frame.height)
        
        //Animações
        UIView.animateWithDuration(2, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.btiOSSkills.frame.origin = CGPoint(x: self.btiOSSkills.frame.origin.x, y: self.btiOSSkills.frame.origin.x)
            
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

