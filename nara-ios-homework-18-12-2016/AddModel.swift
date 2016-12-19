//
//  AddModel.swift
//  nara-ios-homework-18-12-2016
//
//  Created by MrJ-The_JoKer on 12/18/16.
//  Copyright © 2016 MrJ-The_JoKer. All rights reserved.
//

import Foundation
import Alamofire

class AddModel{

    var addPresenterInterface : AddPresenterInterface?
    
    func uploadImage(image: UIImage){
        print("AF upload")
        Alamofire.upload(multipartFormData: { formData in
            let imageData = UIImageJPEGRepresentation(image, 1)
            formData.append(imageData!, withName: "FILE", fileName: "image.jpg", mimeType: "image/jpg")
            
        }, usingThreshold: 0, to: URL(string: UPLOAD_SINGLE_IMAGE)!, method: .post, headers: HEADERS, encodingCompletion: {
            
            encodingResult in
            print("AF respone")
            switch encodingResult {
            case .success(let upload, _, _):
                
                upload.responseJSON { response in
                    let value = response.result.value as! [String: AnyObject]
                    print("AF respone")
                    self.addPresenterInterface?.uploadImageSuccess(imageUrl: value["DATA"] as! String)
                }
                
            case .failure(let encodingError):
                print(encodingError)
            }
        })
    }
    
    func postArticle(title: String, description: String, imageUrl: String){
        
        let params : Parameters = [
            "TITLE": title,
            "DESCRIPTION": description,
            "AUTHOR": 0,
            "CATEGORY_ID": 0,
            "STATUS": "",
            "IMAGE": imageUrl
        ]
        
        Alamofire.request(URL(string: GET_ALL_ARTICLE)!, method: .post, parameters: params, encoding: JSONEncoding.default, headers: HEADERS).responseJSON(completionHandler: { response in
            
            if let value = response.result.value as? [String:AnyObject]{
                
                if (value["CODE"] as! String) == "0000"{
                    self.addPresenterInterface?.postArticleComplete(isSuccess: true, message: value["MESSAGE"] as! String)
                }else{
                    self.addPresenterInterface?.postArticleComplete(isSuccess: false, message: value["MESSAGE"] as! String)
                }
            }
        })
    }
}
