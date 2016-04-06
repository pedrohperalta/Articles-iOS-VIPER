//
// Created by Pedro Henrique Prates Peralta on 3/17/16.
// Copyright (c) 2016 Cheesecake Labs. All rights reserved.
//

import Foundation


class ArticlesPresenter : ArticlesModuleInterface, ArticlesInteractorOutput
{
    // MARK: Instance Variables
    
    weak var view: ArticlesViewInterface!
    var interactor: ArticlesInteractorInput!
    var wireframe: ArticlesWireframe!
    var articles: [Article]!
    
    
    // MARK: Enums
    
    enum ArticlesSortBy {
        case Date
        case Title
        case Author
        case Website
    }
    
    
    // MARK: ArticlesModuleInterface
    
    func updateView()
    {
        self.interactor.fetchArticles()
    }


    func sortArticles()
    {
        self.wireframe.presentArticlesSortOptions()
    }
    
    
    func showDetailsForArticle(article: Article)
    {
        self.wireframe.presentDetailsInterfaceForArticle(article)
    }
    
    
    // MARK: ArticlesInteractorOutput
    
    func articlesFetched(articles: [Article])
    {
        if articles.count > 0 {
            self.articles = articles
            self.view.showArticlesData(articles)
        } else {
            self.view.showNoContentScreen()
        }
    }
    
    
    // MARK: Public

    func sortArticlesList(sortBy: ArticlesSortBy)
    {
        switch sortBy {

        case .Date:
            self.view.showArticlesData(self.articles.sort({ $0.date < $1.date }))
            break
            
        case .Title:
            self.view.showArticlesData(self.articles.sort({ $0.title < $1.title }))
            break
            
        case .Author:
            self.view.showArticlesData(self.articles.sort({ $0.authors < $1.authors }))
            break
            
        case .Website:
            self.view.showArticlesData(self.articles.sort({ $0.website < $1.website }))
            break
            
        }
    }
}
