//
//  ViewProtocols.swift
//  Articles
//
//  Created by Pedro Henrique Prates Peralta on 21/01/17.
//  Copyright © 2017 Pedro Peralta. All rights reserved.
//

import Foundation

protocol ReusableView: class {}

protocol NibLoadableView: class { }

protocol IndicatableView: class {
    func showActivityIndicator()
    func hideActivityIndicator()
}
