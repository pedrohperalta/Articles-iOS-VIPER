//
//  AppDelegate.swift
//  Challenge
//
//  Created by Pedro Henrique Prates Peralta on 3/16/16.
//  Copyright © 2017 Pedro Peralta. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder {
    
    var window: UIWindow?
}

extension AppDelegate: UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        RootRouter().presentArticlesScreen(in: window!)
        return true
    }
}
