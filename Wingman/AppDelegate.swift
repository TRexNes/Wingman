//
//  AppDelegate.swift
//  Wingman
//
//  Created by Rex Nesbit on 12/11/17.
//  Copyright © 2017 Rex Nesbit. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var isFirstQuestion = Bool()
    var questionAnswerDictionary = NSMutableDictionary()
    var dateChoiceOption : SelectedChoice?
    var dateAnswerDictionary = NSMutableDictionary()
    
    var date       : DateType?
    var money      : moneyType?
    var envirnment : envirnmentType?
    var relation   : relationType?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }

    func applicationWillTerminate(_ application: UIApplication) {
        
    }
    
    func removeDateData() {
        
        self.questionAnswerDictionary.removeAllObjects()
        self.dateAnswerDictionary.removeAllObjects()
        
        self.date       = DateType.none
        self.money      = moneyType.none
        self.envirnment = envirnmentType.none
        self.relation   = relationType.none
    }
    
}

