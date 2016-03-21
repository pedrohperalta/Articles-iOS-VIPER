//
// Created by Pedro Henrique Prates Peralta on 3/20/16.
// Copyright (c) 2016 Cheesecake Labs. All rights reserved.
//

import UIKit


class AppDependencies : NSObject
{
    var articlesWireframe: ArticlesWireframe!


    func configureDependencies()
    {
        let rootWireframe = RootWireframe()

        let articlesInteractor = ArticlesInteractor()
        let articlesPresenter = ArticlesPresenter()
        let articlesWireframe = ArticlesWireframe()

        articlesInteractor.output = articlesPresenter

        articlesPresenter.provider = articlesInteractor
        articlesPresenter.wireframe = articlesWireframe

        articlesWireframe.rootWireframe = rootWireframe
        articlesWireframe.articlesPresenter = articlesPresenter

        self.articlesWireframe = articlesWireframe
    }


    func installRootViewControllerIntoWindow(window: UIWindow)
    {
        self.articlesWireframe.presentArticlesInterfaceFromWindow(window)
    }
}
