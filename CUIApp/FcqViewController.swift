//
//  FcqViewController.swift
//  CUIApp
//
//  Created by Michael on 4/7/15.
//  Copyright (c) 2015 cuindependent. All rights reserved.
//

import UIKit
import WebKit

class FcqViewController: UIViewController {
    
    @IBOutlet var containerView: UIView! = nil
    var webView: WKWebView?
    
    override func viewWillAppear(animated: Bool) {
        navigationItem.title = "FCQs"
    }
    
    override func loadView(){
        super.loadView()
        
        self.webView = WKWebView()
        self.view = self.webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var url = NSURL(string:"http://cufcq.com/")
        var req = NSURLRequest(URL:url!)
        self.webView!.loadRequest(req)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}