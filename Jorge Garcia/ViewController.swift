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
    @IBOutlet weak var btMusic: UIButton!
    
    var flag: Bool = true
    var animation: Animations = Animations()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //btiOSSkills.frame.origin.y = 200
        
        //Add dynamic animation to button
        animation.motionBackground (btiOSSkills, qtd:45)
        animation.motionBackground (btMusic, qtd:42)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if (flag){  //Animate only the first time
            animation.bubble (btiOSSkills)
            animation.bubble (btMusic)
            //
            flag = false
        }
    }
    
    @IBAction func btMusic(sender: AnyObject) {
        
        var mystoryboard = UIStoryboard(name: "Main", bundle: nil)
        var new = mystoryboard.instantiateViewControllerWithIdentifier("page") as! iosSkillsViewController
        //new.titleLabel.text = "ddddd"
        
        
        self.showViewController(new, sender: nil)

        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

