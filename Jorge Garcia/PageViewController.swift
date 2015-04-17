//
//  PageViewController.swift
//  Jorge Garcia
//
//  Created by Jorge Henrique P. Garcia on 4/17/15.
//  Copyright (c) 2015 Jorge Henrique P. Garcia. All rights reserved.
//

import UIKit

class PageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewHeight = view.bounds.height
        let viewWidth = view.bounds.width

        var lbTitle = UILabel()
        let imgPos = CGRect(x: viewWidth-200, y: viewHeight+80, width:450, height:418) //Trocar depois
        var imgBackground: UIImageView = UIImageView(frame: imgPos)
        var postItView: UIView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
