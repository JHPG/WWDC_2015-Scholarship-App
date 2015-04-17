//
//  iosSkillsViewController.swift
//  Jorge Garcia
//
//  Created by Jorge Henrique P. Garcia on 4/16/15.
//  Copyright (c) 2015 Jorge Henrique P. Garcia. All rights reserved.
//

import UIKit

class iosSkillsViewController: UIViewController {
    
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
    }
    
    
    @IBOutlet weak var imgBackground: UIImageView!
    //@IBOutlet weak var desc1: UILabel!
    @IBOutlet weak var postItView: UIView!
    
    var postIt:UIView = UIView()
    let animations:Animations = Animations()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animations.motionBackground(postItView)    //Add dynamic animation to background image
        animations.motionBackground(imgBackground)
        
        postIt = animations.newPostItObject (postItView)    //Define the post-it object to receive a new view
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        animations.nextPostIt(postIt, base: postItView)     //Next post-it to present
    }
    
    @IBAction func Voltar(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    

}
