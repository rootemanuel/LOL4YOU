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
    var sizesPassive = [100];
    var sizesSpell = [0,0,0,0]
    
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
            return 14
        case 1:
            switch section {
            case 0:
                return 1
            case 1:
                return champ.speels.count
            default:
                return 0
            }
        case 2:
            return champ.skins.count
        default:
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        switch segControl.selectedSegmentIndex {
        case 0:
            return 1
        case 1:
            return 2
        case 2:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch segControl.selectedSegmentIndex {
        case 0:
            let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
                
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            
            switch indexPath.row {
            case 0:
                cell.item.text = "Armor"
                cell.valor.text = "\(champ.stats.armor)"
            case 1:
                cell.item.text = "Armor Per Level"
                cell.valor.text = "\(champ.stats.armorperlevel)"
            case 2:
                cell.item.text = "Attack Damage"
                cell.valor.text = "\(champ.stats.attackdamage)"
            case 3:
                cell.item.text = "Attack Damage Per Level"
                cell.valor.text = "\(champ.stats.attackspeedperlevel)"
            case 4:
                cell.item.text = "Attack Range"
                cell.valor.text = "\(champ.stats.attackrange)"
            case 5:
                cell.item.text = "Attack Speed"
                cell.valor.text = "\(champ.stats.attackspeedoffset)"
            case 6:
                cell.item.text = "Attack Speed Per Level"
                cell.valor.text = "\(champ.stats.attackspeedperlevel)"
            case 7:
                cell.item.text = "Crit"
                cell.valor.text = "\(champ.stats.crit)"
            case 8:
                cell.item.text = "Crit Per Level"
                cell.valor.text = "\(champ.stats.critperlevel)"
            case 9:
                cell.item.text = "Hp"
                cell.valor.text = "\(champ.stats.hp)"
            case 10:
                cell.item.text = "Hp Per Level"
                cell.valor.text = "\(champ.stats.hpperlevel)"
            case 11:
                cell.item.text = "Hp Regen"
                cell.valor.text = "\(champ.stats.hpregen)"
            case 12:
                cell.item.text = "Hp Regen Per Level"
                cell.valor.text = "\(champ.stats.hpregenperlevel)"
            case 13:
                cell.item.text = "Move Speed"
                cell.valor.text = "\(champ.stats.movespeed)"
            default:
                cell.item.text = ""
                cell.valor.text = ""
            }
            
            return cell
        case 1:
            switch indexPath.section {
            case 0:
                let cell = Bundle.main.loadNibNamed("championspassiveTVCC", owner: self, options: nil)?.first as! championspassiveTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                
                cell.lblPassiveName.text = champ.passiva_name
                cell.lblPassiveDescription.text = champ.passiva_descricao
                
                resizeCellPassive(cell: cell, indexPath: indexPath)
                
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
                cell.txtDescriptionSpell.text = spell.descricao
                
                resizeCellSpell(cell: cell, indexPath: indexPath)
                
                cell.imgSpell.sd_setImage(with: URL(string: spell.image_link), placeholderImage: nil)
                cell.imgSpell.layer.borderWidth = 1
                cell.imgSpell.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_BRILHANTE.rawValue).cgColor
                
                return cell
            default:
                let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                return cell
            }
        case 2:
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
            return 44
        case 1:
            switch indexPath.section {
            case 0:
                return CGFloat(self.sizesPassive[indexPath.row])
            case 1:
                return CGFloat(self.sizesSpell[indexPath.row])
            default:
                return 100
            }
        case 2:
            return 200
        default:
            return 44
        }
    }
    
    func initView(){
        let attnav = [
            NSAttributedStringKey.foregroundColor: UIColor(hex:rootclass.colors.BORDA_BRILHANTE.rawValue),
            NSAttributedStringKey.font: UIFont(name: "Friz Quadrata TT", size: 14)!
        ]
        
        self.segControl.setTitleTextAttributes(attnav, for: .normal)
    }
    
    func resizeCellSpell(cell:championsspellTVCC, indexPath: IndexPath){
        let width = cell.txtDescriptionSpell.frame.size.width
        let newsize = cell.txtDescriptionSpell.sizeThatFits(CGSize(width: width, height: CGFloat(MAXFLOAT)))
        var newframe = cell.txtDescriptionSpell.frame
            
        newframe.size = CGSize(width: CGFloat(fmaxf(Float(newsize.width), Float(width))), height: newsize.height)
        cell.txtDescriptionSpell.frame = newframe
        
        if cell.txtDescriptionSpell.frame.size.height < 65 {
            self.sizesSpell[indexPath.row] = Int(170)
        } else {
            self.sizesSpell[indexPath.row] = Int((170 + (cell.txtDescriptionSpell.frame.size.height - 65)))
        }
    }
    
    func resizeCellPassive(cell:championspassiveTVCC, indexPath: IndexPath){
        let width = cell.lblPassiveDescription.frame.size.width
        let newsize = cell.lblPassiveDescription.sizeThatFits(CGSize(width: width, height: CGFloat(MAXFLOAT)))
        var newframe = cell.lblPassiveDescription.frame
        
        newframe.size = CGSize(width: CGFloat(fmaxf(Float(newsize.width), Float(width))), height: newsize.height)
        cell.lblPassiveDescription.frame = newframe
        
        if cell.lblPassiveDescription.frame.size.height < 40 {
            self.sizesPassive[indexPath.row] = Int(100)
        } else {
            self.sizesPassive[indexPath.row] = Int((100 + (cell.lblPassiveDescription.frame.size.height - 40)))
        }
    }
    
    @IBAction func segControlChanged(_ sender: Any) {
        self.tableView.reloadData()
    }
}
