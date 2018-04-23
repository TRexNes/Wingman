//
//  RelaxedDate.swift
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

class RelaxedPage {
    
    let story     : RelaxedStory
    var choiceActionArray = [RelaxedStory]()
    var titleText : String
    var questionStory : String
    
    typealias Choice = (title: String, nextStory: RelaxedStory)
    
    var firstChoice: Choice?
    var secondChoice: Choice?
    
    init?(story: RelaxedStory) {
        
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

extension RelaxedPage {
    
    //method overloading to create instance of new page passing in story, then calls in other func
    func addChoiceWith(title: String, story: RelaxedStory) -> RelaxedPage {
        
        let page = RelaxedPage(story: story)
        return addChoiceWith(title: title, page: page!)
    }
    
    // After adding the choice, returns the instance of page
    func addChoiceWith(title: String, page: RelaxedPage) -> RelaxedPage {
        
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
 * All the infomation in this relaxed date
 * Under 50, couple, Both
 *******************************************/

enum RelaxedStory {
    
    case favoriteStore
    case picnicPark
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
    case home //for checking purpose all page end
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
 * Date : Relaxed
 * Money : Less than 50$
 * Envirnment : Both (Inside & Outside)
 * Relationship : Were a couple
 *
 * if You want to add more possible combination then you have to follow same step as above listed
 * Add data to Dictionary
 */

extension RelaxedStory {
    
    //This contains all information about the story based on page type
    var pageDetails : NSMutableDictionary {
        
        //execute base on your selection date type
        if appDelegate.dateChoiceOption! == (moneyType.lessThan50, envirnmentType.both, relationType.couple) {
            
            let page = NSMutableDictionary()
            
switch self {

case .favoriteStore:
    
    page.setValue("Go to the mall and walk around doing some window shopping. Go to your favorite store and your dates favorite store.", forKey: QuestionKey.storyText.rawValue)
    
    page.setValue("", forKey: QuestionKey.storyTitle.rawValue)
    
    page.setValue(["Picnic in the park","Grab a bite"], forKey: QuestionKey.choices.rawValue)
    
    page.setValue([RelaxedStory.picnicPark,RelaxedStory.grabBite], forKey: QuestionKey.choiceActions.rawValue)
    
    return page
                
    
case .picnicPark:
                
    page.setValue("On your way to a nearby park, stop and get some food from your favorite takeout. Enjoy the outdoors and fresh air. set up your picnic and relax under a tree.", forKey: QuestionKey.storyText.rawValue)
    
    page.setValue("Picnic in the park", forKey: QuestionKey.storyTitle.rawValue)
    
    page.setValue(["Entertainment","Shopping trip"], forKey: QuestionKey.choices.rawValue)
    
    page.setValue([RelaxedStory.entertainment, RelaxedStory.shoppingTrip], forKey: QuestionKey.choiceActions.rawValue)
    
    return page
                
    
case .grabBite:
    
    page.setValue("Decide on your favorite place to go out to eat together.\nOn your way there, Learn something new about your date, Swap memories or stories that you have never told eachother before. Once you are there looking at the menu, guess what eachother would order. After eating, If your partner guessed correctly what to would order,they get to pick the next choice. if you guessed correctly what they would order, you choose.", forKey: QuestionKey.storyText.rawValue)
    
    page.setValue("Grab a bite", forKey: QuestionKey.storyTitle.rawValue)
    
    page.setValue(["Learn about love","Express your love"], forKey: QuestionKey.choices.rawValue)
    
    page.setValue([RelaxedStory.aboutLove, RelaxedStory.expressLove], forKey: QuestionKey.choiceActions.rawValue)
    
    return page
                
    
case .aboutLove:
                
    page.setValue("Find a older romantic couple and ask them if you can interview them. Ask them about love and what they think is the most important things to know and do to have a good relationship.", forKey: QuestionKey.storyText.rawValue)
    
    page.setValue("Learn about love", forKey: QuestionKey.storyTitle.rawValue)
    
    page.setValue(["Slow dance","Go for a swing"], forKey: QuestionKey.choices.rawValue)
    
    page.setValue([RelaxedStory.slowDance, RelaxedStory.forSwing], forKey: QuestionKey.choiceActions.rawValue)
    
    return page
                
    
case .expressLove:
    
    page.setValue("Go to a quite place and wright love poems about each other. Set a time limit and pick a word that you both have to use in the poems.", forKey: QuestionKey.storyText.rawValue)
    
    page.setValue("Express your love", forKey: QuestionKey.storyTitle.rawValue)
    
    page.setValue(["International","Domestic"], forKey: QuestionKey.choices.rawValue)
    
    page.setValue([RelaxedStory.international, RelaxedStory.domestic], forKey: QuestionKey.choiceActions.rawValue)
    
    return page
                
    
case .entertainment:
                
    page.setValue("Each of you pick a movie to go see. Play a game of 20 questions to see who gets to choose the movie. After the movie pick the next step.", forKey: QuestionKey.storyText.rawValue)
    
    page.setValue("Entertainment", forKey: QuestionKey.storyTitle.rawValue)
    
    page.setValue(["First choice","You vs Me"], forKey: QuestionKey.choices.rawValue)
    
    page.setValue([RelaxedStory.firstChoice, RelaxedStory.youVsMe], forKey: QuestionKey.choiceActions.rawValue)
    
    return page
                
    
case .shoppingTrip:
                
    page.setValue("Go to walmart and shop for each other. Split up and set a budget of $5 each. Plan to meet back outside in 15-20 mins.", forKey: QuestionKey.storyText.rawValue)
    
    page.setValue("Shopping trip", forKey: QuestionKey.storyTitle.rawValue)
    
    page.setValue(["You ve Me","Dessert"], forKey: QuestionKey.choices.rawValue)
    
    page.setValue([RelaxedStory.youVsMe1, RelaxedStory.dessert], forKey: QuestionKey.choiceActions.rawValue)
    
    return page
                
    
case .slowDance:
                
    page.setValue("Go to a park nearby and dance in the parking lot to some music, talk about your relationship.", forKey: QuestionKey.storyText.rawValue)
    
    page.setValue("Slow dance", forKey: QuestionKey.storyTitle.rawValue)
    
    page.setValue(["Return Home"], forKey: QuestionKey.choices.rawValue)
    
    page.setValue([RelaxedStory.home], forKey: QuestionKey.choiceActions.rawValue)
    
    return page
                
    
case .forSwing:
                
    page.setValue("Go to a park that is close by adn talk about relationship goals on the swings.", forKey: QuestionKey.storyText.rawValue)
    
    page.setValue("Go for a swing", forKey: QuestionKey.storyTitle.rawValue)
    
    page.setValue(["Return Home"], forKey: QuestionKey.choices.rawValue)
    
    page.setValue([RelaxedStory.home], forKey: QuestionKey.choiceActions.rawValue)
    
    return page
                
    
case .international:
                
    page.setValue("Go back to your home and talk about about where you would each lovel to travel to. Finish by watching a movie based in that country.", forKey: QuestionKey.storyText.rawValue)
    
    page.setValue("International", forKey: QuestionKey.storyTitle.rawValue)
    
    page.setValue(["Return Home"], forKey: QuestionKey.choices.rawValue)
    
    page.setValue([RelaxedStory.home], forKey: QuestionKey.choiceActions.rawValue)
    
    return page
                
    
case .domestic:
                
    page.setValue("Go back to your home and talk about each others favorite places in your country. Finish by watching a movie based in your country.", forKey: QuestionKey.storyText.rawValue)
    
    page.setValue("Domestic", forKey: QuestionKey.storyTitle.rawValue)
    
    page.setValue(["Return Home"], forKey: QuestionKey.choices.rawValue)
    
    page.setValue([RelaxedStory.home], forKey: QuestionKey.choiceActions.rawValue)
    
    return page
                
    
case .firstChoice:
                
    page.setValue("Go back home and end the night with a romantic candle light picnic on the floor with some ice cream.", forKey: QuestionKey.storyText.rawValue)
    
    page.setValue("Picnic at Home", forKey: QuestionKey.storyTitle.rawValue)
    
    page.setValue(["Return Home"], forKey: QuestionKey.choices.rawValue)
    
    page.setValue([RelaxedStory.home], forKey: QuestionKey.choiceActions.rawValue)
    
    return page
                
    
case .youVsMe:
                
    page.setValue("Go back home and end the date by playing some board or cards games together.", forKey: QuestionKey.storyText.rawValue)
    
    page.setValue("You vs Me", forKey: QuestionKey.storyTitle.rawValue)
    
    page.setValue(["Return Home"], forKey: QuestionKey.choices.rawValue)
    
    page.setValue([RelaxedStory.home], forKey: QuestionKey.choiceActions.rawValue)
    
    return page
                
    
case .youVsMe1:
                

    page.setValue("Go back home and end the date by playing some board or cards games together.", forKey: QuestionKey.storyText.rawValue)
    
    page.setValue("You vs Me", forKey: QuestionKey.storyTitle.rawValue)
    
    page.setValue(["Return Home"], forKey: QuestionKey.choices.rawValue)
    
    page.setValue([RelaxedStory.home], forKey: QuestionKey.choiceActions.rawValue)
    
    return page
                
    
case .dessert:
                
    page.setValue("Go back home and end the night with a romantic candle light picnic on the floor with some ice cream.", forKey: QuestionKey.storyText.rawValue)
    
    page.setValue("Picnic at Home", forKey: QuestionKey.storyTitle.rawValue)
    
    page.setValue(["Return Home"], forKey: QuestionKey.choices.rawValue)
    
    page.setValue([RelaxedStory.home], forKey: QuestionKey.choiceActions.rawValue)
    
    return page
                
    
case .home:
                
    page.setValue("", forKey: QuestionKey.storyText.rawValue)
    
    page.setValue("", forKey: QuestionKey.storyTitle.rawValue)
    
    page.setValue([], forKey: QuestionKey.choices.rawValue)
    
    page.setValue([], forKey: QuestionKey.choiceActions.rawValue)
    
    return page
            }
        }
        
        /*Here add more possible combination as per your requirement whith proper condition
         
         Ex: Your date choice
         * Date : Relaxed
         * Money : Free
         * Envirnment : Inside
         * Relationship : first date
         
         then make like below and append above if condition
         
         else if appDelegate.dateChoiceOption! == (moneyType.free, envirnmentType.inside, relationType.firstDate) {
         
         put your page data here
         }
         
         */
        
        return NSMutableDictionary() //Return nil if not match conditions
    }
    
}

