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
    
    
    // MARK: Outlets
    
    @IBOutlet weak var articlesTableView: UITableView!
    
    
    // MARK: Instance Variables
    
    var articlesPresenter: ArticlesPresenter!
    var articles: [Article]!


    // MARK: Life Cycle

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.articlesTableView.dataSource = self
        self.articlesTableView.delegate = self
        
        self.setupNavigationBar()
        self.articlesPresenter.requestArticles()
        
        HUD.show(.Progress)
    }
    
    
    // MARK: Private
    
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
        self.articlesTableView.reloadData()
    }


    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.articles != nil ? self.articles.count : 0
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let articleCell = tableView.dequeueReusableCellWithIdentifier(ArticleTableViewCell.kArticlesCellIdentifier) as! ArticleTableViewCell

        articleCell.setupWithArticle(self.articles[indexPath.row])

        return articleCell
    }


    // MARK: UITableView Delegate

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        self.articlesPresenter.presentDetailsScreenForArticle(self.articles[indexPath.row])
    }
}
