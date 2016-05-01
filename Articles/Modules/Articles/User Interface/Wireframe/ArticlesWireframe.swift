//
// Created by Pedro Henrique Prates Peralta on 3/20/16.
// Copyright (c) 2016 Cheesecake Labs. All rights reserved.
//

import UIKit


class ArticlesWireframe : NSObject, ArticlesWireframeInput
{
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
    
    override init()
    {
        super.init()
        
        let articlesInteractor = ArticlesInteractor()
        
        self.articlesPresenter = ArticlesPresenter()
        self.articlesPresenter.interactor = articlesInteractor
        self.articlesPresenter.wireframe = self
        
        articlesInteractor.output = self.articlesPresenter
    }
    
    
    func presentArticlesInterfaceFromWindow(window: UIWindow)
    {
        self.articlesViewController = self.articlesViewControllerFromStoryboard()
        self.articlesViewController.presenter = self.articlesPresenter
        
        self.articlesPresenter.view = self.articlesViewController
        
        self.rootWireframe.showRootViewControllerInWindow(self.articlesViewController, window: window)
    }


    // MARK: ArticlesWireframeInput

    func presentArticlesSortOptions()
    {
        let alert = UIAlertController(title: self.alertSortByTitle.localized(), message: nil, preferredStyle: .ActionSheet)
        
        alert.addAction(UIAlertAction(title: self.dateString.localized(),
            style: .Default,
            handler: { (alert: UIAlertAction!) in self.articlesPresenter.sortArticlesList(.Date) }))

        alert.addAction(UIAlertAction(title: self.titleString.localized(),
            style: .Default,
            handler: { (alert: UIAlertAction!) in self.articlesPresenter.sortArticlesList(.Title) }))
        
        alert.addAction(UIAlertAction(title: self.authorString.localized(),
            style: .Default,
            handler: { (alert: UIAlertAction!) in self.articlesPresenter.sortArticlesList(.Author) }))
        
        alert.addAction(UIAlertAction(title: self.webSiteString.localized(),
            style: .Default,
            handler: { (alert: UIAlertAction!) in self.articlesPresenter.sortArticlesList(.Website) }))
        
        alert.addAction(UIAlertAction(title: self.cancelString.localized(),
                style: .Cancel,
                handler: nil))
        
        self.articlesViewController.presentViewController(alert, animated: true, completion: nil)
    }


    func presentDetailsInterfaceForArticle(article: NSDictionary)
    {
        self.detailsWireframe = DetailsWireframe()
        self.sendArticleToDetailsPresenter(self.detailsWireframe.detailsPresenter, article: article)
        self.detailsWireframe.presentArticleDetailsInterfaceFromViewController(self.articlesViewController)
    }
    
    
    // MARK: Private

    private func sendArticleToDetailsPresenter(detailsPresenter: DetailsPresenter, article: NSDictionary)
    {
        detailsPresenter.article = article
    }


    private func articlesViewControllerFromStoryboard() -> ArticlesViewController
    {
        let storyboard = UIStoryboard(name: self.storyboardName, bundle: nil)
        let viewController = storyboard.instantiateViewControllerWithIdentifier(self.articlesViewControllerIdentifier) as! ArticlesViewController
        return viewController
    }
}
