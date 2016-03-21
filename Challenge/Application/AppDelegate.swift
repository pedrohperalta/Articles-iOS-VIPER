//
//  AppDelegate.swift
//  Challenge
//
//  Created by Pedro Henrique Prates Peralta on 3/16/16.
//  Copyright © 2016 Cheesecake Labs. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
    {
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)

        let appDependencies = AppDependencies()
        appDependencies.configureDependencies()
        appDependencies.installRootViewControllerIntoWindow(self.window!)
        
        return true
    }
}
