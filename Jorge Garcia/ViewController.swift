//
//  ViewController.swift
//  Jorge Garcia
//
//  Created by Jorge Henrique P. Garcia on 4/15/15.
//  Copyright (c) 2015 Jorge Henrique P. Garcia. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var btiOSSkills: UIButton!
    @IBOutlet weak var btnOrange: UIButton!
    @IBOutlet weak var btnCyan: UIButton!
    @IBOutlet weak var btnBlue: UIButton!
    @IBOutlet weak var btnRed: UIButton!
    @IBOutlet weak var foto: UIImageView!
    
    var flag: Bool = true   //Animate only the first time
    let animation: Animations = Animations()
    var playerLayer: AVPlayerLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //btiOSSkills.frame.origin.y = 200
        
        //Add dynamic animation to button
        animation.motionBackground (btiOSSkills, qtd:40)
        animation.motionBackground (btnCyan, qtd:42)
        animation.motionBackground (btnOrange, qtd:45)
        animation.motionBackground (btnBlue, qtd:48)
        animation.motionBackground (btnRed, qtd:50)
        
        foto.layer.borderWidth = 1
        foto.layer.cornerRadius = foto.frame.size.width/2   //Photo with circle frame
        foto.clipsToBounds = true
        foto.layer.shadowOpacity = 0.8
        foto.layer.shadowRadius = 5.0
        
        makeSquare(btnCyan, color: UIColor.cyanColor())
        makeSquare(btnBlue, color: UIColor.blueColor())
        makeSquare(btnOrange, color: UIColor.orangeColor())
        makeSquare(btiOSSkills, color: UIColor.purpleColor())
        makeSquare(btnRed, color: UIColor.redColor())
        
        playerLayer = animation.backgroundVideo("mov5", type: "mp4", width: self.view.bounds.width, height: self.view.bounds.height)
        self.view.layer.insertSublayer(playerLayer, atIndex: 0) //Send to back
    }
    
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        if(UIDeviceOrientationIsLandscape(UIDevice.currentDevice().orientation)) {
            playerLayer.frame = CGRect(x: 0, y: -500, width: self.view.bounds.width, height: 1200)
        } else {
            playerLayer.frame = CGRect(x: 0, y: 30, width: self.view.bounds.width, height: self.view.bounds.height)
        }
    }
    
    func makeSquare(view:UIView, color:UIColor){
        //Color do nothing for a while
        var l = view.layer
        l.shadowOpacity = 0.4
        l.shadowRadius = 5.0
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        playerLayer.player.play()
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
            animation.bubble (btnRed)
            //
            flag = false
        }
        
        //animation.picAnimate(foto, ball: ball){ };
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
        animation.picAnimate(btiOSSkills, ball: btiOSSkills){
            self.showViewController(view, sender: nil)
        }
    }
    
    @IBAction func btCyan(sender: AnyObject) {
        
        var view = PageViewController( image:UIImage(named:"garageBand"),
            titleLabel:"Hobbies",
            //backColor:UIColor(red: 26/255, green: 188/255, blue:156/255, alpha: 1),
            backColor:UIColor(red: 155/255, green: 89/255, blue: 182/255, alpha: 1),
            
            contents: [UIImage(named: "guitar")!,
                UIImage(named: "games")!,
                UIImage(named: "reading")!,
                UIImage(named: "swimming")!
            ])
        
        animation.picAnimate(btnCyan, ball: btnCyan){
            self.showViewController(view, sender: nil)
        };
    }
    
    @IBAction func btOrange(sender: AnyObject) {
        
        var view = PageViewController(  image:UIImage(named:"itunesU"),
            titleLabel:"Academic",
            //backColor:UIColor(red: 230/255, green: 126/255, blue:34/255, alpha: 1),
            backColor:UIColor(red: 52/255, green: 152/255, blue:219/255, alpha: 1),
            
            contents: [UIImage(named: "highSchool2")!,
                UIImage(named: "college")!
            ])
        animation.picAnimate(btnOrange, ball: btnOrange){
            self.showViewController(view, sender: nil)
        }
    }
    
    @IBAction func btBlue(sender: AnyObject) {
        
        var view = PageViewController (image:UIImage(named:"work"),
            titleLabel:"Professional",
            //backColor:UIColor(red: 52/255, green: 152/255, blue:219/255, alpha: 1),
            backColor:UIColor(red: 26/255, green: 188/255, blue:156/255, alpha: 1),
            contents: [UIImage(named: "creci")!,
                UIImage(named: "mack")!
            ])
        animation.picAnimate(btnBlue, ball: btnBlue){
            self.showViewController(view, sender: nil)
        }
    }
    
    @IBAction func btRed(sender: AnyObject) {
        
        var view = PageViewController (image:UIImage(named:"appStore"),
            titleLabel:"Projects",
            backColor:UIColor(red: 135/255, green: 211/255, blue:124/255, alpha: 1),

            contents: [UIImage(named: "imBored")!,
                UIImage(named: "12-8")!,
                UIImage(named: "flashlight")!,
                UIImage(named: "stickman")!,
                UIImage(named: "putsPuts")!
            ])
        animation.picAnimate(btnRed, ball: btnRed){
            self.showViewController(view, sender: nil)
        }
        
    }
    
    
  
    
}



