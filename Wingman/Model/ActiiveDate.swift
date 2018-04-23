//
//  ActiiveDate.swift
//  Wingman
//
//  Created by Rex Nesbit on 02/05/18.
//  Copyright © 2018 Rex Nesbit. All rights reserved.
//

import Foundation

/*************************
 * Helper Class
 *
 * Create a page for Active date
 * They Will take a story
 * instance
 * create also story title and story text
 *
 *******************************/


class ActivePage {
    
    let story     : ActiveStory
    var choiceActionArray = [ActiveStory]()
    var titleText : String
    var questionStory : String
    
    typealias Choice = (title: String, nextStory: ActiveStory)
    
    var firstChoice: Choice?
    var secondChoice: Choice?
    
    init?(story: ActiveStory) {
        
        self.story         = story
        self.titleText     = ""
        self.questionStory = ""
    }
}

/****************************
 * Helper methods
 *
 * Will take a title and page as
 * parameters and add a choice to
 * a page instance. Will also add
 * choice indicating which story
 * to go to next and provied a title for buttons
 * They will also add next story type for perticular choice
 *************************************/

extension ActivePage {
    
    //method overloading to create instance of new page passing in story, then calls in other func
    func addChoiceWith(title: String, story: ActiveStory) -> ActivePage {
        
        let page = ActivePage(story: story)
        return addChoiceWith(title: title, page: page!)
    }
    
    // After adding the choice, returns the instance of page
    func addChoiceWith(title: String, page: ActivePage) -> ActivePage {
        
        switch (page.firstChoice, page.secondChoice) {
        case (.some, .some):
            return self
        case (.none, .none), (.none, .some):
            page.firstChoice = (title, page.choiceActionArray[0])
        case (.some, .none):
            page.secondChoice = (title, page.choiceActionArray[1])
        }
        
        return page
    }
}


/********************************************
 * All the infomation in this active date
 * Under 50, couple, Both
 *******************************************/

enum ActiveStory {
    
    case favoriteOverlook
    case goDip
    case grabBite
    case aboutLove
    case expressLove
    case entertainment
    case shoppingTrip
    case slowDance
    case forSwing
    case international
    case domestic
    case firstChoice
    case youVsMe
    case youVsMe1
    case dessert
    case home
}

/********************************************
 * Set condition which is selected in date option
 * For each date combination need to add all data
 * and create a dictionary for a each date
 * Set all values
 * Story title, story text, story choice(option), next story type
 *******************************************/

/*
 * NOTE: One posible combination is listed below for
 * Date : Active
 * Money : Less than 50$
 * Envirnment : Both (Inside & Outside)
 * Relationship : Were a couple
 *
 * if You want to add more possible combination then you have to follow same step as above listed
 * Add data to Dictionary
 */

extension ActiveStory {
    
