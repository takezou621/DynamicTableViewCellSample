//
//  CustomTableViewCell.swift
//  DynamicTableViewCellSample
//
//  Created by Takeshi Kawai on 2015/05/14.
//  Copyright (c) 2015年 Takeshi Kawai. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
