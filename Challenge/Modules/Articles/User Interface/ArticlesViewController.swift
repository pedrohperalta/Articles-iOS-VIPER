//
// Created by Pedro Henrique Prates Peralta on 3/16/16.
// Copyright (c) 2016 Cheesecake Labs. All rights reserved.
//

import UIKit


class ArticlesViewController : UIViewController, ArticlesViewInterface
{
    var articlesView: ArticlesView!
    var articlesPresenter: ArticlesPresenter!


    // MARK: Life Cycle


    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.articlesView = ArticlesView(frame: self.view.frame)
        self.view.addSubview(self.articlesView)

        self.articlesPresenter.requestArticles()
    }


    func showNoContentScreen()
    {
    }


    func showArticlesList()
    {
    }
}
