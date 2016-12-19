//
//  DisplayPresenter.swift
//  nara-ios-homework-18-12-2016
//
//  Created by MrJ-The_JoKer on 12/18/16.
//  Copyright © 2016 MrJ-The_JoKer. All rights reserved.
//

import Foundation
import UIKit

class DisplayPresenter{
    
    var displayModel:DisplayModel?
    var displayTableViewControllerInterface : DisplayTableViewControllerInterface?
    
    init() {
        displayModel = DisplayModel()
        displayModel?.displayPresenterInterface = self
    }

    func loadData(){
        print("loadData")
        displayModel?.loadData()
    }
    
    func deleteArticleWithID(id:Int){
        displayModel?.deleteArticleFromAPI(id:id)
    }
}

extension DisplayPresenter:DisplayPresenterInterface{
    func responseData(_ data: [Article]) {
        displayTableViewControllerInterface?.displayViewWithData(data)
    }
    func deleteSuccess() {
        displayTableViewControllerInterface?.deleteSuccess()
    }
}
