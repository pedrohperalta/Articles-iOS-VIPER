//
// Created by Pedro Henrique Prates Peralta on 3/17/16.
// Copyright (c) 2016 Cheesecake Labs. All rights reserved.
//

import Foundation


class ArticlesPresenter : ArticlesOutput
{
    weak var view: ArticlesViewInterface!
    weak var wireframe: ArticlesWireframe!

    var provider: ArticlesProvider!


    func receiveArticles(articles: [Article])
    {
        if articles.count > 0 {
            view.showArticlesList(articles)
        } else {
            view.showNoContentScreen()
        }
    }


    func requestArticles()
    {
        self.provider.downloadArticles()
    }
}
