//
//  AddPresenter.swift
//  nara-ios-homework-18-12-2016
//
//  Created by MrJ-The_JoKer on 12/18/16.
//  Copyright © 2016 MrJ-The_JoKer. All rights reserved.
//

import Foundation
import UIKit

class AddPresenter{
    
    var addModel : AddModel?
    var addTableViewControllerInterface : AddTableViewControllerInterface?
    
    init() {
        addModel = AddModel()
        addModel?.addPresenterInterface = self
    }
    func uploadImage(image: UIImage){
        print("uploadImage")
        addModel?.uploadImage(image: image)
    }
    
    func postArticle(title: String, description:String, imageUrl: String){
        addModel?.postArticle(title: title, description: description, imageUrl: imageUrl)
    }
    
}

extension AddPresenter : AddPresenterInterface{
    func uploadImageSuccess(imageUrl: String) {
        print("uploadImageSuccess")
        addTableViewControllerInterface?.uploadImageSuccessWithURL(url: imageUrl)
    }
    
    func postArticleComplete(isSuccess: Bool, message: String) {
        if isSuccess{
            addTableViewControllerInterface?.postArticleSuccess(message: message)
        }else{
            addTableViewControllerInterface?.postArticleFail(message: message)
        }
    }
}
