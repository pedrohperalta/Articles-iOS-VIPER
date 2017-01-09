//
//  ArticlesInteractorInput.swift
//  Articles
//
//  Created by Pedro Henrique Prates Peralta on 4/2/16.
//  Copyright © 2016 Pedro Peralta. All rights reserved.
//

import Foundation

protocol ArticlesInteractorInput: class {
    weak var output: ArticlesInteractorOutput! {get set}
    func fetchArticles()
}
