//
// Created by Pedro Henrique Prates Peralta on 3/20/16.
// Copyright (c) 2016 Cheesecake Labs. All rights reserved.
//

import UIKit


class AppDependencies : NSObject
{
    // MARK: Instance Variables
    
    var articlesWireframe: ArticlesWireframe!


    // MARK: Public
    
    override init()
    {
        let rootWireframe = RootWireframe()
        
        self.articlesWireframe = ArticlesWireframe()
        self.articlesWireframe.rootWireframe = rootWireframe
    }


    func installRootViewControllerIntoWindow(window: UIWindow)
    {
        self.articlesWireframe.presentArticlesInterfaceFromWindow(window)
    }
}
