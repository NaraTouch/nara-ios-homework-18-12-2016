//
//  AddTableViewController.swift
//  nara-ios-homework-18-12-2016
//
//  Created by MrJ-The_JoKer on 12/18/16.
//  Copyright © 2016 MrJ-The_JoKer. All rights reserved.
//

import Foundation
import Alamofire
class UploadTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var addPresenter : AddPresenter?
    
    @IBOutlet weak var uplaoadImageView: UIImageView!
    @IBOutlet weak var uploadDescriptionLabel: UITextField!
    @IBOutlet weak var uploadTittleLabel: UITextField!
    
    @IBAction func buttonBrowsePictures(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        uplaoadImageView.image = image
      
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func buttonSavePicture(_ sender: Any) {
        print("aaa")
        let img = self.uplaoadImageView.image
        addPresenter?.uploadImage(image: img!)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addPresenter = AddPresenter()
        addPresenter?.addTableViewControllerInterface = self
    }
    
    
}

extension UploadTableViewController: AddTableViewControllerInterface{
    func uploadImageSuccessWithURL(url: String) {
   
        print("my url ", url)
        addPresenter?.postArticle(title: uploadTittleLabel.text!, description: uploadDescriptionLabel.text!, imageUrl: url)
    }
    
    func postArticleSuccess(message: String) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    func postArticleFail(message: String) {
        print(message)
    }
    
    
}
