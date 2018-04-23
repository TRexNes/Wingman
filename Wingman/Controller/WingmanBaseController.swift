//
//  WingmanBaseController.swift
//  Wingman
//
//  Created by Rex Nesbit on 1/20/18.
//  Copyright © 2018 Rex Nesbit. All rights reserved.
//

import UIKit

class WingmanBaseController: UIViewController {

    //MARK:- Outlets and Variables
    let optionButtonHeight : CGFloat = ((DeviceType.IS_IPAD == true) ? 70.0 : (DeviceType.IS_IPHONE_5 ? 35.0 : 40.0))
    let questionLabelTop   : CGFloat = ((DeviceType.IS_IPAD == true) ? 100.0 : (DeviceType.IS_IPHONE_5 ? 30.0 : 30.0))
    let titleLabelTop      : CGFloat = ((DeviceType.IS_IPAD == true) ? 100.0 : (DeviceType.IS_IPHONE_5 ? 30.0 : 30.0))

    //Return let & right Padding for Question & Options
    var leftRightPadding : CGFloat {
        
        if DeviceType.IS_IPAD {
            
            if DeviceType.IS_IPAD_PRO_9_7 {
                return 150.0
            }
            else if DeviceType.IS_IPAD_PRO_10_5 {
                return 180.0
            }
            else if DeviceType.IS_IPAD_PRO_12_9 {
                return 220.0
            }
        }
        else {
            
            if DeviceType.IS_IPHONE_5 {
                return 50.0
            }
            else if DeviceType.IS_IPHONE_6 || DeviceType.IS_IPHONE_X {
               return 60.0
            }
            else {
                return 70.0
            }
        }
        return 0.0
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK:- Get BarButtonItem
    
    /***********************************
     * Helper methods
     *
     * Get BarButtonItem instance
     * Adding into header
     *
     ***********************************/
    
    func setBackButton(title: String, image itemImage: UIImage?, target: Any, selector: Selector) -> UIBarButtonItem {
        
        let backButton = UIButton(type: .custom)
        
        backButton.frame = CGRect(x: 0, y: 0, width: 70.0, height: 30)
        backButton.addTarget(target, action: selector, for: .touchDown)
        backButton.titleLabel?.font = UIFont.systemFont(ofSize: 16.0, weight: .medium)
        backButton.setTitleColor(choiceButtonTextColor, for: .normal)
        backButton.setTitle(title, for: .normal)
        
        if itemImage != nil {
            backButton.setImage(itemImage!, for: .normal)
        }
        
        backButton.contentVerticalAlignment = .center
        backButton.contentHorizontalAlignment = .left
        backButton.isMultipleTouchEnabled = false
        backButton.isExclusiveTouch = true
        
        //Create a Bar
        let barBackItem = UIBarButtonItem(customView: backButton)
        barBackItem.tintColor = UIColor.black
        
        return barBackItem
    }
    
    //MARK:- Create Question Label

    /******************************************
     * Helper Methods
     * Create a Label instance
     * Add all property for Label
     * Set up for question
     ******************************************/
    
    func createQuestionLabel(withText text: String) -> UILabel {
        
        let font = UIFont.systemFont(ofSize: questionLabelFontSize, weight: .regular)
        let width = ScreenSize.SCREEN_WIDTH - (self.leftRightPadding + self.leftRightPadding)
        let height = self.heightForLabel(text: text, font: font, width: width)
        
        let label:UILabel = UILabel(frame: CGRect(x: self.leftRightPadding, y: questionLabelTop, width: width, height: height))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        label.textColor = blackColor
        label.backgroundColor = clearColor
        label.tag = 111
        
        return label
    }
    
    //MARK:- Create Question Option
    
    /******************************************
     * Helper Methods
     *
     * Create a UIButton instance
     * Add all property for Button
     * Set up for choice
     ******************************************/
    
    func createOption(option: String, tag: Int, yCord: CGFloat, selector: Selector) -> UIButton {
        
        let button = OptionButton(frame: CGRect(x: self.leftRightPadding, y: yCord, width: ScreenSize.SCREEN_WIDTH - (self.leftRightPadding + self.leftRightPadding), height: optionButtonHeight))
        button.backgroundColor = choiceButtonBackGoundColor
        button.setTitleColor(choiceButtonTextColor, for: .normal)
        button.titleLabel?.font  = UIFont.systemFont(ofSize: choiceButtonFontSize, weight: .light)
        button.setTitle(option, for: .normal)
        button.contentMode = .center
        button.tag = tag
        button.addTarget(self, action: selector, for: .touchUpInside)
        button.isHidden = false
        button.isSelected = false
        button.layer.cornerRadius = 3.0
        
        return button
    }

    
    //MARK:- Create Question Next Button
    
    /******************************************
     * Helper Methods
     *
     * Create a UIButton instance
     * Add all property for Button
     * Set-up for Next Question
     ******************************************/
    
    func createNextButton(title: String, tag: Int, yCord: CGFloat, selector: Selector) -> UIButton {
        
        let button = UIButton(frame: CGRect(x: self.leftRightPadding, y: yCord, width: ScreenSize.SCREEN_WIDTH - (self.leftRightPadding + self.leftRightPadding), height: optionButtonHeight))
        button.backgroundColor = UIColor(red: 0.18, green: 0.18, blue: 0.18, alpha: 1.0)
        button.setTitleColor(whiteColor, for: .normal)
        button.titleLabel?.font  = UIFont.systemFont(ofSize: choiceButtonFontSize, weight: .medium)
        button.setTitle(title, for: .normal)
        button.contentMode = .center
        button.addTarget(self, action: selector, for: .touchUpInside)
        button.isHidden = false
        button.layer.cornerRadius = 3.0

        return button
    }

    
    //MARK:- Get height, Width, Size
    
    /***********************************
     * Helper methods
     *
     * Get height for label based on text
     * Get width for label based on text
     * Get size for label based on text
     ***********************************/
    
    //Get Label Height
    func heightForLabel(text: String, font: UIFont, width: CGFloat) -> CGFloat {
        
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        
        return label.frame.height
    }

    //Get Label Size
    func sizeForLabel(text: String, font: UIFont) -> CGSize {
        
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        
        return label.frame.size
    }
    
    //Get Label Width
    func widthForLabel(text:String, font: UIFont, height: CGFloat) -> CGFloat {
        
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: CGFloat.greatestFiniteMagnitude, height: height))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        
        return label.frame.width
    }

    //MARK:- Get Default Height of View
    
    /***********************************
     * Helper methods
     *
     * Get View height acconding screen
     * minus header & footer height
     *
     *                 iPhone-x      Other iPhone
     Header height       88.0            64.0
     Footer Height       34.0             0.0
     
     ***********************************/
    
    func defaultViewHeight() -> CGFloat {
        
        return ScreenSize.SCREEN_HEIGHT - defaultHeaderHeight - defaultFooterHeight
    }
    
    //MARK:- Show Alert
    
    /***********************************
     * Helper methods
     *
     * Display Alert if no date found
     *
     ***********************************/
    
    func showAlertNoDataAlert() {
        
        UIAlertController.showAlertWithTitle("Alert", message: "No story found!!", alertButtonTitles: ["OK"], alertButtonStyles: [.cancel], vc: self) { (index) in
            
            appDelegate.removeDateData()
            self.initilizeDate()
        }
    }
    
    
    /***********************************
     * Helper methods
     *
     * Display Alert if for return home screen
     *
     ***********************************/
    func showRetrunHomeAlert() {
     
        UIAlertController.showAlertWithTitle("Alert", message: "Are you sure you want to return home?", alertButtonTitles: ["YES","NO"], alertButtonStyles: [.default,.cancel], vc: self) { (index) in
            
            if index == 0 {
                
                appDelegate.removeDateData()
                self.initilizeDate()
            }
        }
    }
    
    /***********************************
     * Helper methods
     *
     * Display Alert if for return home screen
     * Make Date Init
     *
     ***********************************/
    func initilizeDate() {
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .transitionCrossDissolve, animations: {
            
            let navigationController = mainStoryBoard.instantiateViewController(withIdentifier: "WMQuestionNavigation") as! UINavigationController
            appDelegate.window?.rootViewController = navigationController
            appDelegate.window!.makeKeyAndVisible()
            
        }, completion: nil)
    }
}


