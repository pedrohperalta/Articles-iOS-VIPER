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
    var articles: NSArray!
    
    
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
    
    
    func showDetailsForArticle(article: NSDictionary)
    {
        self.wireframe.presentDetailsInterfaceForArticle(article)
    }
    
    
    // MARK: ArticlesInteractorOutput
    
    func articlesFetched(articles: NSArray)
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
            self.view.showArticlesData(self.articles.sort({ ($0["date"] as! String) < ($1["date"] as! String) }))
            break

        case .Title:
            self.view.showArticlesData(self.articles.sort({ ($0["title"] as! String) < ($1["title"] as! String) }))
            break

        case .Author:
            self.view.showArticlesData(self.articles.sort({ ($0["authors"] as! String) < ($1["authors"] as! String) }))
            break

        case .Website:
            self.view.showArticlesData(self.articles.sort({ ($0["website"] as! String) < ($1["website"] as! String) }))
            break

        }
    }
}
