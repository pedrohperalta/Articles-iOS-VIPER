//
//  DetailsViewController.swift
//  Articles
//
//  Created by Pedro Henrique Prates Peralta on 3/26/16.
//  Copyright © 2017 Pedro Peralta. All rights reserved.
//

import UIKit
import Kingfisher

class DetailsViewController : UIViewController {

    var presenter: DetailsPresentation!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var authorsLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    fileprivate func setupView() {
        navigationController!.title = Localization.Details.navigationBarTitle
    }
}

extension DetailsViewController: DetailsView {

    func showDetails(forArticle article: Article) {
        authorsLabel.text = article.authors
        dateLabel.text = article.date
        titleLabel.text = article.title
        contentLabel.text = article.content
        articleImageView.kf.setImage(
            with: URL(string: article.imageUrl),
            placeholder: UIImage(named: Constants.imagePlaceholder),
            options: nil,
            progressBlock: nil,
            completionHandler: nil
        )
    }
}
