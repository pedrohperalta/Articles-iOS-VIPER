//
// Created by Pedro Henrique Prates Peralta on 3/17/16.
// Copyright (c) 2016 Cheesecake Labs. All rights reserved.
//

import Foundation


class ArticlesPresenter : ArticlesOutput
{
    weak var provider: ArticlesProvider!
    weak var view: ArticlesViewInterface!


    func receiveArticles(articles: [Article])
    {
        if articles != nil && articles.count > 0 {
            view.showArticlesList()
        } else {
            view.showNoContentScreen()
        }
    }


    func requestArticles()
    {
        self.provider.downloadArticles()
    }
}
