//
//  QuestionsPage.swift
//  Wingman
//
//  Created by Rex Nesbit on 3/17/18.
//  Copyright © 2018 Rex Nesbit. All rights reserved.
//

//import Foundation
//
//class Qage {
//    
//    let currentQuestions : Questions
//    
//    typealias Choice = (title: String, qage: Qage)
//
//    var firstChoice: Choice?
//    var secondChoice: Choice?
//    
//    init(questions: Questions) {
//        self.currentQuestions = questions
//    }
//    
//}
//
//
//
///*************************************************************************
// * Helper methods
// *
// * They Will take a title and page as parameters and add a choice to a page
// * instance.
// * They Will also add choice indicating which story to go to next and provied a
// * title for buttons
// *************************************************************************/
//extension Qage {
//    
//    //method overloading to create instance of new page passing in story, then calls in other func
//    func addChoiceWith(title: String, questions: Questions) -> Qage {
//        
//        let qage = Qage(questions: questions)
//        return addChoiceWith(title: title, qage: qage)
//    }
//    
//    // After adding the choice, returns the instance of page that added this new page to--(allows to chain pages)
//    func addChoiceWith(title: String, qage: Qage) -> Qage {
//        
//        switch (firstChoice, secondChoice) {
//        case (.some, .some): return self
//        case (.none, .none), (.none, .some): firstChoice = (title, qage)
//        case (.some, .none): secondChoice = (title, qage)
//        }
//        
//        return qage
//    }
//}

/*********************

/*******************************************************
 * Wrapper struct to construct a story.
 * I am using the struct to intialize the view controller with a
 * single static computed property to return story we are using.
 
 
 ******************************************************/

/********************************************
 * All the infomation in this struct are
 * placeholders and my date stories will
 * replace them.
 *******************************************/

struct Romantic {
    static var story: Qage {
        let weather = Qage(questions: .weather)
        //rest of the story has two choices
        let money = weather.addChoiceWith(title: "Stop and Investigate", story: .touchDown)
        let homeward = returnTrip.addChoiceWith(title: "Continue home to Earth", story: .homeward)
        let rover = touchdown.addChoiceWith(title: "Explore the Rover", story: .rover)
        let crate = touchdown.addChoiceWith(title: "Open the Crate", story: .crate)
        
        homeward.addChoiceWith(title: "Head back to Mars", page: touchdown)
        let home = homeward.addChoiceWith(title: "Continue Home to Earth", story: .home)
        
        
        return returnTrip
    }
}

/********************************************
 * All the infomation in this struct are
 * placeholders and my date stories will
 * replace them.
 *******************************************/

struct Active {
    static var story: Qage {
        let returnTrip = Qage(story: .returnTrip)
       
        
        return returnTrip
    }
}

/********************************************
 * All the infomation in this struct are
 * placeholders and my date stories will
 * replace them.
 *******************************************/

struct Relaxed {
    static var story: Page {
        let returnTrip = Page(story: .returnTrip)
        
        
        return returnTrip
    }
}
 ********************/
