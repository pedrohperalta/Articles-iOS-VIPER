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
    func localized() -> String
    {
        return NSLocalizedString(self, tableName: nil, bundle: NSBundle.mainBundle(), value: "", comment: "")
    }


    func convertToDictionary() -> [String:AnyObject]?
    {
        if let data = self.dataUsingEncoding(NSUTF8StringEncoding) {
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers) as? [String:AnyObject]
                return json
            } catch {
                print("Something went wrong")
            }
        }

        return nil
    }
}
