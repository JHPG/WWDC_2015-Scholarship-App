//
//  iosSkillsViewController.swift
//  Jorge Garcia
//
//  Created by Jorge Henrique P. Garcia on 4/16/15.
//  Copyright (c) 2015 Jorge Henrique P. Garcia. All rights reserved.
//

import UIKit

class iosSkillsViewController: UIViewController {
    
    override func didReceiveMemoryWarning() { super.didReceiveMemoryWarning() }
    
    @IBOutlet weak var imgBackground: UIImageView!
    @IBOutlet weak var postItView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var postIt:UIView = UIView()
    let animations:Animations = Animations()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animations.motionBackground(postItView, qtd: 40)    //Add dynamic animation to background image
        
        postIt = animations.newPostItObject (postItView)    //Define the post-it object to receive a new view
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        //animations.nextPostIt(postIt, base: postItView)     //Next post-it to present view
    }
    
    @IBAction func Voltar(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func nextButton(sender: AnyObject) {
        animations.nextPostIt(postIt, base: postItView)     //Previous post-it to present view
    }
    
    @IBAction func backButton(sender: AnyObject) {
        animations.previousPostIt(postIt, base: postItView)     //Next post-it to present view
    }
    


}
