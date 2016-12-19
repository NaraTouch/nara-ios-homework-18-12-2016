//
//  Category.swift
//  nara-ios-homework-18-12-2016
//
//  Created by MrJ-The_JoKer on 12/18/16.
//  Copyright © 2016 MrJ-The_JoKer. All rights reserved.
//

import Foundation
import ObjectMapper

struct Category:Mappable {
    var id:Int?
    var name:String?
    init?(map: Map) {
        
    }
    mutating func mapping(map: Map) {
        id    <- map["ID"]
        name <- map["NAME"]
        
    }
}
