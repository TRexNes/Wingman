//
//  Page.swift
//  Wingman
//
//  Created by Rex Nesbit on 3/7/18.
//  Copyright © 2018 Rex Nesbit. All rights reserved.
//

//import Foundation
//
//class Page {
//    
//    let story: Story
//    
//    typealias Choice = (title: String, page: Page)
//    
//    var firstChoice: Choice?
//    var secondChoice: Choice?
//    
//    init(story: Story) {
//        
//        self.story = story
//    }
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
//
//extension Page {
//    
//    //method overloading to create instance of new page passing in story, then calls in other func
//    func addChoiceWith(title: String, story: Story) -> Page {
//        
//        let page = Page(story: story)
//        return addChoiceWith(title: title, page: page)
//    }
//    
//    // After adding the choice, returns the instance of page that added this new page to--(allows to chain pages)
//    func addChoiceWith(title: String, page: Page) -> Page {
//        
//        switch (firstChoice, secondChoice) {
//        case (.some, .some): return self
//        case (.none, .none), (.none, .some): firstChoice = (title, page)
//        case (.some, .none): secondChoice = (title, page)
//        }
//        
//        return page
//    }
//}
//
//
//
///*******************************************************
// * Wrapper struct to construct a story.
// * I am using the struct to intialize the view controller with a
// * single static computed property to return story we are using.
// 
// 
// ******************************************************/
//
///********************************************
// * All the infomation in this struct are
// * placeholders and my date stories will
// * replace them.
// *******************************************/
//
//struct Romantic {
//    
//    static var story: Page {
//        
//        let returnTrip = Page(story: .returnTrip)
//        
//        //rest of the story has two choices 
//        let touchdown = returnTrip.addChoiceWith(title: "Stop and Investigate", story: .touchDown)
//        let homeward = returnTrip.addChoiceWith(title: "Continue home to Earth", story: .homeward)
//        let rover = touchdown.addChoiceWith(title: "Explore the Rover", story: .rover)
//        let crate = touchdown.addChoiceWith(title: "Open the Crate", story: .crate)
//        
//        homeward.addChoiceWith(title: "Head back to Mars", page: touchdown)
//        let home = homeward.addChoiceWith(title: "Continue Home to Earth", story: .home)
//        
//        let cave = rover.addChoiceWith(title: "Explore the Coordinates", story: .cave)
//        rover.addChoiceWith(title: "Return to Earth", page: home)
//        
//        cave.addChoiceWith(title: "Continue towards faint light", story: .droid)
//        cave.addChoiceWith(title: "Refill the ship and explore the rover", page: rover)
//        
//        crate.addChoiceWith(title: "Explore the Rover", page: rover)
//        crate.addChoiceWith(title: "Use the key", story: .monster)
//        
//        return returnTrip
//    }
//}
//
///********************************************
// * All the infomation in this struct are
// * placeholders and my date stories will
// * replace them.
// *******************************************/
//
//struct Active {
//    
//    static var story: Page {
//        
//        let returnTrip = Page(story: .returnTrip)
//        
//        //rest of the story has two choices
//        let touchdown = returnTrip.addChoiceWith(title: "Stop and Investigate", story: .touchDown)
//        let homeward = returnTrip.addChoiceWith(title: "Continue home to Earth", story: .homeward)
//        let rover = touchdown.addChoiceWith(title: "Explore the Rover", story: .rover)
//        let crate = touchdown.addChoiceWith(title: "Open the Crate", story: .crate)
//        
//        homeward.addChoiceWith(title: "Head back to Mars", page: touchdown)
//        let home = homeward.addChoiceWith(title: "Continue Home to Earth", story: .home)
//        
//        let cave = rover.addChoiceWith(title: "Explore the Coordinates", story: .cave)
//        rover.addChoiceWith(title: "Return to Earth", page: home)
//        
//        cave.addChoiceWith(title: "Continue towards faint light", story: .droid)
//        cave.addChoiceWith(title: "Refill the ship and explore the rover", page: rover)
//        
//        crate.addChoiceWith(title: "Explore the Rover", page: rover)
//        crate.addChoiceWith(title: "Use the key", story: .monster)
//        
//        return returnTrip
//    }
//}
//
///********************************************
// * All the infomation in this struct are
// * placeholders and my date stories will
// * replace them.
// *******************************************/
//
//struct Relaxed {
//    
//    static var story: Page {
//        
//        let returnTrip = Page(story: .returnTrip)
//        
//        //rest of the story has two choices
//        let touchdown = returnTrip.addChoiceWith(title: "Stop and Investigate", story: .touchDown)
//        let homeward = returnTrip.addChoiceWith(title: "Continue home to Earth", story: .homeward)
//        let rover = touchdown.addChoiceWith(title: "Explore the Rover", story: .rover)
//        let crate = touchdown.addChoiceWith(title: "Open the Crate", story: .crate)
//        
//        homeward.addChoiceWith(title: "Head back to Mars", page: touchdown)
//        let home = homeward.addChoiceWith(title: "Continue Home to Earth", story: .home)
//        
//        let cave = rover.addChoiceWith(title: "Explore the Coordinates", story: .cave)
//        rover.addChoiceWith(title: "Return to Earth", page: home)
//        
//        cave.addChoiceWith(title: "Continue towards faint light", story: .droid)
//        cave.addChoiceWith(title: "Refill the ship and explore the rover", page: rover)
//        
//        crate.addChoiceWith(title: "Explore the Rover", page: rover)
//        crate.addChoiceWith(title: "Use the key", story: .monster)
//        
//        return returnTrip
//    }
//}





