//
//  UpdatePresenter.swift
//  nara-ios-homework-18-12-2016
//
//  Created by MrJ-The_JoKer on 12/18/16.
//  Copyright © 2016 MrJ-The_JoKer. All rights reserved.
//

import Foundation
import UIKit

class UpdatePresenter{
    
    
    var updateModel = UpdateModel()
    var updateTableViewControllerInterface:UpdateTableViewControllerInterface?
    
    init() {
        updateModel = UpdateModel()
        updateModel.updatePresenterInterface = self
    }
    
    
    func uploadImage(image: UIImage){
        updateModel.uploadImage(image: image)
    }
    
    func updateArticle(id:Int, title:String, description:String, imageUrl:String){
        updateModel.updateArticle(id: id, title: title, description: description, imageUrl: imageUrl)
    }
    
}

extension UpdatePresenter : UpdatePresenterInterface{
    func uploadImageComplete(imageUrl: String) {
        updateTableViewControllerInterface?.uploadImageSuccessWith(url: imageUrl)
    }
    
    func updateComplete(message: String) {
        updateTableViewControllerInterface?.updateComplete(message: message)
    }
}
