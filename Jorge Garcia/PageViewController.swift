//
//  PageViewController.swift
//  Jorge Garcia
//
//  Created by Jorge Henrique P. Garcia on 4/17/15.
//  Copyright (c) 2015 Jorge Henrique P. Garcia. All rights reserved.
//

import UIKit
import AVFoundation

class PageViewController: UIViewController {
    
    var lbTitle = UILabel()
    var postItView: UIView = UIView()
    var imgBackground = UIImageView()
    var labelTitle = UILabel()
    var btnBack = UIButton.buttonWithType(UIButtonType.System) as! UIButton
    var contents = [UIImage]()
    var contentAtual:Int = 0
    var detailLabel = UILabel()
    var playerLayer: AVPlayerLayer!
    
    let animations:Animations = Animations()
    
    convenience init(image:UIImage!, titleLabel:String, backColor:UIColor, contents: Array<UIImage>) {
        self.init()
        
        labelTitle.text = titleLabel
        imgBackground.image = image
        postItView.backgroundColor = backColor
        self.contents = contents
        detailLabel.text = ""
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawView()
        
        animations.motionBackground(imgBackground, qtd: 40)    //Add dynamic animation to background image
        
        var postIt:PostIt = PostIt(base: postItView, newContent: contents[contentAtual])    //Define the post-it object to receive a new view
        contentAtual++
    }
    
    func drawView(){
        
        let viewHeight = view.bounds.height
        let viewWidth = view.bounds.width
        view.backgroundColor = UIColor.whiteColor()
        //view.userInteractionEnabled = true
        
        //Fundo
        let imgPos = CGRect(x: viewWidth-200, y: viewHeight-360, width:450, height:418) //Trocar depois (x=0,y=0)
        imgBackground.frame = imgPos
        imgBackground.layer.shadowOffset = CGSize(width: -3, height: -3)
        imgBackground.layer.shadowOpacity = 0.5
        imgBackground.layer.shadowRadius = 10.0
        view.addSubview(imgBackground)
        
        //LabelTitle
        labelTitle.frame = CGRect(x:20, y:50, width:300, height:100)
        labelTitle.font = UIFont(name: "AvenirNext-DemiBold", size: 33)
        labelTitle.textColor = UIColor.whiteColor()
        labelTitle.layer.shadowOffset = CGSize(width: 2, height: 2)
        labelTitle.layer.shadowOpacity = 0.9
        labelTitle.layer.shadowRadius = 3.0
        view.addSubview(labelTitle)
        
        //btnBack
        let btnBackPos = CGRect(x:20, y: viewHeight-100, width:100, height:100)
        btnBack.autoresizingMask = UIViewAutoresizing()
        btnBack.frame = btnBackPos
        btnBack.setTitle("Menu", forState: UIControlState.Normal)
        btnBack.titleLabel!.font = UIFont(name: "Superclarendon", size: 22)
        btnBack.addTarget(self, action: "backPage:", forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(btnBack)
        
        //Detail label
        detailLabel.frame = CGRect(x: 65, y: viewHeight-140, width: 200, height: 80)
        detailLabel.numberOfLines = 2
        detailLabel.text = "Touch anywhere to \n switch to next card"
        detailLabel.font = UIFont(name: "AvenirNext-Italic", size: 14)
        //detailLabel.autoresizingMask = UIViewAutoresizing()
        
        view.addSubview(detailLabel)
        
        //Post-it
        postItView.frame = CGRect( x:0, y:labelTitle.viewForBaselineLayout()!.frame.origin.y+30,
            width: 250, height: 300)
        postItView.center = self.view.center;
        postItView.layer.cornerRadius = 30
        postItView.clipsToBounds = true
        postItView.layer.shadowColor = UIColor.blackColor().CGColor
        postItView.layer.shadowOffset = CGSizeMake(4, 4)
        postItView.layer.shadowOpacity = 0.8
        postItView.layer.shadowRadius = 5
        postItView.clipsToBounds = false
        
        view.addSubview(postItView)
        
        playerLayer = animations.backgroundVideo("mov5", type: "mp4", width: self.view.bounds.width, height: self.view.bounds.height)
        self.view.layer.insertSublayer(playerLayer, atIndex: 0) //Send to back
    }
    
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        if(UIDeviceOrientationIsLandscape(UIDevice.currentDevice().orientation)) {
            playerLayer.frame = CGRect(x: 0, y: -500, width: self.view.bounds.width, height: 1200)
        } else {
            playerLayer.frame = CGRect(x: 0, y: 30, width: self.view.bounds.width, height: self.view.bounds.height)
        }
        
        drawView()
    }
    
    func nextPostIt(){
        
        if (contentAtual < contents.count){
            
            var postIt:PostIt = PostIt(base: postItView, newContent: contents[contentAtual])
            postIt.addNextPostIt (postItView)     //Next post-it to present view
            detailLabel.text = postIt.detail
            
            contentAtual++
            if(contentAtual >= contents.count){
                contentAtual=0
            }
        }
    }
    
    func backPage(sender:UIButton){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        nextPostIt()
    }

}