/***********************************
 * Helper class
 *
 * Override Button Property
 * Change backgroundColor and TitleColor based on button selected
 *
 ***********************************/

class OptionButton: UIButton
{
    override var isSelected: Bool
        {
        get {
            return super.isSelected
        }
        set(newBool)
        {
            if newBool == true
            {
                super.backgroundColor = choiceButtonTextColor
                super.setTitleColor(choiceButtonBackGoundColor, for: .normal)
            }
            else {
                
                super.backgroundColor = choiceButtonBackGoundColor
                super.setTitleColor(choiceButtonTextColor, for: .normal)
            }
        }
    }
}


/***********************************
 * Helper class
 *
 * Override UIAlertController
 *
 ***********************************/

extension UIAlertController {
    
    static func showAlertWithTitle(_ title: String, message: String, alertButtonTitles: [String], alertButtonStyles: [UIAlertActionStyle], vc: UIViewController, completion: @escaping (Int) -> Void) -> Void
    {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        for title in alertButtonTitles {
            
            let actionObj = UIAlertAction(title: title, style: alertButtonStyles[alertButtonTitles.index(of: title)!], handler: { action in
                
                completion(alertButtonTitles.index(of: action.title!)!)
            })
            
            alertController.addAction(actionObj)
        }
        
        vc.present(alertController, animated: true, completion: nil)
    }
}


