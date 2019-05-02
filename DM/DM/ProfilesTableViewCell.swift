//
//  ProfilesTableViewCell.swift
//  DM
//
//  Created by Alek Matthiessen on 5/1/19.
//  Copyright © 2019 The Matthiessen Group, LLC. All rights reserved.
//

import UIKit

class ProfilesTableViewCell: UITableViewCell {

    @IBOutlet weak var backl2: UILabel!
    @IBOutlet weak var backl: UILabel!
    @IBOutlet weak var locationalabel: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var descriptionlabel: UILabel!
    @IBOutlet weak var profileimage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        backl.layer.cornerRadius = 22
        backl.layer.masksToBounds = true
        
        backl2.layer.cornerRadius = 22
        backl2.layer.masksToBounds = true
        // Configure the view for the selected state
    }

}
