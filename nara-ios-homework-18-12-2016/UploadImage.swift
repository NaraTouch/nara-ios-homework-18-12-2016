//
//  UploadImage.swift
//  nara-ios-homework-18-12-2016
//
//  Created by MrJ-The_JoKer on 12/18/16.
//  Copyright © 2016 MrJ-The_JoKer. All rights reserved.
//

import Foundation
import ObjectMapper
struct UploadImage:Mappable {
    var code:String?
    var message:String?
    var data:String?
    init?(map: Map) {
        
    }
}
extension UploadImage {
    mutating func mapping(map: Map) {
        code    <- map["CODE"]
        message <- map["MESSAGE"]
        data    <- map["DATA"]
    }
    
}

