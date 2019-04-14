//
//  AccountTableViewCell.swift
//  Together
//
//  Created by Alek Matthiessen on 4/10/19.
//  Copyright © 2019 AA Tech. All rights reserved.
//

import UIKit

class AccountTableViewCell: UITableViewCell {

    @IBOutlet weak var tapb1: UIButton!
    @IBOutlet weak var tapb2: UIButton!
    @IBOutlet weak var tapb3: UIButton!
    @IBOutlet weak var tapb4: UIButton!
    @IBOutlet weak var tapb5: UIButton!
    @IBOutlet weak var tapb6: UIButton!
    @IBOutlet weak var tapb7: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
