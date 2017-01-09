//
// Created by Pedro Henrique Prates Peralta on 3/26/16.
// Copyright (c) 2016 Cheesecake Labs. All rights reserved.
//

import UIKit
import Kingfisher

class DetailsViewController : UIViewController, DetailsViewInterface {
    
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

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.updateView()
        navigationController!.title = kNavigationTitle.localized()
    }

    // MARK: DetailsViewInterface

    func showArticleDetails(_ article: Article) {
        if let image = article.imageUrl {
            articleImageView.kf.setImage(with: URL(string: image)!, placeholder: nil)
        } else {
            articleImageView.image = UIImage(named: kImagePlaceHolder)
        }
        authorsLabel.text = article.authors
        dateLabel.text = article.date
        titleLabel.text = article.title
        contentLabel.text = article.content
    }
}
