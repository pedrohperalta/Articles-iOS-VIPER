//
// Created by Pedro Henrique Prates Peralta on 3/20/16.
// Copyright (c) 2016 Cheesecake Labs. All rights reserved.
//

import UIKit


class RootWireframe : NSObject
{
    func showRootViewControllerInWindow(viewController: UIViewController, window: UIWindow)
    {
        let navigationController = window.rootViewController as! UINavigationController
        navigationController.viewControllers = [viewController]
    }
}
