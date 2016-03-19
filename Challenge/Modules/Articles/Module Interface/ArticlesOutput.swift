//
// Created by Pedro Henrique Prates Peralta on 3/17/16.
// Copyright (c) 2016 Cheesecake Labs. All rights reserved.
//

import Foundation


protocol ArticlesOutput: class
{
    func receiveArticles(articles: [Article])
}
