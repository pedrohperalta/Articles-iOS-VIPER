//
//  ArticlesContract.swift
//  Articles
//
//  Created by Pedro Henrique Prates Peralta on 21/01/17.
//  Copyright © 2017 Pedro Peralta. All rights reserved.
//

import UIKit

protocol ArticlesView: IndicatableView {
    var presenter: ArticlesPresentation! { get set }
    
    func showNoContentScreen()
    func showArticlesData(_ articles: [Article])
}

protocol ArticlesPresentation: class {
    weak var view: ArticlesView? { get set }
    var interactor: ArticlesUseCase! { get set }
    var router: ArticlesWireframe! { get set }
    
    func viewDidLoad()
    func didClickSortButton()
    func didSelectArticle(_ article: Article)
}

protocol ArticlesUseCase: class {
    weak var output: ArticlesInteractorOutput! { get set }
    
    func fetchArticles()
}

protocol ArticlesInteractorOutput: class {
    func articlesFetched(_ articles: [Article])
    func articlesFetchFailed()
}

protocol ArticlesWireframe: class {
    weak var viewController: UIViewController? { get set }
    
    func presentSortOptions(sortCompletion: ((ArticlesSortType) -> ())?)
    func presentDetails(forArticle article: Article)
    
    static func assembleModule() -> UIViewController
}
