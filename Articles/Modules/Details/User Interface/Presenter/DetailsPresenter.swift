//
// Created by Pedro Henrique Prates Peralta on 3/26/16.
// Copyright (c) 2016 Cheesecake Labs. All rights reserved.
//

import Foundation


class DetailsPresenter : DetailsModuleInterface
{
    // Instance Variables

    weak var view: DetailsViewInterface!
    var wireframe: DetailsWireframe!
    var article: Article!


    // MARK: DetailsModuleInterface

    func updateView()
    {
        self.view.showArticleDetails(self.article)
    }
}
