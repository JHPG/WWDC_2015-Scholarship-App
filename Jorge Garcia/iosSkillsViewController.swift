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
        
        //Post-it begin
            //Shadow
        self.postItView.layer.shadowColor = UIColor.blackColor().CGColor
        self.postItView.layer.shadowOffset = CGSizeMake(5, 5)
        self.postItView.layer.shadowRadius = 5
        self.postItView.layer.shadowOpacity = 0.5
            //Size and color
        self.postIt.frame = self.postItView.frame
        self.postIt.backgroundColor = postItView.backgroundColor
        self.postIt.frame.origin = CGPoint(x: 0, y: 0)
        self.postItView.addSubview (self.postIt)
        //Post-it end
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        //let views = (frontView: self.redSquare, backView: self.blueSquare)
        
        let transitionOptions = UIViewAnimationOptions.TransitionCurlUp  // set a transition style
        
        UIView.transitionWithView(self.postIt, duration: 0.6, options: transitionOptions, animations: {
            // remove the front object...
            //views.frontView.removeFromSuperview()
            
            self.postItView.addSubview (self.postIt)
            
            }, completion: { finished in
        })
    }
    
    @IBAction func Voltar(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidAppear(animated: Bool) {
        //animations.slideToRight(desc1)
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
