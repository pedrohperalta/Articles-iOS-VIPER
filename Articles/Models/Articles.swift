//
//  Articles.swift
//  Challenge
//
//  Created by Pedro Henrique Prates Peralta on 3/16/16.
//  Copyright © 2017 Pedro Peralta. All rights reserved.
//

import Foundation
import ObjectMapper

struct Article {
    var date = ""
    var title = ""
    var website = ""
    var authors = ""
    var content = ""
    var imageUrl = ""
}

extension Article: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        title       <- map["title"]
        website     <- map["website"]
        authors     <- map["authors"]
        content     <- map["content"]
        imageUrl    <- map["image"]
        date        <- map["date"]
    }
}
