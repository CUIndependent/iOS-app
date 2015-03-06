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
    
    init(title: String, time: String) {
        self.title = title
        self.time = time
    }
}
