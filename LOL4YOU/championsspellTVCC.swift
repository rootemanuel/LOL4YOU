//
//  championsspellTVCC.swift
//  LOL4YOU
//
//  Created by Emanuel Root on 27/11/17.
//  Copyright © 2017 Emanuel Root. All rights reserved.
//

import UIKit

class championsspellTVCC: UITableViewCell {

    @IBOutlet weak var lblDescriptionSpell: UILabel!
    @IBOutlet weak var lblRangeSpell: UILabel!
    @IBOutlet weak var lblCostSpell: UILabel!
    @IBOutlet weak var lblCdSpell: UILabel!
    @IBOutlet weak var lblNameSpell: UILabel!
    
    @IBOutlet weak var imgSpell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
