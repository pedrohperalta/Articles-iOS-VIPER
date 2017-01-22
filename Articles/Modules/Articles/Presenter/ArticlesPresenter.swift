//
//  ArticlesPresenter.swift
//  Articles
//
//  Created by Pedro Henrique Prates Peralta on 3/17/16.
//  Copyright © 2017 Pedro Peralta. All rights reserved.
//

import Foundation

class ArticlesPresenter: ArticlesPresentation {
    
    weak var view: ArticlesView?
    var interactor: ArticlesUseCase!
    var router: ArticlesWireframe!
    
    var articles: [Article] = [] {
        didSet {
            if articles.count > 0 {
                view?.showArticlesData(articles)
            } else {
                view?.showNoContentScreen()
            }
        }
    }
    
    func viewDidLoad() {
        interactor.fetchArticles()
        view?.showActivityIndicator()
    }
    
    func didClickSortButton() {
        router.presentSortOptions { option in
            self.sortArticlesList(sortBy: option)
        }
    }
    
    func didSelectArticle(_ article: Article) {
        router.presentDetails(forArticle: article)
    }
    
    fileprivate func sortArticlesList(sortBy: ArticlesSortType) {
        switch sortBy {
        case .date:
            view?.showArticlesData(articles.sorted(by: { ($0.date) < ($1.date) }))
        
        case .title:
            view?.showArticlesData(articles.sorted(by: { ($0.title) < ($1.title) }))
        
        case .author:
            view?.showArticlesData(articles.sorted(by: { ($0.authors) < ($1.authors) }))
        
        case .website:
            view?.showArticlesData(articles.sorted(by: { ($0.website) < ($1.website) }))
        }
    }
}

extension ArticlesPresenter: ArticlesInteractorOutput {
    
    func articlesFetched(_ articles: [Article]) {
        self.articles = articles
        view?.hideActivityIndicator()
    }
    
    internal func articlesFetchFailed() {
        view?.showNoContentScreen()
        view?.hideActivityIndicator()
    }
}
