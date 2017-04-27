//
//  matchesstatsdetTVC.swift
//  LOL4YOU
//
//  Created by Emanuel Root on 27/04/17.
//  Copyright © 2017 Emanuel Root. All rights reserved.
//

import UIKit

class matchesstatsdetTVC: UITableViewController {

    var sections = ["Champion","Details"]
    
    let rt = rootclass.sharedInstance
    
    var participant = rootclass.BEParticipants()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initView()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                //Kills
                let cell = Bundle.main.loadNibNamed("imageTVCC", owner: self, options: nil)?.first as! imageTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                let champion = rt.listaChamp(id: participant.championId)
                if let img = UIImage(named:"champion_\(champion.key)") {
                    cell.img.image = img
                    cell.img.layer.borderWidth = 2
                    cell.img.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_BRILHANTE.rawValue).cgColor
                }
                
                return cell
            default:
                let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                
                return cell
            }
        case 1:
            switch indexPath.row {
            case 0:
                //Kills
                let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                cell.item.text = "Kills"
                cell.valor.text = "\(participant.stats.kills)"
                    
                return cell
            case 1:
                //Deaths
                let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                cell.item.text = "Deaths"
                cell.valor.text = "\(participant.stats.deaths)"
                
                return cell
            case 2:
                //Assists
                let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                cell.item.text = "Assists"
                cell.valor.text = "\(participant.stats.assists)"
                
                return cell
            case 3:
                //Double Kill
                let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                cell.item.text = "Double Kill"
                cell.valor.text = "\(participant.stats.doubleKills)"
                
                return cell
            case 4:
                //Triple Kill
                let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                cell.item.text = "Triple Kill"
                cell.valor.text = "\(participant.stats.tripleKills)"
                
                return cell
            case 5:
                //Quadra Kill
                let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                cell.item.text = "Quadra Kill"
                cell.valor.text = "\(participant.stats.quadraKills)"
                
                return cell
            case 6:
                //Penta Kill
                let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                cell.item.text = "Penta Kill"
                cell.valor.text = "\(participant.stats.pentaKills)"
                
                return cell
            case 7:
                //Minions Killed
                let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                cell.item.text = "Minions Killed"
                cell.valor.text = "\(participant.stats.minionsKilled + participant.stats.neutralMinionsKilled)"
                
                return cell
            case 8:
                //Minions Team Jungle
                let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                cell.item.text = "Minions Team Jungle"
                cell.valor.text = "\(participant.stats.neutralMinionsKilledTeamJungle)"
                
                return cell
            case 9:
                //Minions Enemy Jungle
                let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                cell.item.text = "Minions Enemy Jungle"
                cell.valor.text = "\(participant.stats.neutralMinionsKilledEnemyJungle)"
                
                return cell
            case 10:
                //Towers Killed
                let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                cell.item.text = "Towers Killed"
                cell.valor.text = "\(participant.stats.towerKills)"
                
                return cell
            case 11:
                //Wards Bought
                let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                cell.item.text = "Wards Bought"
                cell.valor.text = "\(participant.stats.visionWardsBoughtInGame)"
                
                return cell
            case 12:
                //Wards Placed
                let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                cell.item.text = "Wards Placed"
                cell.valor.text = "\(participant.stats.wardsPlaced)"
                
                return cell
            case 13:
                //Wards Killed
                let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                cell.item.text = "Wards Killed"
                cell.valor.text = "\(participant.stats.wardsKilled)"
                
                return cell
            default:
                let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                
                return cell
            }
        default:
            let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
            
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            
            return cell
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 14
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.backgroundColor = UIColor(hex: rootclass.colors.FUNDO_CLARO.rawValue)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let cell = self.tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerTVH")
        let cheader = cell as! headerTVH
        
        cheader.header.text = sections[section]
        cheader.header.backgroundColor = UIColor(hex: rootclass.colors.FUNDO_CLARO.rawValue)
        cheader.contentView.backgroundColor = UIColor(hex: rootclass.colors.FUNDO_CLARO.rawValue)
        cell?.backgroundView?.backgroundColor = UIColor(hex: rootclass.colors.FUNDO_CLARO.rawValue)
        cell?.backgroundColor = UIColor(hex: rootclass.colors.FUNDO_CLARO.rawValue)
        
        return cheader
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 150
        case 1:
            return 55
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "."
    }
    
    func initView(){
        let attnav = [
            NSForegroundColorAttributeName: UIColor(hex:rootclass.colors.TEXTO_TOP_BAR.rawValue),
            NSFontAttributeName: UIFont(name: "Friz Quadrata TT", size: 17)!
        ]
        
        let button = UIButton.init(type: .custom)
        button.setImage(UIImage(named:"static_button_back"), for: UIControlState.normal)
        button.addTarget(self, action:#selector(spopViewController), for: UIControlEvents.touchUpInside)
        button.frame = CGRect.init(x: 0, y: 0, width: 30, height: 30)
        let barButton = UIBarButtonItem.init(customView: button)
        self.navigationItem.leftBarButtonItem = barButton
        
        let nib = UINib(nibName: "headerTVH", bundle: nil)
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: "headerTVH")
        
        self.navigationController?.navigationBar.barTintColor = UIColor(hex: rootclass.colors.FUNDO.rawValue)
        self.navigationController?.navigationBar.titleTextAttributes = attnav
    }
    
    func spopViewController(){
        self.navigationController?.popViewController(animated: true)
    }
    
}