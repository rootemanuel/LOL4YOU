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
            switch section {
            case 0:
                return 1
            case 1:
                return champ.speels.count
            default:
                return 0
            }
        case 1:
            return champ.skins.count
        default:
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        switch segControl.selectedSegmentIndex {
        case 0:
            return 2
        case 1:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch segControl.selectedSegmentIndex {
        case 0:
            
            switch indexPath.section {
            case 0:
                let cell = Bundle.main.loadNibNamed("championspassiveTVCC", owner: self, options: nil)?.first as! championspassiveTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                
                cell.lblPassiveName.text = champ.passiva_name
                cell.lblPassiveDescription.text = champ.passiva_descricao
                
                cell.imgPassive.sd_setImage(with: URL(string: champ.passiva_link), placeholderImage: nil)
                cell.imgPassive.layer.borderWidth = 1
                cell.imgPassive.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_BRILHANTE.rawValue).cgColor
                
                return cell
            case 1:
                let cell = Bundle.main.loadNibNamed("championsspellTVCC", owner: self, options: nil)?.first as! championsspellTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                let spell = champ.speels[indexPath.row]
                
                cell.lblCdSpell.text = "\(spell.cooldown) seconds"
                cell.lblCostSpell.text = spell.custo
                cell.lblNameSpell.text = spell.name
                cell.lblRangeSpell.text = spell.alcance
                cell.lblDescriptionSpell.text = spell.descricao
                
                cell.imgSpell.sd_setImage(with: URL(string: spell.image_link), placeholderImage: nil)
                cell.imgSpell.layer.borderWidth = 1
                cell.imgSpell.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_BRILHANTE.rawValue).cgColor
                
                return cell
            default:
                let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                return cell
            }
        case 1:
            let cell = Bundle.main.loadNibNamed("championsskinTVCC", owner: self, options: nil)?.first as! championsskinTVCC
            
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            let skin = champ.skins[indexPath.row]
            
            cell.lblNameSkin.text = skin.name
            
            cell.imgSkin.sd_setImage(with: URL(string: skin.link), placeholderImage: nil)
            cell.imgSkin.layer.borderWidth = 1
            cell.imgSkin.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_BRILHANTE.rawValue).cgColor
            
            return cell
            
        default:
            let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch segControl.selectedSegmentIndex {
        case 0:
            switch indexPath.section {
            case 0:
                return 100
            case 1:
                return 170
            default:
                return 0
            }
        case 1:
            return 200
        default:
            return 44
        }
    }
    
    func initView(){
        let attnav = [
            NSForegroundColorAttributeName: UIColor(hex:rootclass.colors.BORDA_BRILHANTE.rawValue),
            NSFontAttributeName: UIFont(name: "Friz Quadrata TT", size: 14)!
        ]
        
        self.segControl.setTitleTextAttributes(attnav, for: .normal)
    }

    
    @IBAction func segControlChanged(_ sender: Any) {
        self.tableView.reloadData()
    }
}
