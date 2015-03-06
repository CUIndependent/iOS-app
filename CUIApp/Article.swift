//
//  Article.swift
//  CUIApp
//
//  Created by Michael on 3/3/15.
//  Copyright (c) 2015 cuindependent. All rights reserved.
//

import UIKit

class Article: NSObject {
    var title: String
    var time: String
    var image: UIImage
    
    init(title: String, time: String, image: UIImage) {
        self.title = title
        self.time = time
        self.image = image
    }
}
