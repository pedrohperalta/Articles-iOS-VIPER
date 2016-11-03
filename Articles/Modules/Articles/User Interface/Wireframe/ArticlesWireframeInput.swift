//
// Created by Pedro Henrique Prates Peralta on 4/2/16.
// Copyright (c) 2016 Pedro Peralta. All rights reserved.
//

import Foundation

protocol ArticlesWireframeInput {
    func presentArticlesSortOptions()
    func presentDetailsInterfaceForArticle(_ article: [String: Any])
}
