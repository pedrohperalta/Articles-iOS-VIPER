//
//  ArticlesViewController.swift
//  Articles
//
//  Created by Pedro Henrique Prates Peralta on 3/16/16.
//  Copyright © 2017 Pedro Peralta. All rights reserved.
//

import UIKit

class ArticlesViewController: UIViewController {
    
    @IBOutlet weak var articlesTableView: UITableView!
    
    var presenter: ArticlesPresentation!
    var articles: [Article] = [] {
        didSet {
            articlesTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter.viewDidLoad()
    }
  
    fileprivate func setupView() {
        let sortButton = UIBarButtonItem(
            title: Localization.Articles.sortButtonTitle,
            style: .plain,
            target: self,
            action: #selector(didClickSortButton)
        )
        
        navigationItem.rightBarButtonItem = sortButton
        navigationItem.title = Localization.Articles.navigationBarTitle
        
        articlesTableView.dataSource = self
        articlesTableView.delegate = self
        articlesTableView.rowHeight = UITableViewAutomaticDimension
        articlesTableView.estimatedRowHeight = 230.0
        articlesTableView.register(ArticleTableViewCell.self)
    }
    
    @objc fileprivate func didClickSortButton(_ sender: Any?) {
        presenter.didClickSortButton()
    }
}

extension ArticlesViewController: ArticlesView {
    
    func showNoContentScreen() {
    }
    
    func showArticlesData(_ articles: [Article]) {
        self.articles = articles
    }
}

extension ArticlesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as ArticleTableViewCell
        let article = articles[indexPath.section]
        
        cell.selectionStyle = .none
        cell.setup(article)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectArticle(articles[indexPath.section])
    }
}
