//
//  ArticleTableViewCell.swift
//  Articles
//
//  Created by Pedro Henrique Prates Peralta on 3/19/16.
//  Copyright © 2017 Pedro Peralta. All rights reserved.
//

import UIKit
import Kingfisher

class ArticleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorsLabel: UILabel!
    
    func setup(_ article: Article) {
        authorsLabel?.text = article.authors
        titleLabel?.text = article.title
        articleImageView.kf.setImage(
            with: URL(string: article.imageUrl),
            placeholder: UIImage(named: Constants.imagePlaceholder),
            options: nil,
            progressBlock: nil,
            completionHandler: nil
        )
    }
}
