//
//  ArticleFeedViewController.swift
//  CUIApp
//
//  Created by Michael on 2/16/15.
//  Copyright (c) 2015 cuindependent. All rights reserved.
//

import UIKit

class ArticleFeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NSXMLParserDelegate {
    
    // Identifier to use for the text cell in the tableview. This should be updated if the tableview text
    // cell identifier is updated.
    let cellIdentifier = "Cell"
    
    // TableView on the main screen
    @IBOutlet weak var tableView: UITableView!
    
    //Setup for parsing XML
    var parser: NSXMLParser = NSXMLParser()
    var articles: [Article] = []
    var articleTitle: String = String()
    var articleLink: String = String()
    var eName: String = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let url:NSURL = NSURL(string: "http://www.cuindependent.com/feed/rss2")!
        parser = NSXMLParser(contentsOfURL: url)!
        parser.delegate = self
        parser.parse()
    }
    
    //Parsing
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [NSObject : AnyObject]) {
        eName = elementName
        if elementName == "item" {
            articleTitle = String()
            articleLink = String()
        }
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String?) {
        let data = string!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        if (!data.isEmpty) {
            if eName == "title" {
                articleTitle += data
            } else if eName == "link" {
                articleLink += data
            }
        }
    }
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "item" {
            let article: Article = Article()
            article.title = articleTitle
            article.link = articleLink
            articles.append(article)
        }
    }
    
    //Setting titles
    
    override func viewWillAppear(animated: Bool) {
        navigationItem.title = "CU Independent"
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        navigationItem.title = "Feed"
    }

    //Memory warnings
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Tableview and custom cells
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return customCellAtIndexPath(indexPath)
    }
    
    func customCellAtIndexPath(indexPath:NSIndexPath) -> CustomTableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! CustomTableViewCell
        
        let row = indexPath.row

        cell.articleTitleLabel?.text = articles[row].title

        return cell
    }
}

