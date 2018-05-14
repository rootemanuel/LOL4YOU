//
//  runesTVCC.swift
//  LOL4YOU
//
//  Created by Emanuel Root on 27/04/17.
//  Copyright © 2017 Emanuel Root. All rights reserved.
//

import UIKit

class runesTVCC: UITableViewCell, UITextViewDelegate{

    @IBOutlet weak var imgrune: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var desc: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.desc.delegate = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
