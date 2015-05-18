//
//  CustomTableViewCell.swift
//  CUIApp
//
//  Created by Michael on 3/4/15.
//  Copyright (c) 2015 cuindependent. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    // Custom cell object labels
    @IBOutlet weak var articleTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}