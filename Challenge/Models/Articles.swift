//
//  Articles.swift
//  Challenge
//
//  Created by Pedro Henrique Prates Peralta on 3/16/16.
//  Copyright © 2016 Cheesecake Labs. All rights reserved.
//

import Foundation
import ObjectMapper


class Article : Mappable
{
    var date: String?
    var title: String?
    var website: String?
    var authors: String?
    var content: String?
    var imageUrl: String?


    required init?(_ map: Map) {
    }


    func mapping(map: Map) {
        title       <- map["title"]
        website     <- map["website"]
        authors     <- map["authors"]
        content     <- map["content"]
        imageUrl    <- map["image"]
        date        <- map["date"]
    }
}
