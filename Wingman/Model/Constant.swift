//
//  Constant.swift
//  BasicProject
//
//  Created by Rex Nesbit on 5/04/18.
//  Copyright © 2018 AlphaVed. All rights reserved.
//

import Foundation
import UIKit


//****** APP CONSTANT STRING *********
let appDelegate = UIApplication.shared.delegate as! AppDelegate


//********************** COLOR CONSTANT **********************
let blackColor = UIColor.black
let blueColor  = UIColor.blue
let clearColor = UIColor.clear
let whiteColor = UIColor.white
let choiceButtonTextColor = UIColor(red: 0.0/255.0, green: 122.0/255.0, blue: 255.0/255.0, alpha: 1.0)
let choiceButtonBackGoundColor = whiteColor
let mainViewBackGoundColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 1.0)


//*** FONT CONSTANT ***

//Constant Font Size
let questionLabelFontSize : CGFloat = ((DeviceType.IS_IPAD == true) ? 30.0 : (DeviceType.IS_IPHONE_5 ? 17 : 18))

let choiceButtonFontSize: CGFloat = ((DeviceType.IS_IPAD == true) ? 30.0 : (DeviceType.IS_IPHONE_5 ? 16 : 17))

let planningDateLabelFontSize: CGFloat = ((DeviceType.IS_IPAD == true) ? 30.0 : (DeviceType.IS_IPHONE_5 ? 20 : 21))

let getStartedButtonFontSize: CGFloat = ((DeviceType.IS_IPAD == true) ? 30.0 : (DeviceType.IS_IPHONE_5 ? 19 : 20))


//********************** UI CONSTANT **********************

let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
var defaultHeaderHeight: CGFloat = DeviceType.IS_IPHONE_X == true ? 88.0 : 64.0
var defaultFooterHeight: CGFloat = DeviceType.IS_IPHONE_X == true ? 34.0 : 0.0


//********* DEVICE INFORMATION **********************
struct ScreenSize {
    
    static let SCREEN_WIDTH = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}

struct DeviceType {
    
    static let IS_IPHONE = UIDevice.current.userInterfaceIdiom == .phone
    
    static let IS_IPHONE_4_OR_LESS = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    
    static let IS_IPHONE_5 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    
    static let IS_IPHONE_6 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
    
    static let IS_IPHONE_6P = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
    
    static let IS_IPHONE_7 = IS_IPHONE_6
    static let IS_IPHONE_7P = IS_IPHONE_6P
    static let IS_IPHONE_8  = IS_IPHONE_7
    static let IS_IPHONE_8P = IS_IPHONE_7P
    static let IS_IPHONE_X  = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 812.0
    
    static let IS_IPAD = UIDevice.current.userInterfaceIdiom == .pad
    static let IS_IPAD_PRO_9_7 = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1024.0
    
    static let IS_IPAD_PRO_10_5 = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1112.0
    
    static let IS_IPAD_PRO_12_9 = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1366.0
    
    static let IS_TV = UIDevice.current.userInterfaceIdiom == .tv
    
    static let IS_CAR_PLAY = UIDevice.current.userInterfaceIdiom == .carPlay
}


/********************************************
 *
 * Create Date options Enum
 *
 *******************************************/

public enum DateType: Int {
    
    case romantic = 0
    case active
    case relaxed
    case none
}

public enum moneyType: Int {
    
    case lessThan50 = 0
    case lessThan20
    case free
    case none
}

public enum envirnmentType: Int {
    
    case inside = 0
    case outside
    case both
    case none
}

public enum relationType:  Int {
    
    case couple = 0
    case firstDate
    case secondDate
    case thirdDate
    case none
}

/********************************************
 *
 * Create Key to Store Date data
 *
 *******************************************/

public enum QuestionKey: String {
    
    case storyText = "StoryText"
    case storyTitle = "StoryTitle"
    case choices = "Choices"
    case choiceActions = "ChoiceActions"
}



