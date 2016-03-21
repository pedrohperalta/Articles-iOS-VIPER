//
// Created by Pedro Henrique Prates Peralta on 3/20/16.
// Copyright (c) 2016 Cheesecake Labs. All rights reserved.
//

import UIKit


class ArticlesWireframe : NSObject
{
    var articlesPresenter: ArticlesPresenter!
    var articlesViewController: ArticlesViewController!
    var rootWireframe: RootWireframe!


    func presentArticlesInterfaceFromWindow(window: UIWindow)
    {
        self.articlesViewController = ArticlesViewController()
        self.articlesViewController.articlesPresenter = self.articlesPresenter

        self.articlesPresenter.view = self.articlesViewController

        self.rootWireframe.showRootViewControllerInWindow(self.articlesViewController, window: window)
    }
}
