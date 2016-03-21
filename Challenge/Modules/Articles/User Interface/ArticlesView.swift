//
// Created by Pedro Henrique Prates Peralta on 3/16/16.
// Copyright (c) 2016 Cheesecake Labs. All rights reserved.
//

import UIKit
import SnapKit


class ArticlesView : UIView
{
    // MARK: Life Cycle


    override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.setupView()
        self.setupConstraints()
    }


    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }


    // MARK: View Setup


    func setupView()
    {
        self.backgroundColor = UIColor.backgroundWhite()
        self.addSubview(self.articlesTableView)
    }


    func setupConstraints()
    {
        self.articlesTableView.snp_makeConstraints { (make) -> Void in
            make.center.equalTo(self.snp_center)
            make.size.equalTo(self.snp_size).inset(UIEdgeInsetsMake(30, 16, 16, 16))
        }
    }


    // MARK: Lazy Instantiation


    lazy var articlesTableView: UITableView = {
        let tableView = UITableView()
        tableView.registerClass(ArticleTableViewCell.self, forCellReuseIdentifier: ArticleTableViewCell.kArticlesCellIdentifier)
        tableView.backgroundColor = UIColor.backgroundWhite()
        tableView.estimatedRowHeight = 180.0
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.showsVerticalScrollIndicator = false

        return tableView
    }()
}
