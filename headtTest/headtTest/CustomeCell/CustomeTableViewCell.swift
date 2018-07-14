//
//  CustomeTableViewCell.swift
//  headtTest
//
//  Created by Jay Kumar on 7/14/18.
//  Copyright © 2018 Jay Kumar. All rights reserved.
//

import UIKit

class CustomeTableViewCell: UITableViewCell {

    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productDate: UILabel!
    @IBOutlet weak var productNmae: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
