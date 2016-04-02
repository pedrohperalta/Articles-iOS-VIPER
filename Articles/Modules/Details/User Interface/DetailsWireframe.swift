//
// Created by Pedro Henrique Prates Peralta on 3/26/16.
// Copyright (c) 2016 Cheesecake Labs. All rights reserved.
//

import UIKit


class DetailsWireframe : NSObject
{
    var article: Article!
    var detailsPresenter: DetailsPresenter!
    var presentedViewController: UIViewController!


    func presentDetailsInterfaceFromViewController(controller: UIViewController)
    {
        let detailsViewController = DetailsViewController()
        detailsViewController.presenter = self.detailsPresenter

        self.detailsPresenter.prepareDetailsInterfaceForPresentation(self.article)

        controller.navigationController!.pushViewController(detailsViewController, animated: true)

        self.presentedViewController = controller
    }
}
