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
    
    
    // MARK: Application Delegate


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
    {
        self.setupRootViewController()
        
        return true
    }
    
    
    // MARK: Private Methods
    
    
    func setupRootViewController()
    {
        let articlesViewController = ArticlesViewController()
        let articlesPresenter = ArticlesPresenter()
        let articlesInteractor = ArticlesInteractor()

        articlesViewController.articlesPresenter = articlesPresenter
        articlesPresenter.provider = articlesInteractor
        articlesPresenter.view = articlesViewController
        articlesInteractor.output = articlesPresenter

        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window!.backgroundColor = UIColor.whiteColor();
        self.window!.rootViewController = articlesViewController
        self.window!.makeKeyAndVisible()
    }
}
