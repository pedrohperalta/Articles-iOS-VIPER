//
//  IndicatableViewExtension.swift
//  Articles
//
//  Created by Pedro Henrique Prates Peralta on 21/01/17.
//  Copyright © 2017 Pedro Peralta. All rights reserved.
//

import Foundation
import PKHUD

extension IndicatableView where Self: UIViewController {
    
    func showActivityIndicator() {
        HUD.show(.progress)
    }
    
    func hideActivityIndicator() {
        HUD.hide()
    }
}
