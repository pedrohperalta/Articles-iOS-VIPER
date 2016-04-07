//
// Created by Pedro Henrique Prates Peralta on 3/26/16.
// Copyright (c) 2016 Cheesecake Labs. All rights reserved.
//

import UIKit
import Kingfisher


class DetailsViewController : UIViewController, DetailsViewInterface
{
    // MARK: Constants

    let kNavigationTitle = "Details"
    let kImagePlaceHolder = "image-placeholder"


    // MARK: Instance Variables

    var presenter: DetailsPresenter!
    
    
    // MARK: Outlets
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var authorsLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!


    // MARK: Life Cycle

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.presenter.updateView()
        self.navigationController!.title = self.kNavigationTitle.localized
    }


    // MARK: DetailsViewInterface

    func showArticleDetails(article: Article)
    {
        self.setupArticleImage(article)
        self.authorsLabel.text = article.authors
        self.dateLabel.text = article.date
        self.titleLabel.text = article.title
        self.contentLabel.text = article.content
    }


    // MARK: Private
    
    func setupArticleImage(article: Article)
    {
        if (article.imageUrl != nil) {
            self.articleImageView.kf_setImageWithURL(NSURL(string: article.imageUrl!)!, placeholderImage:nil)
        } else {
            self.articleImageView.image = UIImage(named: self.kImagePlaceHolder)
        }
    }
}
