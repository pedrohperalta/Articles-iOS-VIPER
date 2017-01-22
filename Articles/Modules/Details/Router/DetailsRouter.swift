//
//  DetailsRouter.swift
//  Articles
//
//  Created by Pedro Henrique Prates Peralta on 3/26/16.
//  Copyright © 2017 Pedro Peralta. All rights reserved.
//

import UIKit

class DetailsRouter: DetailsWireframe {
    
    static func assembleModule(_ article: Article) -> UIViewController {
        let view = R.storyboard.detailsStoryboard.detailsViewController()
        let presenter = DetailsPresenter()
        
        view?.presenter = presenter
        
        presenter.view = view
        presenter.article = article
        
        return view!
    }
}
