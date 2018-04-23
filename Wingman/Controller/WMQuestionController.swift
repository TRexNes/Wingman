//
//  WMQuestionController.swift
//  Wingman
//
//  Created by Rex Nesbit on 02/15/18.
//  Copyright © 2018 Rex Nesbit. All rights reserved.
//

import UIKit

class WMQuestionController: WingmanBaseController,UIGestureRecognizerDelegate {
    
    //MARK:- Outlet & Variables
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var questionScrollView: UIScrollView!
    
    var pageQuestionType : WMQuestionStory?
    var pageQuestion : WMQuestionPage?
    var selectedOption : Int?
    var scrollContentViewTag = 11111
    
    //- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
/*****************************************
* Here checking for question type
* if questionType is nil it means we are
* setup all questions for first time
*****************************************/
        
        if pageQuestionType == nil {
            self.pageQuestionType = WMQuestionStory.date
        }
        
        //Initilize question using questionType
        self.questionScrollView.backgroundColor = clearColor
        self.pageQuestion = WMQuestionPage(questions: self.pageQuestionType!)
        
        //Adding Choice for question
        for qes in (self.pageQuestionType?.choiceArray)! {
            
            let choice = WMQuestionPage.addChoiceWith(title: qes as! String, questionPage: self.pageQuestion!)
            self.pageQuestion?.ChoiceArray.append(choice)
        }
        
/************************************
*Helper Methods
*
* Create UI for Question
* Adding all created subview in ScrollView
* which placed in storyboard
* Adding choice for questions
*****************************************/
        
