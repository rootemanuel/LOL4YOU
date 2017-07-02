//
//  perfilstatsTVC.swift
//  LOL4YOU
//
//  Created by Emanuel Root on 26/04/17.
//  Copyright © 2017 Emanuel Root. All rights reserved.
//

import UIKit
import GoogleMobileAds
import FirebaseAnalytics

class perfilstatsTVC: UITableViewController {

    let rt = rootclass.sharedInstance
    var stats = Array<rootclass.BEStats>()
    var tiers = Array<perfilstatusV>()
    
    let sections = ["Icon","Queues","Details","More Details"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initAdMob()
        self.initView()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let statsaux = self.stats.filter{p in p.championID == 0 }

        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                //Icon Image
                let cell = Bundle.main.loadNibNamed("imageTVCC", owner: self, options: nil)?.first as! imageTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                
                cell.img.sd_setImage(with: URL(string: rootclass.Summoner.imagelink), placeholderImage: UIImage(named: "static_null_all"))
                cell.img.layer.borderWidth = 4
                cell.img.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_BRILHANTE.rawValue).cgColor
                
                return cell
            default:
                let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                
                return cell
            }
            
        case 1:
            switch indexPath.row {
            case 0:
                //Tiers
                let cell = Bundle.main.loadNibNamed("perfilstatstiersnullTVCC", owner: self, options: nil)?.first as! perfilstatstiersnullTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                cell.tiers = self.tiers
                cell.updatescrollview()
                
                return cell
            default:
                let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                
                return cell
            }
        case 2:
            switch indexPath.row {
            case 0:
                //Kills
                let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                cell.item.text = "Kills"
                if statsaux.count > 0 {
                    cell.valor.text = "\(statsaux[0].kills)"
                } else {
                    cell.valor.text = rt.const_zeros_s
                }
                
                return cell
            case 1:
                //Deaths
                let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                cell.item.text = "Deaths"
                if statsaux.count > 0 {
                    cell.valor.text = "\(statsaux[0].deaths)"
                } else {
                    cell.valor.text = rt.const_zeros_s
                }
                
                return cell
            case 2:
                //Assists
                let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                cell.item.text = "Assists"
                if statsaux.count > 0 {
                    cell.valor.text = "\(statsaux[0].assists)"
                } else {
                    cell.valor.text = rt.const_zeros_s
                }
                
                return cell
            case 3:
                //Minions
                let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                cell.item.text = "Minions"
                if statsaux.count > 0 {
                    cell.valor.text = "\(statsaux[0].creeps)"
                } else {
                    cell.valor.text = rt.const_zeros_s
                }
                
                return cell
            case 4:
                //Gold
                let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                cell.item.text = "Gold"
                if statsaux.count > 0 {
                    cell.valor.text = "\(statsaux[0].gold)"
                } else {
                    cell.valor.text = rt.const_zeros_s
                }
                
                return cell
            default:
                let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                
                return cell
            }
        case 3:
            switch indexPath.row {
            case 0:
                //Wins
                let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                cell.item.text = "Wins"
                if statsaux.count > 0 {
                    cell.valor.text = "\(statsaux[0].win)"
                } else {
                    cell.valor.text = rt.const_zeros_s
                }
                
                return cell
            case 1:
                //Losses
                let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                cell.item.text = "Losses"
                if statsaux.count > 0 {
                    cell.valor.text = "\(statsaux[0].loss)"
                } else {
                    cell.valor.text = rt.const_zeros_s
                }
                
                return cell
            case 2:
                //Double Kill
                let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                cell.item.text = "Double Kill"
                if statsaux.count > 0 {
                    cell.valor.text = "\(statsaux[0].doublekill)"
                } else {
                    cell.valor.text = rt.const_zeros_s
                }
                
                return cell
            case 3:
                //Triple Kill
                let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                cell.item.text = "Triple Kill"
                if statsaux.count > 0 {
                    cell.valor.text = "\(statsaux[0].triplekill)"
                } else {
                    cell.valor.text = rt.const_zeros_s
                }
                
                return cell
            case 4:
                //Quadra Kill
                let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                cell.item.text = "Quadra Kill"
                if statsaux.count > 0 {
                    cell.valor.text = "\(statsaux[0].quadrakill)"
                } else {
                    cell.valor.text = rt.const_zeros_s
                }
                
                return cell
            case 5:
                //Penta Kill
                let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                cell.item.text = "Penta Kill"
                if statsaux.count > 0 {
                    cell.valor.text = "\(statsaux[0].pentakill)"
                } else {
                    cell.valor.text = rt.const_zeros_s
                }
                
                return cell
            case 6:
                //Turrets Kill
                let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                cell.item.text = "Turrets Kill"
                if statsaux.count > 0 {
                    cell.valor.text = "\(statsaux[0].turretskilled)"
                } else {
                    cell.valor.text = rt.const_zeros_s
                }
                
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
            return 1
        case 2:
            return 5
        case 3:
            return 7
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
            switch indexPath.row {
            case 0:
                return 150
            default:
                return 55
            }
        case 1:
            return 170
        case 2:
            return 55
        case 3:
            return 55
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "."
    }
    
    func initAdMob() {
        let request = GADRequest()
        request.testDevices = [kGADSimulatorID]
        
        Analytics.setScreenName(rootclass.screens.perfilstats, screenClass: String(describing: perfilstatsTVC.self))
        
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
        self.title = "Profile"
    }
    
    func spopViewController(){
        self.navigationController?.popViewController(animated: true)
    }

}
