//
//  Endpoints.swift
//  Articles
//
//  Created by Pedro Henrique Prates Peralta on 21/01/17.
//  Copyright © 2017 Pedro Peralta. All rights reserved.
//

import Foundation

struct API {
    static let baseUrl = "https://www.ckl.io"
}

protocol Endpoint {
    var path: String { get }
    var url: String { get }
}

enum Endpoints {
    
    enum Articles: Endpoint {
        case fetch
        
        public var path: String {
            switch self {
            case .fetch: return "/challenge/"
            }
        }
        
        public var url: String {
            switch self {
            case .fetch: return "\(API.baseUrl)\(path)"
            }
        }
    }
}
