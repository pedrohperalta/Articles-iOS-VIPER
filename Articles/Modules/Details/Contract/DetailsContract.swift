//
//  DetailsContract.swift
//  Articles
//
//  Created by Pedro Henrique Prates Peralta on 21/01/17.
//  Copyright © 2017 Pedro Peralta. All rights reserved.
//

import UIKit

protocol DetailsView: class {
    var presenter: DetailsPresentation! { get set }
    
    func showDetails(forArticle article: Article)
}

protocol DetailsPresentation: class {
    weak var view: DetailsView? { get set }
    
    func viewDidLoad()
}

protocol DetailsWireframe: class {
    static func assembleModule(_ article: Article) -> UIViewController
}
