//
//  PageViewController.swift
//  Jorge Garcia
//
//  Created by Jorge Henrique P. Garcia on 4/17/15.
//  Copyright (c) 2015 Jorge Henrique P. Garcia. All rights reserved.
//

import UIKit

class PageViewController: UIViewController {


    
    var lbTitle = UILabel()
    var postItView: UIView = UIView()
    var postIt: UIView = UIView()
    var imgBackground = UIImageView()
    var labelTitle = UILabel()
    var btnBack = UIButton.buttonWithType(UIButtonType.System) as! UIButton
    
    let animations:Animations = Animations()
    
    convenience init(image:UIImage!, titleLabel:String) {
        self.init()
        
        labelTitle.text = titleLabel
        imgBackground.image = image
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewHeight = view.bounds.height
        let viewWidth = view.bounds.width
        view.backgroundColor = UIColor.whiteColor()
        
        //Fundo
        let imgPos = CGRect(x: viewWidth-200, y: viewHeight-360, width:450, height:418) //Trocar depois (x=0,y=0)
        imgBackground.frame = imgPos
        //imgBackground.image = UIImage(named: "xCode_icon")  //trocar
        view.addSubview(imgBackground)
        
        //LabelTitle
        //labelTitle.text = "iOS Skills"
        labelTitle.frame = CGRect(x:20, y:20, width:300, height:100) //Trocar depois
        labelTitle.textColor = UIColor.blackColor()
        labelTitle.font = UIFont(name: "AvenirNext-DemiBold", size: 33)
        view.addSubview(labelTitle)
        
        //btnBack
        let btnBackPos = CGRect(x:20, y: viewHeight-100, width:100, height:100) //Trocar depois
        btnBack.autoresizingMask = UIViewAutoresizing()
        btnBack.frame = btnBackPos
        btnBack.setTitle("Menu", forState: UIControlState.Normal)
        btnBack.titleLabel!.font = UIFont(name: "Superclarendon", size: 22)
        btnBack.addTarget(self, action: "backPage:", forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(btnBack)
        
        //Post-it
        postItView.frame = CGRect( x:0,
                                   y:labelTitle.viewForBaselineLayout()!.frame.origin.y+100,
                                   width: 250, height: 300)
        postItView.center = self.view.center;
        postItView.backgroundColor = UIColor.purpleColor()
        view.addSubview(postItView)
        
        animations.motionBackground(postItView, qtd: 40)    //Add dynamic animation to background image
        postIt = animations.newPostItObject (postItView)    //Define the post-it object to receive a new view
    }
    
    func backPage(sender:UIButton){
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
