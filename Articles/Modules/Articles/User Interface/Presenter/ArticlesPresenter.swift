//
// Created by Pedro Henrique Prates Peralta on 3/17/16.
// Copyright (c) 2016 Cheesecake Labs. All rights reserved.
//

import Foundation

class ArticlesPresenter: ArticlesModuleInterface, ArticlesInteractorOutput {
    
    // MARK: Instance Variables
    
    weak var view: ArticlesViewInterface!
    
    var interactor: ArticlesInteractorInput!
    var wireframe: ArticlesWireframe!
    var articles: [[String: Any]]!
    
    
    // MARK: Enums
    
    enum ArticlesSortBy {
        case date
        case title
        case author
        case website
    }
    
    
    // MARK: ArticlesModuleInterface
    
    func updateView() {
        interactor.fetchArticles()
    }


    func sortArticles() {
        wireframe.presentArticlesSortOptions()
    }
    
    
    func showDetails(forArticle article: [String: Any]) {
        wireframe.presentDetailsInterfaceForArticle(article)
    }
    
    
    // MARK: ArticlesInteractorOutput
    
    func articlesFetched(_ articles: [[String: Any]]) {
        if articles.count > 0 {
            self.articles = articles
            view.showArticlesData(articles)
        } else {
            view.showNoContentScreen()
        }
    }
    
    
    // MARK: Public

    func sortArticlesList(sortBy: ArticlesSortBy) {
        switch sortBy {
        case .date:
            let items = articles.sorted(by: { ($0["date"] as! String) < ($1["date"] as! String) })
            view.showArticlesData(items)
        case .title:
            let items = articles.sorted(by: { ($0["title"] as! String) < ($1["title"] as! String) })
            view.showArticlesData(items)
        case .author:
            let items = articles.sorted(by: { ($0["authors"] as! String) < ($1["authors"] as! String) })
            view.showArticlesData(items)
        case .website:
            let items = articles.sorted(by: { ($0["website"] as! String) < ($1["website"] as! String) })
            view.showArticlesData(items)
        }
    }
}
