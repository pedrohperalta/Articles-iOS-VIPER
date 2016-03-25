//
// Created by Pedro Henrique Prates Peralta on 3/19/16.
// Copyright (c) 2016 Cheesecake Labs. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher


class ArticleTableViewCell : UITableViewCell
{
    static let kArticlesCellIdentifier = "articlesCellIdentifier"
    static let kImagePlaceHolder = "image-placeholder"


    // MARK: Life Cycle


    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
        self.setupConstraints()
    }


    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }


    // MARK: Lazy Instantiation


    lazy var articleImageView: UIImageView! = {
        let imageView = UIImageView()
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        imageView.clipsToBounds = true

        return imageView
    }()


    lazy var titleLabel: UILabel! = {
        let label = UILabel()
        label.font = UIFont.regularFontWithSize(20)
        label.textAlignment = NSTextAlignment.Left
        label.textColor = UIColor.black_87()

        return label
    }()


    lazy var authorLabel: UILabel! = {
        let label = UILabel()
        label.font = UIFont.regularFontWithSize(14)
        label.textAlignment = NSTextAlignment.Left
        label.textColor = UIColor.black_54()

        return label
    }()


    // MARK: Private


    private func setupView()
    {
        self.backgroundColor = UIColor.whiteColor()
        self.selectionStyle = UITableViewCellSelectionStyle.None

        self.contentView.addSubview(self.articleImageView)
        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.authorLabel)
    }


    private func setupConstraints()
    {
        self.articleImageView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.contentView.snp_top)
            make.left.equalTo(self.contentView.snp_left)
            make.right.equalTo(self.contentView.snp_right)
        }

        self.titleLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.articleImageView.snp_bottom).offset(15)
            make.left.equalTo(self.contentView.snp_left).offset(15)
            make.right.equalTo(self.contentView.snp_right).offset(-15)
        }

        self.authorLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.titleLabel.snp_bottom).offset(5)
            make.left.equalTo(self.contentView.snp_left).offset(15)
            make.right.equalTo(self.contentView.snp_right).offset(-15)
            make.bottom.equalTo(self.contentView.snp_bottom).offset(-15)
        }
    }


    // MARK: Public


    func setupWithArticle(article: Article)
    {
        self.authorLabel?.text = article.authors!
        self.titleLabel?.text = article.title!
        
        if (article.imageUrl != nil) {
            self.articleImageView.kf_setImageWithURL(NSURL(string: article.imageUrl!)!, placeholderImage:nil)
        } else {
            self.articleImageView.image = UIImage(named: ArticleTableViewCell.kImagePlaceHolder)
        }
    }
}
