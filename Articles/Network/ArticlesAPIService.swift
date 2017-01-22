//
//  ArticlesAPIService.swift
//  Articles
//
//  Created by Pedro Henrique Prates Peralta on 21/01/17.
//  Copyright © 2017 Pedro Peralta. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import RxSwift

class ArticlesApiService {
    
    static func fetchArticles() -> Observable<[Article]> {
        return Observable<[Article]>.create { observer -> Disposable in
            let request = Alamofire
                .request(Endpoints.Articles.fetch.url, method: .get)
                .validate()
                .responseArray(completionHandler: { (response: DataResponse<[Article]>) in
                    switch response.result {
                    case .success(let articles):
                        observer.onNext(articles)
                        observer.onCompleted()
                        
                    case .failure(let error):
                        observer.onError(error)
                    }
                })
            
            return Disposables.create(with: { 
                request.cancel()
            })
        }
    }
}
