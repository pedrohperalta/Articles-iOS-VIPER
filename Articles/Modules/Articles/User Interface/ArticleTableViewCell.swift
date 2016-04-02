//
// Created by Pedro Henrique Prates Peralta on 3/19/16.
// Copyright (c) 2016 Cheesecake Labs. All rights reserved.
//

import UIKit
import Kingfisher


class ArticleTableViewCell : UITableViewCell
{
    // MARK: Constants

    static let kArticlesCellIdentifier = "ArticlesCellIdentifier"
    let kImagePlaceHolder = "image-placeholder"
    
    
    // MARK: Outlets
    
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorsLabel: UILabel!
    
    
    // MARK: Life Cycle
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }


    // MARK: Public

    func setupWithArticle(article: Article)
    {
        self.authorsLabel?.text = article.authors!
        self.titleLabel?.text = article.title!
        
        if (article.imageUrl != nil) {
            self.articleImageView.kf_setImageWithURL(NSURL(string: article.imageUrl!)!, placeholderImage:nil)
        } else {
            self.articleImageView.image = UIImage(named: self.kImagePlaceHolder)
        }
    }
}
