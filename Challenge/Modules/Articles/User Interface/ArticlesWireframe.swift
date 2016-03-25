//
// Created by Pedro Henrique Prates Peralta on 3/20/16.
// Copyright (c) 2016 Cheesecake Labs. All rights reserved.
//

import UIKit


class ArticlesWireframe : NSObject
{
    // MARK: Constants
    
    
    let alertSortByTitle = "ALERT_SORT_BY_TITLE"
    let dateString = "ALERT_DATE_OPTION"
    let titleString = "ALERT_TITLE_OPTION"
    let authorString = "ALERT_AUTHOR_OPTION"
    let webSiteString = "ALERT_WEBSITE_OPTION"
    let cancelString = "ALERT_CANCEL_OPTION"
    
    
    // MARK: Instance Variables
    
    
    var articlesPresenter: ArticlesPresenter!
    var articlesViewController: ArticlesViewController!
    var rootWireframe: RootWireframe!
    
    
    // MARK: Public
    
    
    func presentArticlesInterfaceFromWindow(window: UIWindow)
    {
        self.articlesViewController = ArticlesViewController()
        self.articlesViewController.articlesPresenter = self.articlesPresenter

        self.articlesPresenter.view = self.articlesViewController

        self.rootWireframe.showRootViewControllerInWindow(self.articlesViewController, window: window)
    }
    
    
    func presentArticlesSortOptions()
    {
        let alert = UIAlertController(title: self.alertSortByTitle.localized, message: nil, preferredStyle: .ActionSheet)
        
        alert.addAction(UIAlertAction(title: self.dateString.localized, style: .Default,
            handler: { (alert: UIAlertAction!) in self.articlesPresenter.sortArticlesList(.Date) }))

        alert.addAction(UIAlertAction(title: self.titleString.localized, style: .Default,
            handler: { (alert: UIAlertAction!) in self.articlesPresenter.sortArticlesList(.Title) }))
        
        alert.addAction(UIAlertAction(title: self.authorString.localized, style: .Default,
            handler: { (alert: UIAlertAction!) in self.articlesPresenter.sortArticlesList(.Author) }))
        
        alert.addAction(UIAlertAction(title: self.webSiteString.localized, style: .Default,
            handler: { (alert: UIAlertAction!) in self.articlesPresenter.sortArticlesList(.Website) }))
        
        alert.addAction(UIAlertAction(title: self.cancelString.localized, style: .Cancel, handler: nil))
        
        self.articlesViewController.presentViewController(alert, animated: true, completion: nil)
    }
}
