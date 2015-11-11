//
//  SharedSingleton.swift
//  DecHex
//
//  Created by Toby Applegate on 10/11/2015.
//  Copyright © 2015 Toby Applegate. All rights reserved.
//

import Foundation


class SharedSingleton {
    var originalNumber: String?
    var errorMessage: String?
    var newHexNumber: String?
    var newDecNumber: String?
    static let  sharedInstance = SharedSingleton()
    
}