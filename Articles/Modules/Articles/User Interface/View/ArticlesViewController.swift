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
    
    
    // MARK: Outlets
    
    @IBOutlet weak var articlesTableView: UITableView!
    
    
    // MARK: Instance Variables
    
    var presenter: ArticlesModuleInterface!
    var articles: [Article]!


    // MARK: Life Cycle

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.setupView()
        self.presenter.updateView()
        HUD.show(.Progress)
    }
    
    
    // MARK: Private
    
    private func setupView()
    {
        self.setupNavigationBar()
        self.setupTableView()
    }
    
    
    private func setupNavigationBar()
    {
        let sortButton = UIBarButtonItem(title: self.buttonSortTitle.localized,
                                         style: .Plain,
                                         target: self,
                                         action: #selector(ArticlesViewController.onSortButtonClicked(_:)))
        
        self.navigationItem.rightBarButtonItem = sortButton
        self.navigationItem.title = self.navigationBarTitle.localized
    }
    
    
    private func setupTableView()
    {
        self.articlesTableView.dataSource = self
        self.articlesTableView.delegate = self
        self.articlesTableView.rowHeight = UITableViewAutomaticDimension
        self.articlesTableView.estimatedRowHeight = 230.0
    }
    
    
    @objc private func onSortButtonClicked(sender: UIBarButtonItem)
    {
        self.presenter.sortArticles()
    }
    
    
    // MARK: ArticlesViewInterface
    
    func showNoContentScreen()
    {
        // Show custom empty screen.
    }
    
    
    func showArticlesData(articles: [Article])
    {
        HUD.hide()
        self.articles = articles
        self.articlesTableView.reloadData()
    }

    
    // MARK: UITableView DataSource
    
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
        let articleCell = tableView.dequeueReusableCellWithIdentifier(ArticleTableViewCell.kArticlesCellIdentifier) as! ArticleTableViewCell

        articleCell.setupWithArticle(self.articles[indexPath.section])

        return articleCell
    }
    
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        return UIView()
    }
    
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView?
    {
        return UIView()
    }


    // MARK: UITableView Delegate

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        self.presenter.showDetailsForArticle(self.articles[indexPath.section])
    }
}