    let questionBaseView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: self.view.frame.width, height: self.defaultViewHeight()))
        questionBaseView.backgroundColor = clearColor
        questionBaseView.tag = scrollContentViewTag
        
    let questionLabel = createQuestionLabel(withText: (self.pageQuestionType?.question)!)
        questionBaseView.addSubview(questionLabel); questionLabel.backgroundColor = whiteColor; questionLabel.textColor = blackColor
        
    //UI constant
    let optionYCoord : CGFloat = questionLabel.frame.origin.y + questionLabel.frame.height
    let space : CGFloat = 50.0
    let optionSpace : CGFloat = ((DeviceType.IS_IPAD == true) ? 30.0 : (DeviceType.IS_IPHONE_5 ? 15.0 : 20.0))
    
    var newYCoord = optionYCoord+space
        
    var ansString = String()
        
    //Check if already answered
    if let value = appDelegate.questionAnswerDictionary["\(self.pageQuestion!.question.questionKey)"] as? String {
            ansString = value
        }
        
    //Create choice button instance
    for index in 0..<(self.pageQuestion?.ChoiceArray)!.count {
            
    let choice = self.pageQuestion?.ChoiceArray[index]
    let button = self.createOption(option:(choice?.title)!, tag: index, yCord: newYCoord, selector: #selector(self.optionButtonAciton(_:)))
            
    newYCoord = newYCoord + optionSpace + self.optionButtonHeight
            
    if (choice?.title)! == ansString {
        button.isSelected = true
        selectedOption = index
            }
            
        questionBaseView.addSubview(button)
        }
        
        newYCoord = newYCoord + 100.0
        
        var nextButtonTitle = String()
        if self.pageQuestionType == WMQuestionStory.relationship {
            nextButtonTitle = "Start Date!"
        }
        else{
            nextButtonTitle = "Next"
        }
        
        let nextButton = self.createNextButton(title: nextButtonTitle, tag: 11, yCord: newYCoord, selector: #selector(self.nextButtonAciton(_:)))
        questionBaseView.addSubview(nextButton)
        
        newYCoord = newYCoord + optionButtonHeight
        
        //Set up for Scrollview content height
        if newYCoord >= self.defaultViewHeight() {
            questionBaseView.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.width, height: newYCoord)
        }
        
        self.questionScrollView.addSubview(questionBaseView)
        self.questionScrollView.isScrollEnabled = true
        self.questionScrollView.contentSize = CGSize(width: ScreenSize.SCREEN_WIDTH, height: questionBaseView.frame.height)
        
        questionBaseView.layoutIfNeeded()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //- Button Actions
    
/******************************************
*
* Choice Button Action
*
******************************************/
    
@objc func optionButtonAciton(_ sender : UIButton) {
        
    if self.selectedOption == nil {
            
        sender.isSelected = true
        }
        else {
            
        let view = self.questionScrollView.viewWithTag(scrollContentViewTag)
            let btn = view?.viewWithTag(self.selectedOption!) as! OptionButton
            btn.isSelected    = false
            sender.isSelected = true
        }
        
        self.selectedOption = sender.tag
        let choice = self.pageQuestion?.ChoiceArray[self.selectedOption!]
        appDelegate.questionAnswerDictionary.setValue(choice!.title, forKey: "\(self.pageQuestion!.question.questionKey)")
    }
    
/******************************************
*
* Next Button Action
* Setup for next question
* store current answer value
*******************************************/
    
    @objc func nextButtonAciton(_ sender : UIButton) {

        if self.selectedOption ==  nil {
            
            let alertController = UIAlertController(title: "Alert", message: "Please select any option", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(cancel)
            self.present(alertController, animated: true, completion: nil)
        }
        else {
            
            if self.pageQuestionType == WMQuestionStory.date {
                appDelegate.date = DateType(rawValue: self.selectedOption!)!
            }
            else if self.pageQuestionType == WMQuestionStory.money {
                appDelegate.money = moneyType(rawValue: self.selectedOption!)!
            }
            else if self.pageQuestionType == WMQuestionStory.environment {
                appDelegate.envirnment = envirnmentType(rawValue: self.selectedOption!)!
            }
            else if self.pageQuestionType == WMQuestionStory.relationship {
                appDelegate.relation = relationType(rawValue: self.selectedOption!)!
            }
            
            let choice = self.pageQuestion?.ChoiceArray[self.selectedOption!]

            if choice?.nextQuestion == WMQuestionStory.end { //Here all questions answered by user..
                
                print(appDelegate.questionAnswerDictionary)
                appDelegate.dateChoiceOption = (appDelegate.money,appDelegate.envirnment,appDelegate.relation) as? SelectedChoice
                
                //Select Date Type according to answers
                if appDelegate.date!.rawValue == 0 {
                    
                    let romanticNavigation = mainStoryBoard.instantiateViewController(withIdentifier: "RomanticNavigation") as! UINavigationController
                    self.present(romanticNavigation, animated: true, completion: nil)
                }
                else if appDelegate.date!.rawValue == 1 {
                    
                    let activeNavigation = mainStoryBoard.instantiateViewController(withIdentifier: "ActiveNavigation") as! UINavigationController
                    self.present(activeNavigation, animated: true, completion: nil)
                }
                else if appDelegate.date!.rawValue == 2 {
                    
                    let relaxedNavigation = mainStoryBoard.instantiateViewController(withIdentifier: "RelaxedNavigation") as! UINavigationController
                    self.navigationController?.present(relaxedNavigation, animated: true, completion: nil)
                }
            }
            else {
                
                self.navigation((choice?.nextQuestion)!)
            }
        }
    }
    
    //- Screen Navigation
    
/******************************************
*
- navigation to next question page
*
******************************************/
    func navigation(_ choice: WMQuestionStory) {
        
        print("Selected Choice: \(choice)")
        
        let questionController = mainStoryBoard.instantiateViewController(withIdentifier: "WMQuestionController") as! WMQuestionController
        questionController.pageQuestionType = choice
        self.navigationController?.pushViewController(questionController, animated: true)
    }
}

//- ====== SETUP QUESTION TYPE FOR DATE =======
enum WMQuestionStory: Int {
    
    //Date Question type
    case date = 0
    case money
    case environment
    case relationship
    case end      //Just for knowing all question end.
}

/********************************************
 * Questions asked to user
 *******************************************/

extension WMQuestionStory {
    
    //Return question string
    var question: String {
        
        switch self {
        case .date:
            return "What type of date would you like?"
        case .money:
            return "How much money would you like to spend?"
        case .environment:
            return "Where would you like the date to be?"
        case .relationship:
            return "What is your relationship status?"
        case .end:
            return ""
        }
    }
    
    //Return choice Array to setup choice for question
    var choiceArray : NSArray {
        
        switch self {
        case .date:
            return ["Romantic","Active","Relaxed"]
        case .money:
            return ["Under $50", "Under $20", "Free"]
        case .environment:
            return ["Inside", "Outside", "Both"]
        case .relationship:
            return ["We're a couple", "First date", "Second date", "Third date or More"]
        case .end:
            return [""]
        }
    }
    
    //Return next question type
    var nextQuestion : WMQuestionStory {
        
        switch self {
        case .date:
            return .money
        case .money:
            return .environment
        case .environment:
            return .relationship
        case .relationship:
            return .end
        case .end:
            return .end
        }
    }
    
    //Returning key for storing answer
    var questionKey : String {
        
        switch self {
            
        case .date:
            return "Date"
        case .money:
            return "Money"
        case .environment:
            return "Environment"
        case .relationship:
            return "Relationship"
        case .end:
            return "End"
        }
    }
}


//- ====  SETUP FOR QUESTION AND CHOICE ====
class WMQuestionPage {
    
    let question : WMQuestionStory
    typealias Choice = (title: String, nextQuestion: WMQuestionStory)
    
    var ChoiceArray = [Choice]()
    
    init(questions: WMQuestionStory) {
        self.question = questions
    }
}

/**********************************
 * Helper methods
 *
 * They Will take a title and page as parameters
 * and add a choice to a page instance.
 * They Will also add choice indicating which
 * question to go to next and provied a
 * title for buttons
 *******************************************/

extension WMQuestionPage {
    
    class func addChoiceWith(title: String, questionPage: WMQuestionPage) -> WMQuestionPage.Choice {
        
        let choice = (title, questionPage.question.nextQuestion)
        return choice
    }
}



