//
// Created by Pedro Henrique Prates Peralta on 3/16/16.
// Copyright (c) 2016 Cheesecake Labs. All rights reserved.
//

import UIKit


class ArticlesViewController : UIViewController, ArticlesViewInterface, UITableViewDataSource, UITableViewDelegate
{
    var articlesView: ArticlesView!
    var articlesPresenter: ArticlesPresenter!

    var articles: [Article]!


    // MARK: Life Cycle


    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.setupArticlesView()
        self.articlesPresenter.requestArticles()
    }


    // MARK: ArticlesViewInterface


    func showNoContentScreen()
    {
    }


    func showArticlesList(articles: [Article])
    {
        self.articles = articles
        self.articlesView.articlesTableView.reloadData()
    }
    
    
    // MARK: Private


    func setupArticlesView()
    {
        self.articlesView = ArticlesView(frame: self.view.frame)
        self.articlesView.articlesTableView.delegate = self
        self.articlesView.articlesTableView.dataSource = self
        
        self.view.addSubview(self.articlesView)
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
