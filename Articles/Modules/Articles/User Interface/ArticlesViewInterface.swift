//
// Created by Pedro Henrique Prates Peralta on 3/19/16.
// Copyright (c) 2016 Cheesecake Labs. All rights reserved.
//

import Foundation


protocol ArticlesViewInterface: class
{
    func showNoContentScreen()
    func showArticlesData(articles: [Article])
}
