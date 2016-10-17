//
// Created by Pedro Henrique Prates Peralta on 3/19/16.
// Copyright (c) 2016 Cheesecake Labs. All rights reserved.
//

import UIKit
import Kingfisher

class ArticleTableViewCell: UITableViewCell {
    
    // MARK: Constants

    static let kArticlesCellIdentifier = "ArticlesCellIdentifier"
    let kImagePlaceHolder = "image-placeholder"
    
    // MARK: Outlets
    
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorsLabel: UILabel!
    
    // MARK: Life Cycle
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: Public

    func setupWithArticle(_ article: [String: Any]) {
        authorsLabel?.text = article["authors"] as? String
        titleLabel?.text = article["title"] as? String
        if let image = article["image"] as? String {
            articleImageView.kf.setImage(with: URL(string: image)!, placeholder: nil)
        } else {
            articleImageView.image = UIImage(named: kImagePlaceHolder)
        }
    }
}
