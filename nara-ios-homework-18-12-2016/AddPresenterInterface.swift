//
//  AddPresenterInterface.swift
//  nara-ios-homework-18-12-2016
//
//  Created by MrJ-The_JoKer on 12/18/16.
//  Copyright © 2016 MrJ-The_JoKer. All rights reserved.
//

import Foundation
protocol AddPresenterInterface {
    func uploadImageSuccess(imageUrl : String)
    func postArticleComplete(isSuccess: Bool, message: String)
}
