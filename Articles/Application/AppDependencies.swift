//
// Created by Pedro Henrique Prates Peralta on 3/20/16.
// Copyright (c) 2016 Cheesecake Labs. All rights reserved.
//

import UIKit

class AppDependencies {
    
    // MARK: Instance Variables
    
    var articlesWireframe: ArticlesWireframe

    // MARK: Public
    
    init() {
        let rootWireframe = RootWireframe()
        articlesWireframe = ArticlesWireframe()
        articlesWireframe.rootWireframe = rootWireframe
    }
    
    func installRootViewControllerIntoWindow(_ window: UIWindow) {
        articlesWireframe.presentArticlesInterfaceFromWindow(window)
    }
}
