//
//  ArticlePresenter.swift
//  nara-ios-homework-18-12-2016
//
//  Created by MrJ-The_JoKer on 12/18/16.
//  Copyright © 2016 MrJ-The_JoKer. All rights reserved.
//

import Foundation
import UIKit

class ArticlePresenter{
    
    var articleService : ArticleService?
    var articleViewDelegate : ArticleViewDelegate?
    
    init(){
        articleService = ArticleService()
        articleService?.callerDelegate = self
    }
    
    func loadAllArticle(){
        articleService?.loadAllArticles()
    }
}

extension ArticlePresenter : ArticlePresenterInterface{
    func responseData(_ data: [Article]) {
        // Response data to view
        articleViewDelegate?.updateViewWithData(data)
    }
}

