//
// Created by Pedro Henrique Prates Peralta on 3/16/16.
// Copyright (c) 2016 Cheesecake Labs. All rights reserved.
//

import UIKit
import PKHUD


class ArticlesViewController : UIViewController, ArticlesViewInterface, UITableViewDataSource, UITableViewDelegate
{
    // MARK: Constants
    
    
    let navigationBarTitle = "NAVIGATION_BAR_TITLE"
    let buttonSortTitle = "BUTTON_SORT_TITLE"
    
    let sortAction = "onSortButtonClicked:"
    
    
    // MARK: Instance Variables
    
    
    var articlesView: ArticlesView!
    var articlesPresenter: ArticlesPresenter!

    var articles: [Article]!


    // MARK: Life Cycle


    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.setupNavigationBar()
        self.setupArticlesView()
        
        HUD.show(.Progress)
        self.articlesPresenter.requestArticles()
    }
    
    
    // MARK: Private
    
    
    func setupArticlesView()
    {
        self.articlesView = ArticlesView(frame: self.view.frame)
        self.articlesView.articlesTableView.delegate = self
        self.articlesView.articlesTableView.dataSource = self
        
        self.view.addSubview(self.articlesView)
    }
    
    
    func setupNavigationBar()
    {
        let sortButton = UIBarButtonItem(title: self.buttonSortTitle.localized, style: .Plain, target:self, action: Selector(self.sortAction))
        
        self.navigationItem.rightBarButtonItem = sortButton
        self.navigationItem.title = self.navigationBarTitle.localized
    }
    
    
    func onSortButtonClicked(sender: UIBarButtonItem)
    {
        self.articlesPresenter.sortArticles()
    }
    
    
    // MARK: ArticlesViewInterface
    
    
    func showNoContentScreen()
    {
    }
    
    
    func showArticlesList(articles: [Article])
    {
        HUD.hide()
        self.articles = articles
        self.articlesView.articlesTableView.reloadData()
    }


    // MARK: UITableView Datasource
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return self.articles != nil ? self.articles.count : 0
    }


    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 1
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let articleCell = tableView.dequeueReusableCellWithIdentifier(ArticleTableViewCell.kArticlesCellIdentifier,
                forIndexPath: indexPath) as! ArticleTableViewCell

        articleCell.setupWithArticle(self.articles[indexPath.section])
        articleCell.contentView.layoutIfNeeded()

        return articleCell
    }


    // MARK: UITableView Delegate
    
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat
    {
        return 16
    }


    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView?
    {
        let footerView = UIView()
        footerView.backgroundColor = UIColor.clearColor()
        return footerView
    }


    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        print("Clicked on \(indexPath)")
    }
}
