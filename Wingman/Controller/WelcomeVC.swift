//
//  ViewController.swift
//  Wingman
//
//  Created by Rex Nesbit on 12/11/17.
//  Copyright © 2017 Rex Nesbit. All rights reserved.
//

import UIKit

class WelcomeVC: WingmanBaseController {

    //MARK:- Outlet & Variables
    
    @IBOutlet weak var getStartedButton: UIButton!
    @IBOutlet weak var planningDateLabel: UILabel!
    
    //MARK:- View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        //Set Font 
        self.getStartedButton.titleLabel?.font = UIFont.systemFont(ofSize: getStartedButtonFontSize, weight: .light); getStartedButton.backgroundColor = whiteColor
        self.planningDateLabel.font = UIFont.systemFont(ofSize: planningDateLabelFontSize, weight: .light)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}



