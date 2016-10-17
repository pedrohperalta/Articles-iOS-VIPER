//
// Created by Pedro Henrique Prates Peralta on 3/16/16.
// Copyright (c) 2016 Cheesecake Labs. All rights reserved.
//

import UIKit
import PKHUD

class ArticlesViewController: UIViewController, ArticlesViewInterface {
    
    // MARK: Constants
    
    let navigationBarTitle = "NAVIGATION_BAR_TITLE"
    let buttonSortTitle = "BUTTON_SORT_TITLE"
    
    // MARK: Outlets
    
    @IBOutlet weak var articlesTableView: UITableView!
    
    // MARK: Instance Variables
    
    var presenter: ArticlesModuleInterface!
    var articles: [[String: Any]]!

    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter.updateView()
        HUD.show(.progress)
    }
    
    // MARK: Private
    
    private func setupView() {
        setupNavigationBar()
        setupTableView()
    }
    
    private func setupNavigationBar() {
        let sortButton = UIBarButtonItem(title: buttonSortTitle.localized(),
                                         style: .plain,
                                         target: self,
                                         action: #selector(ArticlesViewController.onSortButtonClicked))
        navigationItem.rightBarButtonItem = sortButton
        navigationItem.title = navigationBarTitle.localized()
    }
    
    
    private func setupTableView() {
        articlesTableView.dataSource = self
        articlesTableView.delegate = self
        articlesTableView.rowHeight = UITableViewAutomaticDimension
        articlesTableView.estimatedRowHeight = 230.0
    }
    
    @objc private func onSortButtonClicked(_ sender: Any?) {
        presenter.sortArticles()
    }
    
    
    // MARK: ArticlesViewInterface
    
    func showNoContentScreen() {
        // Show custom empty screen.
    }
    
    func showArticlesData(_ articles: [[String: Any]]) {
        HUD.hide()
        self.articles = articles
        articlesTableView.reloadData()
    }
}

extension ArticlesViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: UITableView DataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return articles != nil ? articles.count : 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let articleCell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.kArticlesCellIdentifier) as! ArticleTableViewCell
        articleCell.setupWithArticle(articles[indexPath.section])
        return articleCell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    // MARK: UITableView Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.showDetails(forArticle: articles[indexPath.section])
    }
}
