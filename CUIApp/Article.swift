//
//  Article.swift
//  CUIApp
//
//  Created by Michael on 3/3/15.
//  Copyright (c) 2015 cuindependent. All rights reserved.
//

import UIKit

class Article: NSObject {
    var title: String = String()
    var image: UIImage = UIImage()
    var descript: String = String()
    var link: String = String()
    var author: String = String()
    
    override init(){
        
    }
    
    init(title: String, link: String) {
        self.title = title
        self.link = link
    }
    
    init(title: String, descript: String, link: String, author: String){
        self.title = title
        self.descript = descript
        self.link = link
        self.author = author
    }
}
