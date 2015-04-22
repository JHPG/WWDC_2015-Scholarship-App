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
    @IBOutlet weak var btnOrange: UIButton!
    @IBOutlet weak var btnCyan: UIButton!
    @IBOutlet weak var btnBlue: UIButton!
    @IBOutlet weak var foto: UIImageView!
    @IBOutlet weak var ball: UIImageView!
    
    var flag: Bool = true
    let animation: Animations = Animations()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //btiOSSkills.frame.origin.y = 200
        
        //Add dynamic animation to button
        animation.motionBackground (btiOSSkills, qtd:40)
        animation.motionBackground (btnCyan, qtd:42)
        animation.motionBackground (btnOrange, qtd:45)
        animation.motionBackground (btnBlue, qtd:48)
        
        foto.layer.borderWidth = 1
        foto.layer.cornerRadius = foto.frame.size.width/2   //Photo in circle frame
        foto.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if (flag){  //Animate only the first time
            animation.bubble (btiOSSkills)
            animation.bubble (btnOrange)
            animation.bubble (btnBlue)
            animation.bubble (btnCyan)
            //
            flag = false
        }
        
        animation.picAnimate(foto, ball: ball);
    }
    
    
    @IBAction func btiOS(sender: AnyObject) {
//        self.performSegueWithIdentifier("detailSegue", sender: sender)
//        btn = "ios"
        
        var view = PageViewController(  image:UIImage(named:"xcode"),
            titleLabel:"Dev Skills",
            //backColor:UIColor(red: 155/255, green: 89/255, blue: 182/255, alpha: 1),
            backColor:UIColor(red: 230/255, green: 126/255, blue:34/255, alpha: 1),
            contents: [UIImage(named: "ios")!,
                UIImage(named: "java")!,
                UIImage(named: "web")!,
                UIImage(named: "dotNet")!
            ])
        showViewController(view, sender: nil)
        
    }
    
    @IBAction func btCyan(sender: AnyObject) {
        
        var view = PageViewController(  image:UIImage(named:"garageBand"),
            titleLabel:"Hobbies",
            //backColor:UIColor(red: 26/255, green: 188/255, blue:156/255, alpha: 1),
            backColor:UIColor(red: 155/255, green: 89/255, blue: 182/255, alpha: 1),
            
            contents: [UIImage(named: "guitar")!,
                UIImage(named: "games")!,
                UIImage(named: "reading")!,
                UIImage(named: "swimming")!
            ])
        showViewController(view, sender: nil)
    }
    
    @IBAction func btOrange(sender: AnyObject) {
        
        var view = PageViewController(  image:UIImage(named:"itunesU"),
            titleLabel:"Academic",
            //backColor:UIColor(red: 230/255, green: 126/255, blue:34/255, alpha: 1),
            backColor:UIColor(red: 52/255, green: 152/255, blue:219/255, alpha: 1),
            
            contents: [UIImage(named: "highSchool2")!,
                UIImage(named: "college")!
            ])
        showViewController(view, sender: nil)
    }
    
    @IBAction func btBlue(sender: AnyObject) {
        
        var view = PageViewController (image:UIImage(named:"work"),
            titleLabel:"Professional",
            //backColor:UIColor(red: 52/255, green: 152/255, blue:219/255, alpha: 1),
            backColor:UIColor(red: 26/255, green: 188/255, blue:156/255, alpha: 1),
            contents: [UIImage(named: "creci")!,
                UIImage(named: "mack")!
            ])
        showViewController(view, sender: nil)
    }
    
    
    
    
    
    
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        
//        if(btn == btn){
//            var view = SkillsViewController();
//            
//            view.imgBackground.image = UIImage(named:"xCode_icon")
//            view.titleLabel.text = "iOS Skills"
//            view.view.backgroundColor = UIColor(red: 205/255, green: 20/255, blue: 100/255, alpha: 1)
//            view.contents = [UIImage(named: "Skills_mapkit")!,
//                UIImage(named: "bubble")!
//            ]
//
//        }
//    }
    
    
  
    
}



