//
//  championstableTVCC.swift
//  LOL4YOU
//
//  Created by Emanuel Root on 25/11/17.
//  Copyright © 2017 Emanuel Root. All rights reserved.
//

import UIKit

class championstableTVCC: UITableViewCell, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segControl: UISegmentedControl!
    
    var champ = rootclass.staticchampions()
    
    let items = ["123","345"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.initView()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch segControl.selectedSegmentIndex {
        case 0:
            return items.count
        case 1:
            return items.count
        case 2:
            return champ.skins.count
        default:
            return 0
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch segControl.selectedSegmentIndex {
        case 0:
            let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
            
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            cell.item.text = items[indexPath.row]
            
            return cell
        case 1:
            let cell = Bundle.main.loadNibNamed("runesTVCC", owner: self, options: nil)?.first as! runesTVCC
            
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            cell.desc.text = items[indexPath.row]
            
            return cell
            
        case 2:
            let cell = Bundle.main.loadNibNamed("championsskinTVCC", owner: self, options: nil)?.first as! championsskinTVCC
            
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            
            cell.imgSkin.sd_setImage(with: URL(string: champ.skins[indexPath.row].link), placeholderImage: nil)
            cell.imgSkin.layer.borderWidth = 1
            cell.imgSkin.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_BRILHANTE.rawValue).cgColor

            cell.lblNameSkin.text = champ.skins[indexPath.row].name
            
            return cell
        default:
            let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
            
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            cell.item.text = items[indexPath.row]
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch segControl.selectedSegmentIndex {
        case 0:
            return 44
        case 1:
            return 60
        case 2:
            return 200
        default:
            return 44
        }
    }
    
    func initView(){
        let attnav = [
            NSForegroundColorAttributeName: UIColor(hex:rootclass.colors.TEXTO_TOP_BAR.rawValue),
            NSFontAttributeName: UIFont(name: "Friz Quadrata TT", size: 12)!
        ]
        
        self.segControl.setTitleTextAttributes(attnav, for: .normal)
    }

    
    @IBAction func segControlChanged(_ sender: Any) {
        self.tableView.reloadData()
    }
}
