//
// Created by Pedro Henrique Prates Peralta on 3/26/16.
// Copyright (c) 2016 Cheesecake Labs. All rights reserved.
//

import UIKit

class DetailsWireframe {
    
    // MARK: Constants

    let storyboardName = "DetailsStoryboard"
    let detailsViewControllerIdentifier = "DetailsViewController"

    // MARK: Instance Variables

    weak var detailsViewController: DetailsViewController!
    var detailsPresenter: DetailsPresenter!

    // MARK: Public
    
    init() {
        detailsPresenter = DetailsPresenter()
    }

    func presentArticleDetailsInterfaceFromViewController(_ controller: UIViewController) {
        detailsViewController = detailsViewControllerFromStoryboard()
        detailsViewController.presenter = detailsPresenter
        detailsPresenter.view = detailsViewController
        detailsPresenter.wireframe = self
        controller.navigationController!.pushViewController(detailsViewController, animated: true)
    }

    // MARK: Private

    private func detailsViewControllerFromStoryboard() -> DetailsViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: detailsViewControllerIdentifier) as! DetailsViewController
        return viewController
    }
}
