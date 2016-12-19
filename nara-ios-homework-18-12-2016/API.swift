//
//  API.swift
//  nara-ios-homework-18-12-2016
//
//  Created by MrJ-The_JoKer on 12/18/16.
//  Copyright © 2016 MrJ-The_JoKer. All rights reserved.
//

import Foundation
import Alamofire

let BASE_URL = "http://120.136.24.174:1301"
let GET_ALL_ARTICLE = BASE_URL + "/v1/api/articles"
let DELETE_ARTICLE_BY_ID = GET_ALL_ARTICLE

let HEADERS : HTTPHeaders = ["Authorization" : "Basic QU1TQVBJQURNSU46QU1TQVBJUEBTU1dPUkQ="]
let UPLOAD_SINGLE_IMAGE = BASE_URL + "/v1/api/uploadfile/single"
