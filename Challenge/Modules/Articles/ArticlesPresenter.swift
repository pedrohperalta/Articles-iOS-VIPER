//
// Created by Pedro Henrique Prates Peralta on 3/17/16.
// Copyright (c) 2016 Cheesecake Labs. All rights reserved.
//

import Foundation


class ArticlesPresenter : ArticlesOutput
{
    weak var provider: ArticlesProvider!


    init()
    {
        let articlesInteractor = ArticlesInteractor()
        articlesInteractor.output = self
        self.provider = articlesInteractor
    }


    func receiveArticles(articles: [Article])
    {
        print(articles[0].title!)
        print(articles[0].authors!)
        print(articles[0].content!)
        print(articles[0].date!)
        print(articles[0].imageUrl!)
        print(articles[0].website!)
    }


    func requestArticles()
    {
        self.provider.downloadArticles()
    }
}
