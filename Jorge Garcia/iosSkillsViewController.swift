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
    
    var animacao:Animacao = Animacao()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animacao.motionBackground(imgBackground)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
