//
//  String+ Localized.swift
//  Challenge
//
//  Created by Pedro Henrique Prates Peralta on 3/25/16.
//  Copyright © 2016 Cheesecake Labs. All rights reserved.
//

import UIKit


extension String
{
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: NSBundle.mainBundle(), value: "", comment: "")
    }
}
