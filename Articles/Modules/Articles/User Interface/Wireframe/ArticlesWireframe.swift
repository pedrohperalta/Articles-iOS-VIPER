//
// Created by Pedro Henrique Prates Peralta on 3/20/16.
// Copyright (c) 2016 Cheesecake Labs. All rights reserved.
//

import UIKit

class ArticlesWireframe: ArticlesWireframeInput {
    
    // MARK: Constants
    
    let alertSortByTitle = "ALERT_SORT_BY_TITLE"
    let dateString = "ALERT_DATE_OPTION"
    let titleString = "ALERT_TITLE_OPTION"
    let authorString = "ALERT_AUTHOR_OPTION"
    let webSiteString = "ALERT_WEBSITE_OPTION"
    let cancelString = "ALERT_CANCEL_OPTION"
    let storyboardName = "ArticlesStoryboard"
    let articlesViewControllerIdentifier = "ArticlesViewController"
    
    // MARK: Instance Variables

    weak var articlesViewController: ArticlesViewController!
    var articlesPresenter: ArticlesPresenter!
    var rootWireframe: RootWireframe!
    var detailsWireframe: DetailsWireframe!
    
    // MARK: Public
    
    init() {
        let articlesInteractor = ArticlesInteractor()
        articlesPresenter = ArticlesPresenter()
        articlesPresenter.interactor = articlesInteractor
        articlesPresenter.wireframe = self
        articlesInteractor.output = articlesPresenter
    }
    
    func presentArticlesInterfaceFromWindow(_ window: UIWindow) {
        articlesViewController = articlesViewControllerFromStoryboard()
        articlesViewController.presenter = articlesPresenter
        articlesPresenter.view = articlesViewController
        rootWireframe.showRootViewController(articlesViewController, inWindow: window)
    }
    
    // MARK: ArticlesWireframeInput

    func presentArticlesSortOptions() {
        let alert = UIAlertController(title: alertSortByTitle.localized(), message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: self.dateString.localized(),
            style: .default,
            handler: { (alert: UIAlertAction!) in self.articlesPresenter.sortArticlesList(sortBy: .date) }))
        alert.addAction(UIAlertAction(title: titleString.localized(),
            style: .default,
            handler: { (alert: UIAlertAction!) in self.articlesPresenter.sortArticlesList(sortBy: .title) }))
        alert.addAction(UIAlertAction(title: authorString.localized(),
            style: .default,
            handler: { (alert: UIAlertAction!) in self.articlesPresenter.sortArticlesList(sortBy: .author) }))
        alert.addAction(UIAlertAction(title: webSiteString.localized(),
            style: .default,
            handler: { (alert: UIAlertAction!) in self.articlesPresenter.sortArticlesList(sortBy: .website) }))
        alert.addAction(UIAlertAction(title: cancelString.localized(),
                style: .cancel,
                handler: nil))
        articlesViewController.present(alert, animated: true, completion: nil)
    }

    func presentDetailsInterfaceForArticle(_ article: Article) {
        detailsWireframe = DetailsWireframe()
        sendArticleToDetailsPresenter(detailsWireframe.detailsPresenter, article: article)
        detailsWireframe.presentArticleDetailsInterfaceFromViewController(articlesViewController)
    }
    
    // MARK: Private

    private func sendArticleToDetailsPresenter(_ detailsPresenter: DetailsPresenter, article: Article) {
        detailsPresenter.article = article
    }
    
    private func articlesViewControllerFromStoryboard() -> ArticlesViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: articlesViewControllerIdentifier) as! ArticlesViewController
        return viewController
    }
}
