//
//  DisplayModel.swift
//  nara-ios-homework-18-12-2016
//
//  Created by MrJ-The_JoKer on 12/18/16.
//  Copyright © 2016 MrJ-The_JoKer. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import AlamofireObjectMapper

class DisplayModel{
    
    var displayPresenterInterface : DisplayPresenterInterface?
    func loadData(){
        let params : Parameters = [
            "title" : "",
            "page" : 1,
            "limit" : 15
        ]
        Alamofire.request(URL(string: GET_ALL_ARTICLE)!, method: HTTPMethod.get, parameters: params, encoding: URLEncoding.default, headers: HEADERS).responseArray(queue: nil, keyPath: "DATA", context: nil, completionHandler: { (response : DataResponse<[Article]>) in
            self.displayPresenterInterface?.responseData(response.result.value!)
        })
    }
    func deleteArticleFromAPI(id:Int){
        
        Alamofire.request(URL(string: "\(DELETE_ARTICLE_BY_ID)/\(id)")!, method: HTTPMethod.delete, parameters: nil, encoding: URLEncoding.default, headers: HEADERS).responseJSON(completionHandler: {
            response in
            if let json = response.result.value as? [String:Any]{
                if json["CODE"] as! String  == "0000"{
                    self.displayPresenterInterface?.deleteSuccess()
                }
            }
        })
    }
}
