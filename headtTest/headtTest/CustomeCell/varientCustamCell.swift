//
//  varientCustamCell.swift
//  headtTest
//
//  Created by Jay Kumar on 7/14/18.
//  Copyright © 2018 Jay Kumar. All rights reserved.
//

import UIKit

class varientCustamCell: UITableViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var priceLable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
