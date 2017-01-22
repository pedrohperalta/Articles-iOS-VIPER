//
//  NibLoadableViewExtension.swift
//  Articles
//
//  Created by Pedro Henrique Prates Peralta on 21/01/17.
//  Copyright © 2017 Pedro Peralta. All rights reserved.
//

import UIKit

extension NibLoadableView where Self: UIView {
    
    static var NibName: String {
        return String(describing: self)
    }
}
