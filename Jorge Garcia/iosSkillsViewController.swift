//
//  iosSkillsViewController.swift
//  Jorge Garcia
//
//  Created by Jorge Henrique P. Garcia on 4/16/15.
//  Copyright (c) 2015 Jorge Henrique P. Garcia. All rights reserved.
//

import UIKit

class iosSkillsViewController: UIViewController {

    @IBOutlet weak var imgBackground: UIImageView!
    //@IBOutlet weak var desc1: UILabel!
    @IBOutlet weak var postItView: UIView!
    
    var postIt:UIView = UIView()
    let animations:Animations = Animations()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animations.motionBackground(self.view)    //Add dynamic animation to background image
        
        postIt = animations.newPostItObject (postItView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        animations.nextPostIt(postIt, base: postItView)
    }
    
    @IBAction func Voltar(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
