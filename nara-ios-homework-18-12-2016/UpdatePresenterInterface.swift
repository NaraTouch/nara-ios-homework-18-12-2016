//
//  UpdatePresenterInterface.swift
//  nara-ios-homework-18-12-2016
//
//  Created by MrJ-The_JoKer on 12/18/16.
//  Copyright © 2016 MrJ-The_JoKer. All rights reserved.
//

import Foundation

protocol UpdatePresenterInterface {
    func uploadImageComplete(imageUrl: String)
    func updateComplete(message: String)
}
