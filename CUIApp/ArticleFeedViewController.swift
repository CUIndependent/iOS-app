//
//  ArticleFeedViewController.swift
//  CUIApp
//
//  Created by Michael on 2/16/15.
//  Copyright (c) 2015 cuindependent. All rights reserved.
//

import UIKit

class ArticleFeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableData = [Article]()
    
    // Identifier to use for the text cell in the tableview. This should be updated if the tableview text
    // cell identifier is updated.
    let cellIdentifier = "Cell"
    
    // TableView on the main screen
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(animated: Bool) {
        navigationItem.title = "CU Independent"
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        navigationItem.title = "Feed"
        
        /*
        if segue.identifier == "ArticleViewController"{
            navigationItem.title = "Feed"
        }
        if segue.identifier == "MenuViewController"{
            navigationItem.title = nil
        }
        */
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        if (tableData.count > 0) {
            return
        } else {
            tableData.append(Article(title: "Buffs dominate Huskies, win in 64-47", time: "9:08 pm", image: UIImage(named: ("basketball1"))!))
            tableData.append(Article(title: "Women’s basketball advances in Pac-12 Tourney with win over USC", time: "3:28 pm", image: UIImage(named: ("basketball2"))!))
            tableData.append(Article(title: "Dear Domna: Technology has your whole relationship in its hands", time: "1:59 pm", image: UIImage(named: ("placeholder"))!))
            tableData.append(Article(title: "Jared to the Left: Netanyahu hits a new low in Washington, D.C.", time: "1:02 pm", image: UIImage(named: ("placeholder"))!))
            tableData.append(Article(title: "The CUI interviews Nick Frost", time: "11:47 am", image: UIImage(named: ("placeholder"))!))
            tableData.append(Article(title: "Keg Tap: Previewing the Pac-12 Tournaments", time: "11:33 am", image: UIImage(named: ("placeholder"))!))
            tableData.append(Article(title: "CUI Sports Interview Series: New York Times Writer John Branch", time: "11:03 am", image: UIImage(named: ("placeholder"))!))
            tableData.append(Article(title: "Buzz Aldrin and his vision for the future", time: "10:24 am", image: UIImage(named: ("placeholder"))!))
            tableData.append(Article(title: "The Schanfar Side: A little bit salty", time: "9:08 am", image: UIImage(named: ("placeholder"))!))
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
        return customCellAtIndexPath(indexPath)
    }
    
    func customCellAtIndexPath(indexPath:NSIndexPath) -> CustomTableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! CustomTableViewCell
        
        let row = indexPath.row
        
        cell.articleTitleLabel?.text = tableData[row].title
        cell.articleDateLabel?.text = tableData[row].time
        cell.articleImageView?.image = tableData[row].image
        
        return cell
    }


}

