//
// Created by Pedro Henrique Prates Peralta on 3/19/16.
// Copyright (c) 2016 Cheesecake Labs. All rights reserved.
//

import UIKit


extension UIFont
{
    @nonobjc static let kDefaultFontThin = "HelveticaNeue-Thin"


    class func regularFontWithSize(size: CGFloat) -> UIFont
    {
        return UIFont(name: UIFont.kDefaultFontThin, size: size)!
    }
}
