//
//  ArticlesInteractor.swift
//  Articles
//
//  Created by Pedro Henrique Prates Peralta on 3/17/16.
//  Copyright © 2017 Pedro Peralta. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import RxSwift

class ArticlesInteractor: ArticlesUseCase {
    
    weak var output: ArticlesInteractorOutput!
    private var disposeBag = DisposeBag()
    
    func fetchArticles() {
        ArticlesApiService
            .fetchArticles()
            .subscribe(
                onNext: { articles in
                    self.output.articlesFetched(articles)
                },
                onError: { error in
                    self.output.articlesFetchFailed()
                }
            )
            .addDisposableTo(disposeBag)
    }
}
