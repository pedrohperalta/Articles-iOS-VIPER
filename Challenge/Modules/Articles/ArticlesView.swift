//
// Created by Pedro Henrique Prates Peralta on 3/16/16.
// Copyright (c) 2016 Cheesecake Labs. All rights reserved.
//

import UIKit


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
        self.backgroundColor = UIColor.lightGrayColor()
    }


    func setupConstraints()
    {

    }
}
