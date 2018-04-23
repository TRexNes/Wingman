//
//  RomanticController.swift
//  Wingman
//
//  Created by Rex Nesbit on 3/13/18.
//  Copyright © 2018 Rex Nesbit. All rights reserved.
//

import UIKit

class RomanticController: WingmanBaseController {
    
     //MARK:- Outlet & Variables
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var questionScrollView: UIScrollView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var secondChoiceButton: UIButton!
    @IBOutlet weak var firstChoiceButton: UIButton!
    
    @IBOutlet weak var titleLabelTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var questionStoryTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var firstChoiceButtonHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var secondChoiceButtonHeightConstraint: NSLayoutConstraint!
    
    var isOneChoice = true
    var questionStory : RomanticStory?
    var question : RomanticPage?

    //MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        
/*****************************************
*
* Here checking for Story type
* if Story type is nil it means we are setup all story first time
******************************************/

        
        if questionStory == nil {
            questionStory = RomanticStory.favoriteDate
        }
        
        self.question = RomanticPage(story: self.questionStory!)
        
        //till now we have only one possible combination so that putting validation & Alert if not match combination
        guard let questionDetailsDict = self.questionStory?.pageDetails, questionDetailsDict.count > 0 else {
            
            self.questionScrollView.isHidden = true
            self.showAlertNoDataAlert()
            return
        }

        let choiceArray       = questionDetailsDict.value(forKey: QuestionKey.choices.rawValue) as! [String]
        let choiceActionArray = questionDetailsDict.value(forKey: QuestionKey.choiceActions.rawValue) as! [RomanticStory]
        
        self.question!.titleText     = questionDetailsDict.value(forKey: QuestionKey.storyTitle.rawValue) as! String
        self.question!.questionStory = questionDetailsDict.value(forKey: QuestionKey.storyText.rawValue) as! String
        
        //Set Choice 
        self.question!.firstChoice = (choiceArray[0] ,choiceActionArray[0])
        if choiceArray.count > 1 {
            
            self.isOneChoice = false
            self.question!.secondChoice = (choiceArray[1] ,choiceActionArray[1])
        }
        
        //Set backgroundColor of objects
        self.questionScrollView.backgroundColor  = mainViewBackGoundColor
        self.baseView.backgroundColor            = clearColor
        self.titleLabel.backgroundColor          = clearColor
        self.questionLabel.backgroundColor       = clearColor
        self.firstChoiceButton.backgroundColor   = choiceButtonBackGoundColor
        self.secondChoiceButton.backgroundColor  = choiceButtonBackGoundColor
        
        //Set textcolor of objects
        self.titleLabel.textColor                     = UIColor.black
        self.questionLabel.textColor                  = UIColor.black; self.questionLabel.backgroundColor = whiteColor
        self.firstChoiceButton.titleLabel?.textColor  = choiceButtonTextColor
        self.secondChoiceButton.titleLabel?.textColor = choiceButtonTextColor
        
        //Set font to objects
        self.titleLabel.font                     = UIFont.systemFont(ofSize: questionLabelFontSize+1, weight: .bold)
        self.questionLabel.font                  = UIFont.systemFont(ofSize: questionLabelFontSize, weight: .regular)
        self.firstChoiceButton.titleLabel?.font  = UIFont.systemFont(ofSize: choiceButtonFontSize, weight: .light)
        self.secondChoiceButton.titleLabel?.font = UIFont.systemFont(ofSize: choiceButtonFontSize, weight: .light)
        
        //Set text
        self.titleLabel.text    = self.question!.titleText
        self.questionLabel.text = self.question!.questionStory
        
        //Check Title and set Top Constraint
        if (self.question?.titleText)! == "" {
            
            if DeviceType.IS_IPAD {
                self.questionStoryTopConstraint.constant = questionLabelTop
            }
            else {
                self.questionStoryTopConstraint.constant = 0.0
            }
        }
        else {
            
            self.questionStoryTopConstraint.constant = questionLabelTop
            self.titleLabelTopConstraint.constant = titleLabelTop
        }
        
        self.firstChoiceButton.setTitle((self.question!.firstChoice?.title)!, for: .normal)
        
        //check chice is one or more
        if isOneChoice {
            
            self.secondChoiceButton.setTitle("", for: .normal)
            self.secondChoiceButton.isHidden = true
        }
        else {
            
            self.secondChoiceButton.setTitle((self.question!.secondChoice?.title)!, for: .normal)
            self.secondChoiceButton.isHidden = false
        }
        
        //Set corner radius to button..
        self.firstChoiceButton.layer.cornerRadius  = 3.0
        self.secondChoiceButton.layer.cornerRadius = 3.0

        //Set Choice button height
        self.firstChoiceButtonHeightConstraint.constant = optionButtonHeight
        self.secondChoiceButtonHeightConstraint.constant = optionButtonHeight

        self.view.layoutIfNeeded()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK:- Button Action
    
    //First choice button action
    @IBAction func firstChoiceButtonAction(_ sender: UIButton) {
        
        appDelegate.dateAnswerDictionary.setValue(self.question!.story, forKey: (self.question!.firstChoice?.title)!)
        self.navigation((self.question!.firstChoice?.nextStory)!)
    }
    
    //Second choice button action
    @IBAction func secondChoiceButtonAction(_ sender: UIButton) {
        
        appDelegate.dateAnswerDictionary.setValue(self.question!.story, forKey: (self.question!.firstChoice?.title)!)
        self.navigation((self.question!.secondChoice?.nextStory)!)
    }
    
    //Back button Action
    @objc func backButtonAction() {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    //MARK:- Navigate to next page based on story
    func navigation(_ nextStory: RomanticStory) {
        
        if nextStory == RomanticStory.home {
            
            print("Retutn to Home \n All selected answers : \n")
            
            //All answer of your story
            
            for (key, value) in appDelegate.dateAnswerDictionary {
                
                print("Story -> \(value) : Answer -> \(key)")
            }
            
            self.showRetrunHomeAlert()
        }
        else {
            
            let romanticController = mainStoryBoard.instantiateViewController(withIdentifier: "RomanticController") as! RomanticController
            romanticController.questionStory = nextStory
            self.navigationController?.pushViewController(romanticController, animated: true)
        }
    }

}

