//
//  championspassiveTVCC.swift
//  LOL4YOU
//
//  Created by Emanuel Root on 27/11/17.
//  Copyright © 2017 Emanuel Root. All rights reserved.
//

import UIKit

class championspassiveTVCC: UITableViewCell, UITextViewDelegate{
    
    @IBOutlet weak var lblPassiveDescription: UITextView!
    @IBOutlet weak var lblPassiveName: UILabel!
    @IBOutlet weak var imgPassive: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.lblPassiveDescription.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
