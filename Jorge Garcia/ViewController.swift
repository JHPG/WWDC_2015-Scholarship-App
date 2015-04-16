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
    var flag: Bool = true
    var animation: Animations = Animations()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if (flag){  //Animate only the first time
            animation.bubble (btiOSSkills)
            //
            flag = false
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

