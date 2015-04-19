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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewHeight = view.bounds.height
        let viewWidth = view.bounds.width
        view.backgroundColor = UIColor.whiteColor()
        
        //Fundo
        let imgPos = CGRect(x: viewWidth-200, y: viewHeight-360, width:450, height:418) //Trocar depois
        imgBackground.frame = imgPos
        imgBackground.image = UIImage(named: "xCode_icon")  //trocar
        view.addSubview(imgBackground)
        
        //LabelTitle
        labelTitle.text = "iOS Skills"
        labelTitle.frame = CGRect(x:20, y:20, width:300, height:100) //Trocar depois
        labelTitle.textColor = UIColor.blackColor()
        labelTitle.font = UIFont(name: "AvenirNext-DemiBold", size: 33)
        view.addSubview(labelTitle)
        
        //btnBack
        let btnBackPos = CGRect(x:20, y: viewHeight-80, width:70, height:50) //Trocar depois
        btnBack.frame = btnBackPos
        btnBack.setTitle("Menu", forState: UIControlState.Normal)
        btnBack.titleLabel!.font = UIFont(name: "Superclarendon", size: 22)
        //btnBack.backgroundColor = UIColor.redColor()
        btnBack.addTarget(self, action: "backPage:", forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(btnBack)
        
        //Post-it
        
        
    }
    
    func backPage(sender:UIButton){
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
