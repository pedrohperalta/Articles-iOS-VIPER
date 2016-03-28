//
// Created by Pedro Henrique Prates Peralta on 3/17/16.
// Copyright (c) 2016 Cheesecake Labs. All rights reserved.
//

import Foundation


class ArticlesPresenter : ArticlesOutput
{
    weak var view: ArticlesViewInterface!
    var wireframe: ArticlesWireframe!
    var provider: ArticlesProvider!

    var articles: [Article]!
    
    enum ArticlesSortBy {
        case Date
        case Title
        case Author
        case Website
    }
    
    
    // MARK: ArticlesOutput

    func receiveArticles(articles: [Article])
    {
        if articles.count > 0 {
            self.articles = articles
            view.showArticlesList(articles)
        } else {
            view.showNoContentScreen()
        }
    }
    
    
    // MARK: Public

    func requestArticles()
    {
        self.provider.downloadArticles()
    }
    
    
    func sortArticles()
    {
        self.wireframe.presentArticlesSortOptions()
    }
    
    
    func sortArticlesList(sortBy: ArticlesSortBy)
    {
        switch sortBy {

        case .Date:
            view.showArticlesList(self.articles.sort({ $0.date < $1.date }))
            break
            
        case .Title:
            view.showArticlesList(self.articles.sort({ $0.title < $1.title }))
            break
            
        case .Author:
            view.showArticlesList(self.articles.sort({ $0.authors < $1.authors }))
            break
            
        case .Website:
            view.showArticlesList(self.articles.sort({ $0.website < $1.website }))
            break
            
        }
    }


    func presentDetailsScreenForArticle(article: Article)
    {
        self.wireframe.presentDetailsInterfaceForArticle(article)
    }
}
