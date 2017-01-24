//
//  ArticlesRouter.swift
//  Articles
//
//  Created by Pedro Henrique Prates Peralta on 3/20/16.
//  Copyright © 2017 Pedro Peralta. All rights reserved.
//

import UIKit

class ArticlesRouter: ArticlesWireframe {
    
    weak var viewController: UIViewController?
    private(set) var sortCompletion: ((ArticlesSortType) -> ())?
    
    static func assembleModule() -> UIViewController {
        let view = R.storyboard.articlesStoryboard.articlesViewController()
        let presenter = ArticlesPresenter()
        let interactor = ArticlesInteractor()
        let router = ArticlesRouter()
        
        let navigation = UINavigationController(rootViewController: view!)
        
        view?.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.viewController = view
        
        return navigation
    }
    
    func presentSortOptions(sortCompletion: ((ArticlesSortType) -> ())?) {
        self.sortCompletion = sortCompletion
        
        let alert = UIAlertController(
            title: Localization.ArticlesSort.alertSortByTitle,
            message: nil,
            preferredStyle: .actionSheet
        )
        
        alert.addAction(UIAlertAction(
            title: Localization.ArticlesSort.dateOption,
            style: .default,
            handler: { (alert: UIAlertAction!) in self.sortCompletion?(ArticlesSortType.date) }
        ))
        
        alert.addAction(UIAlertAction(
            title: Localization.ArticlesSort.titleOption,
            style: .default,
            handler: { (alert: UIAlertAction!) in self.sortCompletion?(ArticlesSortType.title) }
        ))
        
        alert.addAction(UIAlertAction(
            title: Localization.ArticlesSort.authorOption,
            style: .default,
            handler: { (alert: UIAlertAction!) in self.sortCompletion?(ArticlesSortType.author) }
        ))
        
        alert.addAction(UIAlertAction(
            title: Localization.ArticlesSort.websiteOption,
            style: .default,
            handler: { (alert: UIAlertAction!) in self.sortCompletion?(ArticlesSortType.website) }
        ))
        
        alert.addAction(UIAlertAction(
            title: Localization.ArticlesSort.cancelOption,
            style: .default,
            handler: nil
        ))
        
        viewController?.present(alert, animated: true, completion: nil)
    }
    
    func presentDetails(forArticle article: Article) {
        let detailsModuleViewController = DetailsRouter.assembleModule(article)
        viewController?.navigationController?.pushViewController(detailsModuleViewController, animated: true)
    }
}
