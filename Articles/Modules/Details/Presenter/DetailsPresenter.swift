//
//  DetailsPresenter.swift
//  Articles
//
//  Created by Pedro Henrique Prates Peralta on 3/26/16.
//  Copyright © 2017 Pedro Peralta. All rights reserved.
//

import Foundation

class DetailsPresenter : DetailsPresentation {

    weak var view: DetailsView?
    var wireframe: DetailsWireframe!
    var article: Article!

    func viewDidLoad() {
        view?.showDetails(forArticle: article)
    }
}
