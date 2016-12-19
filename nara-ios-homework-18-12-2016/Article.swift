//
//  Article.swift
//  nara-ios-homework-18-12-2016
//
//  Created by MrJ-The_JoKer on 12/18/16.
//  Copyright © 2016 MrJ-The_JoKer. All rights reserved.
//

import Foundation
import ObjectMapper

struct Article:Mappable {
    var id:Int?
    var title:String?
    var description:String?
    var createDate: String?
    var status: String?
    var category: Category?
    var image: String?
    
    init?(map: Map) {
        
    }
    mutating func mapping(map: Map) {
        id          <- map["ID"]
        title       <- map["TITLE"]
        description <- map["DESCRIPTION"]
        createDate  <- map["CREATED_DATE"]
        status      <- map["STATUS"]
        category    <- map["CATEGORY"]
        image       <- map["IMAGE"]
    }
}
