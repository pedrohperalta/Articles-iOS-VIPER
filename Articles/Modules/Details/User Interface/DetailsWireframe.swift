//
// Created by Pedro Henrique Prates Peralta on 3/26/16.
// Copyright (c) 2016 Cheesecake Labs. All rights reserved.
//

import UIKit


class DetailsWireframe : NSObject
{
    // MARK: Constants

    let storyboardName = "DetailsStoryboard"
    let detailsViewControllerIdentifier = "DetailsViewController"

    // MARK: Instance Variables

    var detailsPresenter: DetailsPresenter!


    // MARK: Public

    func presentArticleDetailsInterfaceFromViewController(controller: UIViewController)
    {
        let detailsViewController = self.detailsViewControllerFromStoryboard()
        detailsViewController.presenter = self.detailsPresenter
        controller.navigationController!.pushViewController(detailsViewController, animated: true)
    }


    // MARK: Private

    private func detailsViewControllerFromStoryboard() -> DetailsViewController
    {
        let storyboard = UIStoryboard(name: self.storyboardName, bundle: nil)
        let viewController = storyboard.instantiateViewControllerWithIdentifier(self.detailsViewControllerIdentifier) as! DetailsViewController
        return viewController
    }
}
