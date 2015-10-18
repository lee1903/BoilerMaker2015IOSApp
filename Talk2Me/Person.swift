//
//  Person.swift
//  Talk2Me
//
//  Created by Ian Renfro on 10/17/15.
//  Copyright © 2015 SoloMin. All rights reserved.
//

import Foundation
import UIKit

struct Person {
    var image: UIImage;
    var name: String;
    var gender: String;
    var status: String;
    
    init(i: UIImage) {
        self.image = i;
        self.name = "name";
        self.gender = "1"
        self.status = "single"
    }

}