    //This contains all information about the story based on page type
    var pageDetails : NSMutableDictionary {
        
        //execute base on your selection date type
        if appDelegate.dateChoiceOption! == (moneyType.lessThan50, envirnmentType.both, relationType.couple) {
            
            let page = NSMutableDictionary() // Page contains one page story details

switch self {
    
case .favoriteOverlook:
                
  page.setValue("Time to enjoy a hike. Head to your favorite overlook or hiking trail. Enjoy the beautiful outdoors then choose the next step", forKey: QuestionKey.storyText.rawValue)
  
  page.setValue("", forKey: QuestionKey.storyTitle.rawValue)
  
  page.setValue(["Go for a dip","Grab a bite"], forKey: QuestionKey.choices.rawValue)
  
  page.setValue([ActiveStory.goDip,ActiveStory.grabBite], forKey: QuestionKey.choiceActions.rawValue)
  
  return page
                
  
case .goDip:
                
    page.setValue("Time to feel refreshed. Go for a swim or relax in a hot tub. Hang out, relax and learn more about each other", forKey: QuestionKey.storyText.rawValue)
    
    page.setValue("Go for a dip", forKey: QuestionKey.storyTitle.rawValue)
    
    page.setValue(["Entertainment","Shopping trip"], forKey: QuestionKey.choices.rawValue)
    
    page.setValue([ActiveStory.entertainment, ActiveStory.shoppingTrip], forKey: QuestionKey.choiceActions.rawValue)
    
    return page
                
    
case .grabBite:
    
    page.setValue("Decide on your favorite place to go out to eat together.\nOn your way there, Learn something new about your date, Swap memories or stories that you have never told eachother before. Once you are there looking at the menu, guess what eachother would order. After eating, If your partner guessed correctly what to would order,they get to pick the next choice. if you guessed correctly what they would order, you choose.", forKey: QuestionKey.storyText.rawValue)
    
    page.setValue("Grab a bite", forKey: QuestionKey.storyTitle.rawValue)
    
    page.setValue(["Learn about love","Express your love"], forKey: QuestionKey.choices.rawValue)
    
    page.setValue([ActiveStory.aboutLove, ActiveStory.expressLove], forKey: QuestionKey.choiceActions.rawValue)
    
    return page
                
    
case .aboutLove:
                
    page.setValue("Find a older romantic couple and ask them if you can interview them. Ask them about love and what they think is the most important things to know and do to have a good relationship.", forKey: QuestionKey.storyText.rawValue)
    
    page.setValue("Learn about love", forKey: QuestionKey.storyTitle.rawValue)
    
    page.setValue(["Slow dance","Go for a swing"], forKey: QuestionKey.choices.rawValue)
    
    page.setValue([ActiveStory.slowDance, ActiveStory.forSwing], forKey: QuestionKey.choiceActions.rawValue)
    
    return page
                
    
case .expressLove:
    
    page.setValue("Go to a quite place and wright love poems about each other. Set a time limit and pick a word that you both have to use in the poems.", forKey: QuestionKey.storyText.rawValue)
    
    page.setValue("Express your love", forKey: QuestionKey.storyTitle.rawValue)
    
    page.setValue(["International","Domestic"], forKey: QuestionKey.choices.rawValue)
    
    page.setValue([ActiveStory.international, ActiveStory.domestic], forKey: QuestionKey.choiceActions.rawValue)
    
    return page
                
    
case .entertainment:
                
    page.setValue("Each of you pick a movie to go see. Play a game of 20 questions to see who gets to choose the movie. After the movie pick the next step.", forKey: QuestionKey.storyText.rawValue)
    
    page.setValue("Entertainment", forKey: QuestionKey.storyTitle.rawValue)
    
    page.setValue(["First choice","You vs Me"], forKey: QuestionKey.choices.rawValue)
    
    page.setValue([ActiveStory.firstChoice, ActiveStory.youVsMe], forKey: QuestionKey.choiceActions.rawValue)
    
    return page
                
    

case .shoppingTrip:
                
    page.setValue("Go to walmart and shop for each other. Split up and set a budget of $5 each. Plan to meet back outside in 15-20 mins.", forKey: QuestionKey.storyText.rawValue)

    page.setValue("Shopping trip", forKey: QuestionKey.storyTitle.rawValue)
    
    page.setValue(["You ve Me","Dessert"], forKey: QuestionKey.choices.rawValue)
    
    page.setValue([ActiveStory.youVsMe1, ActiveStory.dessert], forKey: QuestionKey.choiceActions.rawValue)
    
    return page
                
    
case .slowDance:
    
    page.setValue("Go to a park nearby and dance in the parking lot to some music, talk about your relationship.", forKey: QuestionKey.storyText.rawValue)
    
    page.setValue("Slow dance", forKey: QuestionKey.storyTitle.rawValue)
    
    page.setValue(["Return Home"], forKey: QuestionKey.choices.rawValue)
    
    page.setValue([ActiveStory.home], forKey: QuestionKey.choiceActions.rawValue)
    
    return page
                
    
case .forSwing:
                
    page.setValue("Go to a park that is close by adn talk about relationship goals on the swings.", forKey: QuestionKey.storyText.rawValue)
    
    page.setValue("Go for a swing", forKey: QuestionKey.storyTitle.rawValue)
    
    page.setValue(["Return Home"], forKey: QuestionKey.choices.rawValue)
    
    page.setValue([ActiveStory.home], forKey: QuestionKey.choiceActions.rawValue)
    
    return page
                
    
case .international:
                
    page.setValue("Go back to your home and talk about about where you would each lovel to travel to. Finish by watching a movie based in that country.", forKey: QuestionKey.storyText.rawValue)
    
    page.setValue("International", forKey: QuestionKey.storyTitle.rawValue)
    
    page.setValue(["Return Home"], forKey: QuestionKey.choices.rawValue)
    
    page.setValue([ActiveStory.home], forKey: QuestionKey.choiceActions.rawValue)
    
    return page
                
    
case .domestic:
                
    page.setValue("Go back to your home and talk about each others favorite places in your country. Finish by watching a movie based in your country.", forKey: QuestionKey.storyText.rawValue)
    
    page.setValue("Domestic", forKey: QuestionKey.storyTitle.rawValue)
    
    page.setValue(["Return Home"], forKey: QuestionKey.choices.rawValue)
    
    page.setValue([ActiveStory.home], forKey: QuestionKey.choiceActions.rawValue)
    
    return page
                
    
case .firstChoice:
                
    page.setValue("Go back home and end the night with a romantic candle light picnic on the floor with some ice cream.", forKey: QuestionKey.storyText.rawValue)
    
    page.setValue("Picnic at Home", forKey: QuestionKey.storyTitle.rawValue)
    
    page.setValue(["Return Home"], forKey: QuestionKey.choices.rawValue)
    
    page.setValue([ActiveStory.home], forKey: QuestionKey.choiceActions.rawValue)
    
    return page
                
    
case .youVsMe:
    
    page.setValue("Go back home and end the date by playing some board or cards games together.", forKey: QuestionKey.storyText.rawValue)
    
    page.setValue("You vs Me", forKey: QuestionKey.storyTitle.rawValue)
    
    page.setValue(["Return Home"], forKey: QuestionKey.choices.rawValue)
    
    page.setValue([ActiveStory.home], forKey: QuestionKey.choiceActions.rawValue)
    
    return page
                
    
case .youVsMe1:
                
    page.setValue("Go back home and end the date by playing some board or cards games together.", forKey: QuestionKey.storyText.rawValue)
    
    page.setValue("You vs Me", forKey: QuestionKey.storyTitle.rawValue)
    
    page.setValue(["Return Home"], forKey: QuestionKey.choices.rawValue)
    
    page.setValue([ActiveStory.home], forKey: QuestionKey.choiceActions.rawValue)
    
    return page
                
    
case .dessert:
    
    page.setValue("Go back home and end the night with a romantic candle light picnic on the floor with some ice cream.", forKey: QuestionKey.storyText.rawValue)
    
    page.setValue("Picnic at Home", forKey: QuestionKey.storyTitle.rawValue)
    
    page.setValue(["Return Home"], forKey: QuestionKey.choices.rawValue)
    
    page.setValue([ActiveStory.home], forKey: QuestionKey.choiceActions.rawValue)
    
    return page
                
    
case .home:
                
    page.setValue("", forKey: QuestionKey.storyText.rawValue)
    
    page.setValue("", forKey: QuestionKey.storyTitle.rawValue)
    
    page.setValue([], forKey: QuestionKey.choices.rawValue)
    
    page.setValue([], forKey: QuestionKey.choiceActions.rawValue)
    
    return page
    }
}
        
/****************************
* Add more possible combination with
* different conditions
         
Ex: Your date choice
* Date : Active
* Money : Free
* Envirnment : Inside
* Relationship : first date
         
* Then make like below and append above for if condition
         
else if appDelegate.dateChoiceOption! == (moneyType.lessThan20,
envirnmentType.inside, relationType.firstDate) {
         
put  page data here
}
***********************************/
        
        return NSMutableDictionary() //Return nil if not match conditions
    }
    
}

