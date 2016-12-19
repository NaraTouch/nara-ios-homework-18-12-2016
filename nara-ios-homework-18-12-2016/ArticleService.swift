//
//  ArticleService.swift
//  nara-ios-homework-18-12-2016
//
//  Created by MrJ-The_JoKer on 12/18/16.
//  Copyright © 2016 MrJ-The_JoKer. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class ArticleService {
    var callerDelegate : ArticlePresenterInterface?
    func loadAllArticles(){
        
        let params : Parameters = [
            "title" : "",
            "page" : 1,
            "limit" : 15
        ]
        
        Alamofire.request(URL(string: GET_ALL_ARTICLE)!, method: HTTPMethod.get, parameters: params, encoding: URLEncoding.default, headers: HEADERS).responseArray(queue: nil, keyPath: "DATA", context: nil, completionHandler: { (response : DataResponse<[Article]>) in
            self.callerDelegate?.responseData(response.result.value!)
        })
    }
}
