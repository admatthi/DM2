//
//  CoachTableViewCell.swift
//  Together
//
//  Created by Alek Matthiessen on 4/10/19.
//  Copyright © 2019 AA Tech. All rights reserved.
//

import UIKit

var proimage2 = UIImage()

class CoachTableViewCell: UITableViewCell {

    @IBOutlet weak var proimage: UIImageView!
    @IBOutlet weak var clientsl: UILabel!
    @IBOutlet weak var yearsl: UILabel!
    @IBOutlet weak var approachl: UILabel!
    @IBOutlet weak var focusl: UILabel!
    @IBOutlet weak var descriptionl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
