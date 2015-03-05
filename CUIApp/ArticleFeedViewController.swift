//
//  ArticleFeedViewController.swift
//  CUIApp
//
//  Created by Michael on 2/16/15.
//  Copyright (c) 2015 cuindependent. All rights reserved.
//

import UIKit

class ArticleFeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableData = [Article]()
    
    // Identifier to use for the text cell in the tableview. This should be updated if the tableview text
    // cell identifier is updated.
    let textCellIdentifier = "TextCell"

    // TableView on the main screen
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "CU Independent"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        if (tableData.count > 0) {
            return
        } else {
            tableData.append(Article(title: "Buffs win basketball game", subtitle: "Record is now 12-14 for the season", time: "9:08 pm"))
            tableData.append(Article(title: "Buzz Aldrin talks at CU", subtitle: "Event held at Macky", time: "3:28 pm"))
            tableData.append(Article(title: "Title", subtitle: "Subtitle", time: "1:59 pm"))
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath) as UITableViewCell
        
        let row = indexPath.row
        
        // Setting the cells text to the corresponding data
        cell.textLabel.text = tableData[row].title
        cell.detailTextLabel?.text = tableData[row].time
        
        return cell
    }


}

