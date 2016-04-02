//
// Created by Pedro Henrique Prates Peralta on 3/17/16.
// Copyright (c) 2016 Cheesecake Labs. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper


class ArticlesInteractor : ArticlesInteractorInput
{
    // MARK: Constants
    
    let url = "https://www.ckl.io/challenge"
    
    
    // MARK: Instance Variables
    
    weak var output: ArticlesInteractorOutput!


    // MARK: ArticlesInteractorInput
    
    func fetchArticles()
    {
        Alamofire.request(.GET, url).responseArray { (response: Response<[Article], NSError>) in

            let articlesArray = response.result.value
            self.output.articlesFetched(articlesArray!)
        }
    }
}
