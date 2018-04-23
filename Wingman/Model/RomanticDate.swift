//
//  RomanticDate.swift
//  Wingman
//
//  Created by Rex Nesbit on 02/04/18.
//  Copyright © 2018 Rex Nesbit. All rights reserved.
//

import Foundation

typealias SelectedChoice = (money: moneyType, envirnment: envirnmentType, relation: relationType)

/**********************************
 * Helper Class
 *
 * Creates a page for Romantic date
 * Will take a story instance
 * also creates story title and story text
 ****************************************/

class RomanticPage {
    
    let story     : RomanticStory
    var choiceActionArray = [RomanticStory]()
    var titleText : String
    var questionStory : String
    
    typealias Choice = (title: String, nextStory: RomanticStory)

    var firstChoice: Choice?
    var secondChoice: Choice?
    
    
    init?(story: RomanticStory) {

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


extension RomanticPage {
    
    //method overloading to create instance of new page passing in story, then calls in other func
    func addChoiceWith(title: String, story: RomanticStory) -> RomanticPage {

        let page = RomanticPage(story: story)
        return addChoiceWith(title: title, page: page!)
    }
    
    // After adding the choice, returns the instance of pag
    func addChoiceWith(title: String, page: RomanticPage) -> RomanticPage {
        
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
 * All the infomation in this romantic date
 * UNDER 50, couple,inside
 *******************************************/

enum RomanticStory {
    
    case favoriteDate
    case differntFavorites
    case sameFavorite
    case aboutLove
    case expressLove
    case entertainment
    case shoppingTrip
    case slowDance
    case forSwing
    case international
    case domestic
    case homePicnic
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

/*****************************
 * NOTE: One posible combination is listed below for
 * Date : Romantic
 * Money : Less than $50
 * Envirnment : Inside
 * Relationship : Were a couple
 *
 * To add more possible combinations, need to follow
 * same steps as above listed, Add data to Dictionary
 **************************/

extension RomanticStory {
    
//This contains all information about the story based on page type
  var pageDetails : NSMutableDictionary {

//execute pass on user selection date type
if appDelegate.dateChoiceOption! == (moneyType.lessThan50, envirnmentType.inside, relationType.couple) {
           
    let page = NSMutableDictionary() // Page contains one page story details

switch self {
    
case .favoriteDate:
                
    page.setValue("Talk to each other about your favorite dates you have had together.\nDo you share the same favorite date?",forKey: QuestionKey.storyText.rawValue)

    page.setValue("", forKey: QuestionKey.storyTitle.rawValue)

    page.setValue(["Same Favorite Date","Different Favorites"], forKey: QuestionKey.choices.rawValue)

    page.setValue([RomanticStory.sameFavorite,
               RomanticStory.differntFavorites], forKey: QuestionKey.choiceActions.rawValue)

    return page
                
    
case .differntFavorites:
                
    page.setValue("Decide on your favorite place to go out to eat together. On your way there, Learn something new about your date. Swap memories or stories that you have never told eachother before. Once you are there looking at the menu, guess what eachother would order. After eating, If your partner guessed correctly what to would order,they get to pick the next choice. if you guessed correctly what they would order, you choose.",
        forKey: QuestionKey.storyText.rawValue)
    
    page.setValue("Different Favorites", forKey: QuestionKey.storyTitle.rawValue)
    
    page.setValue(["Learn About Love","Express Your Love"], forKey: QuestionKey.choices.rawValue)
    
    page.setValue([RomanticStory.aboutLove, RomanticStory.expressLove], forKey: QuestionKey.choiceActions.rawValue)
    
    return page
                
    
case .sameFavorite:
                
    page.setValue("Decide on your favorite place to go out to eat together. On your way there, talk about the other favorite things you have in common.\nOnce you are there looking at the menu, guess what eachother would order. After eating, If your partner guessed correctly what to would order,they get to pick the next choice. if you guessed correctly what they would order, you choose.",
        forKey: QuestionKey.storyText.rawValue)
    
    page.setValue("Same Favorite", forKey: QuestionKey.storyTitle.rawValue)
    
    page.setValue(["Entertainment","Shopping Trip"], forKey: QuestionKey.choices.rawValue)
    
    page.setValue([RomanticStory.entertainment, RomanticStory.shoppingTrip], forKey: QuestionKey.choiceActions.rawValue)
    
    return page
                
    
case .aboutLove:
                
    page.setValue("Find a older romantic couple and ask them if you can interview them.\nAsk them about love and what they think is the most important things to know and do to have a good relationship. After speaking to them, talk about what you both think is important in a relationship",
        forKey: QuestionKey.storyText.rawValue)
    
    page.setValue("Learn About Love", forKey: QuestionKey.storyTitle.rawValue)
    
    page.setValue(["Slow Dance","Go For A Swing"], forKey: QuestionKey.choices.rawValue)

    page.setValue([RomanticStory.slowDance, RomanticStory.forSwing], forKey: QuestionKey.choiceActions.rawValue)
    
    return page
                

case .expressLove:
                
    page.setValue("Go to a quite place and wright love poems about each other. Set a time limit and pick a word that you both have to use in the poems.", forKey: QuestionKey.storyText.rawValue)
    
    page.setValue("Express Your Love", forKey: QuestionKey.storyTitle.rawValue)
    
    page.setValue(["International","Domestic"], forKey: QuestionKey.choices.rawValue)
    
    page.setValue([RomanticStory.international, RomanticStory.domestic], forKey: QuestionKey.choiceActions.rawValue)
    
    return page
                
    
case .entertainment:
                
    page.setValue("Each of you pick a movie to go see. Play a game of 20 questions to see who gets to choose the moive. When the movie is over, pick the next step from the choices below.",
        forKey: QuestionKey.storyText.rawValue)
    
    page.setValue("Entertainment", forKey: QuestionKey.storyTitle.rawValue)
    
    page.setValue(["First Choice","You vs Me"], forKey: QuestionKey.choices.rawValue)
    
    page.setValue([RomanticStory.homePicnic, RomanticStory.youVsMe], forKey: QuestionKey.choiceActions.rawValue)
    
    return page
                
    
case .shoppingTrip:
                
    page.setValue("Go to Walmart and shop for each other. Split up and set a budget of $5 each. Plan to meet back outside in 15-20 mins.", forKey: QuestionKey.storyText.rawValue)
    
    page.setValue("Shopping Trip", forKey: QuestionKey.storyTitle.rawValue)
    
    page.setValue(["You ve Me","Dessert"], forKey: QuestionKey.choices.rawValue)
    
    page.setValue([RomanticStory.youVsMe1, RomanticStory.dessert], forKey: QuestionKey.choiceActions.rawValue)
    
    return page
                

case .slowDance:
                
    page.setValue("Go to a park nearby and dance in the parking lot to some music from your car. During or after dancing, talk about your relationship goals.", forKey: QuestionKey.storyText.rawValue)
    
    page.setValue("Slow Dance", forKey: QuestionKey.storyTitle.rawValue)
    
    page.setValue(["Return Home"], forKey: QuestionKey.choices.rawValue)
    
    page.setValue([RomanticStory.home], forKey: QuestionKey.choiceActions.rawValue)
    
    return page
                

case .forSwing:
                
    page.setValue("Go to a park that is close by and talk about relationship goals on the swings.", forKey: QuestionKey.storyText.rawValue)
    
    page.setValue("Go For A Swing", forKey: QuestionKey.storyTitle.rawValue)
    
    page.setValue(["Return Home"], forKey: QuestionKey.choices.rawValue)
    
    page.setValue([RomanticStory.home], forKey: QuestionKey.choiceActions.rawValue)
    
    return page
                

case .international:
                
    page.setValue("Go back to your home and talk about about where you would each love to travel to. Finish by watching a movie based in that country.", forKey: QuestionKey.storyText.rawValue)

    page.setValue("International", forKey: QuestionKey.storyTitle.rawValue)
    
    page.setValue(["Return Home"], forKey: QuestionKey.choices.rawValue)
    
    page.setValue([RomanticStory.home], forKey: QuestionKey.choiceActions.rawValue)
    
    return page
                

case .domestic:
    
    page.setValue("Go back to your home and talk about each others favorite places in your home country. Finish by watching a movie based in your country.", forKey: QuestionKey.storyText.rawValue)
    
    page.setValue("Domestic", forKey: QuestionKey.storyTitle.rawValue)
    
    page.setValue(["Return Home"], forKey: QuestionKey.choices.rawValue)
    
    page.setValue([RomanticStory.home], forKey: QuestionKey.choiceActions.rawValue)
    
    return page
                

case .homePicnic:
                
    page.setValue("Go back home and end the night with a romantic candle light picnic on the floor with some ice cream.", forKey: QuestionKey.storyText.rawValue)
    
    page.setValue("Picnic at Home", forKey: QuestionKey.storyTitle.rawValue)
    
    page.setValue(["Return Home"], forKey: QuestionKey.choices.rawValue)
    
    page.setValue([RomanticStory.home], forKey: QuestionKey.choiceActions.rawValue)
    
    return page
                
    
case .youVsMe:
                
    page.setValue("Go back home and end the date by playing some board or cards games together.", forKey: QuestionKey.storyText.rawValue)
    
    page.setValue("You vs Me", forKey: QuestionKey.storyTitle.rawValue)
    
    page.setValue(["Return Home"], forKey: QuestionKey.choices.rawValue)
    
    page.setValue([RomanticStory.home], forKey: QuestionKey.choiceActions.rawValue)
    
    return page
                
    
case .youVsMe1:
                
    page.setValue("Go back home and end the date by playing some board or cards games together.", forKey: QuestionKey.storyText.rawValue)
    
    page.setValue("You vs Me", forKey: QuestionKey.storyTitle.rawValue)
    
    page.setValue(["Return Home"], forKey: QuestionKey.choices.rawValue)
    
    page.setValue([RomanticStory.home], forKey: QuestionKey.choiceActions.rawValue)
    
    return page
                
    
case .dessert:
    
    page.setValue("Go back home and end the night with a romantic candle light picnic on the floor with some ice cream.", forKey: QuestionKey.storyText.rawValue)
    
    page.setValue("Picnic at Home", forKey: QuestionKey.storyTitle.rawValue)
    
    page.setValue(["Return Home"], forKey: QuestionKey.choices.rawValue)
    
    page.setValue([RomanticStory.home], forKey: QuestionKey.choiceActions.rawValue)
    
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
*
* Ex: Your date choice
* Date : Romantic
* Money : Less than 20$
* Envirnment : Inside
* Relationship : first date
*
* Then make like below and append above for if condition
***********************************/
    
    else if appDelegate.dateChoiceOption! == (moneyType.lessThan50, envirnmentType.inside, relationType.firstDate) {
    
    //put page data here
    let page = NSMutableDictionary() // Page contains one page story details
    
    switch self {
        
    case .favoriteDate:
        
        page.setValue("Get to Know each other by asking questions about each others families, sibling, ages, parents professions, where's home? ect. Do you share any similarities?",forKey: QuestionKey.storyText.rawValue)
        
        page.setValue("", forKey: QuestionKey.storyTitle.rawValue)
        
        page.setValue(["We Share Similarities","No Similarities"], forKey: QuestionKey.choices.rawValue)
        
        page.setValue([RomanticStory.sameFavorite,
                       RomanticStory.differntFavorites], forKey: QuestionKey.choiceActions.rawValue)
        
        return page
        
        
    case .differntFavorites:
        
        page.setValue("Decide on a place to go out to eat together. On your way there, Learn something new about your date. Swap memories or stories that you have never told eachother before. Once you are there looking at the menu, guess what eachother would order. After eating, If your partner guessed correctly what to would order,they get to pick the next choice. if you guessed correctly what they would order, you choose.",
                      forKey: QuestionKey.storyText.rawValue)
        
        page.setValue("New Favorites", forKey: QuestionKey.storyTitle.rawValue)
        
        page.setValue(["Learn About Love","Express Your Love"], forKey: QuestionKey.choices.rawValue)
        
        page.setValue([RomanticStory.aboutLove, RomanticStory.expressLove], forKey: QuestionKey.choiceActions.rawValue)
        
        return page
        
        
    case .sameFavorite:
        
        page.setValue("Decide on a place to go out to eat together. On your way there, talk about the other favorite things you have in common.\nOnce you are there looking at the menu, guess what eachother would order. After eating, If your partner guessed correctly what to would order,they get to pick the next choice. if you guessed correctly what they would order, you choose.",
                      forKey: QuestionKey.storyText.rawValue)
        
        page.setValue("More Similarities?", forKey: QuestionKey.storyTitle.rawValue)
        
        page.setValue(["Entertainment","Shopping Trip"], forKey: QuestionKey.choices.rawValue)
        
        page.setValue([RomanticStory.entertainment, RomanticStory.shoppingTrip], forKey: QuestionKey.choiceActions.rawValue)
        
        return page
        
        
    case .aboutLove:
        
        page.setValue("Find a older romantic couple and ask them if you can interview them.\nAsk them about love and what they think is the most important things to know and do to have a good relationship. After speaking to them, talk about what you both think is important in a relationship",
                      forKey: QuestionKey.storyText.rawValue)
        
        page.setValue("Learn About Love", forKey: QuestionKey.storyTitle.rawValue)
        
        page.setValue(["Slow Dance","Go For A Swing"], forKey: QuestionKey.choices.rawValue)
        
        page.setValue([RomanticStory.slowDance, RomanticStory.forSwing], forKey: QuestionKey.choiceActions.rawValue)
        
        return page
        
        
    case .expressLove:
        
        page.setValue("Go to a quite place and wright love poems about each other. Set a time limit and pick a word that you both have to use in the poems.", forKey: QuestionKey.storyText.rawValue)
        
        page.setValue("Express Your Love", forKey: QuestionKey.storyTitle.rawValue)
        
        page.setValue(["International","Domestic"], forKey: QuestionKey.choices.rawValue)
        
        page.setValue([RomanticStory.international, RomanticStory.domestic], forKey: QuestionKey.choiceActions.rawValue)
        
        return page
        
        
    case .entertainment:
        
        page.setValue("Each of you pick a movie to go see. Play a game of 20 questions to see who gets to choose the moive. When the movie is over, pick the next step from the choices below.",
                      forKey: QuestionKey.storyText.rawValue)
        
        page.setValue("Entertainment", forKey: QuestionKey.storyTitle.rawValue)
        
        page.setValue(["First Choice","You vs Me"], forKey: QuestionKey.choices.rawValue)
        
        page.setValue([RomanticStory.homePicnic, RomanticStory.youVsMe], forKey: QuestionKey.choiceActions.rawValue)
        
        return page
        
        
    case .shoppingTrip:
        
        page.setValue("Go to Walmart and shop for each other. Split up and set a budget of $5 each. Plan to meet back outside in 15-20 mins.", forKey: QuestionKey.storyText.rawValue)
        
        page.setValue("Shopping Trip", forKey: QuestionKey.storyTitle.rawValue)
        
        page.setValue(["You ve Me","Dessert"], forKey: QuestionKey.choices.rawValue)
        
        page.setValue([RomanticStory.youVsMe1, RomanticStory.dessert], forKey: QuestionKey.choiceActions.rawValue)
        
        return page
        
        
    case .slowDance:
        
        page.setValue("Go to a park nearby and dance in the parking lot to some music from your car. During or after dancing, talk about your relationship goals.", forKey: QuestionKey.storyText.rawValue)
        
        page.setValue("Slow Dance", forKey: QuestionKey.storyTitle.rawValue)
        
        page.setValue(["Return Home"], forKey: QuestionKey.choices.rawValue)
        
        page.setValue([RomanticStory.home], forKey: QuestionKey.choiceActions.rawValue)
        
        return page
        
        
    case .forSwing:
        
        page.setValue("Go to a park that is close by and talk about relationship goals on the swings.", forKey: QuestionKey.storyText.rawValue)
        
        page.setValue("Go For A Swing", forKey: QuestionKey.storyTitle.rawValue)
        
        page.setValue(["Return Home"], forKey: QuestionKey.choices.rawValue)
        
        page.setValue([RomanticStory.home], forKey: QuestionKey.choiceActions.rawValue)
        
        return page
        
        
    case .international:
        
        page.setValue("Go back to your home and talk about about where you would each love to travel to. Finish by watching a movie based in that country.", forKey: QuestionKey.storyText.rawValue)
        
        page.setValue("International", forKey: QuestionKey.storyTitle.rawValue)
        
        page.setValue(["Return Home"], forKey: QuestionKey.choices.rawValue)
        
        page.setValue([RomanticStory.home], forKey: QuestionKey.choiceActions.rawValue)
        
        return page
        
        
    case .domestic:
        
        page.setValue("Go back to your home and talk about each others favorite places in your home country. Finish by watching a movie based in your country.", forKey: QuestionKey.storyText.rawValue)
        
        page.setValue("Domestic", forKey: QuestionKey.storyTitle.rawValue)
        
        page.setValue(["Return Home"], forKey: QuestionKey.choices.rawValue)
        
        page.setValue([RomanticStory.home], forKey: QuestionKey.choiceActions.rawValue)
        
        return page
        
        
    case .homePicnic:
        
        page.setValue("Go back home and end the night with a romantic candle light picnic on the floor with some ice cream.", forKey: QuestionKey.storyText.rawValue)
        
        page.setValue("Picnic at Home", forKey: QuestionKey.storyTitle.rawValue)
        
        page.setValue(["Return Home"], forKey: QuestionKey.choices.rawValue)
        
        page.setValue([RomanticStory.home], forKey: QuestionKey.choiceActions.rawValue)
        
        return page
        
        
    case .youVsMe:
        
        page.setValue("Go back home and end the date by playing some board or cards games together.", forKey: QuestionKey.storyText.rawValue)
        
        page.setValue("You vs Me", forKey: QuestionKey.storyTitle.rawValue)
        
        page.setValue(["Return Home"], forKey: QuestionKey.choices.rawValue)
        
        page.setValue([RomanticStory.home], forKey: QuestionKey.choiceActions.rawValue)
        
        return page
        
        
    case .youVsMe1:
        
        page.setValue("Go back home and end the date by playing some board or cards games together.", forKey: QuestionKey.storyText.rawValue)
        
        page.setValue("You vs Me", forKey: QuestionKey.storyTitle.rawValue)
        
        page.setValue(["Return Home"], forKey: QuestionKey.choices.rawValue)
        
        page.setValue([RomanticStory.home], forKey: QuestionKey.choiceActions.rawValue)
        
        return page
        
        
    case .dessert:
        
        page.setValue("Go back home and end the night with a romantic candle light picnic on the floor with some ice cream.", forKey: QuestionKey.storyText.rawValue)
        
        page.setValue("Picnic at Home", forKey: QuestionKey.storyTitle.rawValue)
        
        page.setValue(["Return Home"], forKey: QuestionKey.choices.rawValue)
        
        page.setValue([RomanticStory.home], forKey: QuestionKey.choiceActions.rawValue)
        
        return page
        
        
    case .home:
        
        page.setValue("", forKey: QuestionKey.storyText.rawValue)
        
        page.setValue("", forKey: QuestionKey.storyTitle.rawValue)
        
        page.setValue([], forKey: QuestionKey.choices.rawValue)
        
        page.setValue([], forKey: QuestionKey.choiceActions.rawValue)
        
        return page
    }
    
}
    
    
    
    
    
    
        return NSMutableDictionary() //Return nil if not match conditions
    }
}
