//
//  TableViewCell.swift
//  melbourne1
//
//  Created by zihaowang on 18/08/2016.
//  Copyright © 2016 zihaowang. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var tableImageView: UIImageView!
    @IBOutlet weak var nameL: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
