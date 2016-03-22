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
            make.top.equalTo(self.snp_top).offset(16)
            make.bottom.equalTo(self.snp_bottom).offset(-16)
            make.left.equalTo(self.snp_left).offset(16)
            make.right.equalTo(self.snp_right).offset(-16)
        }
    }


    // MARK: Lazy Instantiation


    lazy var articlesTableView: UITableView = {
        let tableView = UITableView()
        tableView.registerClass(ArticleTableViewCell.self, forCellReuseIdentifier: ArticleTableViewCell.kArticlesCellIdentifier)
        tableView.backgroundColor = UIColor.backgroundWhite()
        tableView.rowHeight = 230.0
        tableView.showsVerticalScrollIndicator = false

        return tableView
    }()
}
