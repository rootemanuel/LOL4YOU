//
//  specTVC.swift
//  LOL4YOU
//
//  Created by Emanuel Root on 08/10/17.
//  Copyright © 2017 Emanuel Root. All rights reserved.
//

import UIKit
import SVProgressHUD
import GoogleMobileAds
import FirebaseAnalytics

class specTVC: UITableViewController, GADBannerViewDelegate {

    let rt = rootclass.sharedInstance
    let admob = rootadmob.sharedInstance
    
    var spec = rootclass.BESpec()
    
    var sections = ["First Team","Second Team"]
    let static_cell_rows_count = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initAdMob()
        self.initView()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        admob.addCountAdMobInterstitial();
        
        if admob.showAdMobInterstitial() {
            if let adMobInterstitial = admob.getAdInterstitial() {
                adMobInterstitial.present(fromRootViewController: self)
                return
            }
        }
        
         if let cell = tableView.cellForRow(at: indexPath) {
            print("CELL SELECT - \(cell.tag)")
            let participant = spec.participants.filter{ p in p.summonerId == cell.tag }
            
            if participant.count > 0 {
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "specdet") as! specdetTVC
                
                vc.participant = participant[0]
                
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let fpart = spec.participants.filter{p in p.teamId == 100 }
        let fbans = spec.bans.filter{p in p.teamId == 100 }
        
        let spart = spec.participants.filter{p in p.teamId == 200 }
        let sbans = spec.bans.filter{p in p.teamId == 200 }
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                //Bans Champions
                let cell = Bundle.main.loadNibNamed("matchesdetbansTVCC", owner: self, options: nil)?.first as! matchesdetbansTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                
                if fbans.count > 0 {
                    if fbans.count > 0 {
                        for i in 0 ..< fbans.count {
                            switch i {
                            case 0:
                                let champ = rt.listaChamp(id: fbans[i].championId)
                                cell.imgchamp1.sd_setImage(with: URL(string: "\(rootclass.images.champion)\(champ.imagefull)"), placeholderImage: UIImage(named: "static_null_all"))
                                cell.imgchamp1.layer.borderWidth = 1
                                cell.imgchamp1.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_BRILHANTE.rawValue).cgColor
                            case 1:
                                let champ = rt.listaChamp(id: fbans[i].championId)
                                cell.imgchamp2.sd_setImage(with: URL(string: "\(rootclass.images.champion)\(champ.imagefull)"), placeholderImage: UIImage(named: "static_null_all"))
                                cell.imgchamp2.layer.borderWidth = 1
                                cell.imgchamp2.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_BRILHANTE.rawValue).cgColor
                            case 2:
                                let champ = rt.listaChamp(id: fbans[i].championId)
                                cell.imgchamp3.sd_setImage(with: URL(string: "\(rootclass.images.champion)\(champ.imagefull)"), placeholderImage: UIImage(named: "static_null_all"))
                                cell.imgchamp3.layer.borderWidth = 1
                                cell.imgchamp3.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_BRILHANTE.rawValue).cgColor
                            case 3:
                                let champ = rt.listaChamp(id: fbans[i].championId)
                                cell.imgchamp4.sd_setImage(with: URL(string: "\(rootclass.images.champion)\(champ.imagefull)"), placeholderImage: UIImage(named: "static_null_all"))
                                cell.imgchamp4.layer.borderWidth = 1
                                cell.imgchamp4.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_BRILHANTE.rawValue).cgColor
                            case 4:
                                let champ = rt.listaChamp(id: fbans[i].championId)
                                cell.imgchamp5.sd_setImage(with: URL(string: "\(rootclass.images.champion)\(champ.imagefull)"), placeholderImage: UIImage(named: "static_null_all"))
                                cell.imgchamp5.layer.borderWidth = 1
                                cell.imgchamp5.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_BRILHANTE.rawValue).cgColor
                            default:
                                continue
                            }
                        }
                    } else {
                        cell.imgchamp1.isHidden = true
                        cell.imgchamp2.isHidden = true
                        cell.imgchamp3.isHidden = true
                        cell.imgchamp4.isHidden = true
                        cell.imgchamp5.isHidden = true
                    }
                } else {
                    cell.imgchamp1.isHidden = true
                    cell.imgchamp2.isHidden = true
                    cell.imgchamp3.isHidden = true
                    cell.imgchamp4.isHidden = true
                    cell.imgchamp5.isHidden = true
                }
                
                return cell
            case (1...5):
                //Spec Champions
                let cell = Bundle.main.loadNibNamed("specTVCC", owner: self, options: nil)?.first as! specTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                
                if fpart.count > 0 {
                    
                    cell.tag = fpart[indexPath.row - static_cell_rows_count].summonerId
                    
                    let champmastery = UIImage(named:"static_mastery_\(fpart[indexPath.row - static_cell_rows_count].maestry.championLevel)")
                    cell.imgMaestry.image = champmastery
                    
                    let champ = rt.listaChamp(id: fpart[indexPath.row - static_cell_rows_count].championId)
                    cell.imgChamp.sd_setImage(with: URL(string: "\(rootclass.images.champion)\(champ.imagefull)"), placeholderImage: UIImage(named: "static_null_all"))
                    cell.imgChamp.layer.borderWidth = 1
                    cell.imgChamp.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_BRILHANTE.rawValue).cgColor
                    
                    let spell1 = rt.listaSpeel(id: fpart[indexPath.row - static_cell_rows_count].spell1Id)
                    cell.imgSpell1.sd_setImage(with: URL(string: "\(spell1.imagelink)"), placeholderImage: UIImage(named: "static_null"))
                    cell.imgSpell1.layer.borderWidth = 1
                    cell.imgSpell1.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
                        
                    let spell2 = rt.listaSpeel(id: fpart[indexPath.row - static_cell_rows_count].spell2Id)
                    cell.imgSpell2.sd_setImage(with: URL(string: "\(spell2.imagelink)"), placeholderImage: UIImage(named: "static_null"))
                    cell.imgSpell2.layer.borderWidth = 1
                    cell.imgSpell2.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
                        
                    cell.txtSummonerName.text = fpart[indexPath.row - static_cell_rows_count].summonerName
                    
                    let league = fpart[indexPath.row - static_cell_rows_count].leagues
                    if league.count > 0 {
                        cell.imgTier.image = UIImage(named: "tier_\(league[0].tier.lowercased())\(league[0].division)")
                        cell.txtTier.text = "\(league[0].tier) \(league[0].division)"
                        cell.txtWins.text = "Wins: \(league[0].wins)"
                        cell.txtLoses.text = "Losses: \(league[0].losses)"
                    }
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
                    //Bans Champions
                    let cell = Bundle.main.loadNibNamed("matchesdetbansTVCC", owner: self, options: nil)?.first as! matchesdetbansTVCC
                    
                    cell.selectionStyle = UITableViewCellSelectionStyle.none
                    
                    if sbans.count > 0 {
                        if sbans.count > 0 {
                            for i in 0 ..< sbans.count {
                                switch i {
                                case 0:
                                    let champ = rt.listaChamp(id: sbans[i].championId)
                                    cell.imgchamp1.sd_setImage(with: URL(string: "\(rootclass.images.champion)\(champ.imagefull)"), placeholderImage: UIImage(named: "static_null_all"))
                                    cell.imgchamp1.layer.borderWidth = 1
                                    cell.imgchamp1.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_BRILHANTE.rawValue).cgColor
                                case 1:
                                    let champ = rt.listaChamp(id: sbans[i].championId)
                                    cell.imgchamp2.sd_setImage(with: URL(string: "\(rootclass.images.champion)\(champ.imagefull)"), placeholderImage: UIImage(named: "static_null_all"))
                                    cell.imgchamp2.layer.borderWidth = 1
                                    cell.imgchamp2.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_BRILHANTE.rawValue).cgColor
                                case 2:
                                    let champ = rt.listaChamp(id: sbans[i].championId)
                                    cell.imgchamp3.sd_setImage(with: URL(string: "\(rootclass.images.champion)\(champ.imagefull)"), placeholderImage: UIImage(named: "static_null_all"))
                                    cell.imgchamp3.layer.borderWidth = 1
                                    cell.imgchamp3.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_BRILHANTE.rawValue).cgColor
                                case 3:
                                    let champ = rt.listaChamp(id: sbans[i].championId)
                                    cell.imgchamp4.sd_setImage(with: URL(string: "\(rootclass.images.champion)\(champ.imagefull)"), placeholderImage: UIImage(named: "static_null_all"))
                                    cell.imgchamp4.layer.borderWidth = 1
                                    cell.imgchamp4.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_BRILHANTE.rawValue).cgColor
                                case 4:
                                    let champ = rt.listaChamp(id: sbans[i].championId)
                                    cell.imgchamp5.sd_setImage(with: URL(string: "\(rootclass.images.champion)\(champ.imagefull)"), placeholderImage: UIImage(named: "static_null_all"))
                                    cell.imgchamp5.layer.borderWidth = 1
                                    cell.imgchamp5.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_BRILHANTE.rawValue).cgColor
                                default:
                                    continue
                                }
                            }
                        } else {
                            cell.imgchamp1.isHidden = true
                            cell.imgchamp2.isHidden = true
                            cell.imgchamp3.isHidden = true
                            cell.imgchamp4.isHidden = true
                            cell.imgchamp5.isHidden = true
                        }
                    } else {
                        cell.imgchamp1.isHidden = true
                        cell.imgchamp2.isHidden = true
                        cell.imgchamp3.isHidden = true
                        cell.imgchamp4.isHidden = true
                        cell.imgchamp5.isHidden = true
                    }
                    
                    return cell
                case (1...5):
                    //Spec Champions
                    let cell = Bundle.main.loadNibNamed("specTVCC", owner: self, options: nil)?.first as! specTVCC
                    
                    cell.selectionStyle = UITableViewCellSelectionStyle.none
                    
                    if spart.count > 0 {
                        
                        cell.tag = spart[indexPath.row - static_cell_rows_count].summonerId
                        
                        let champmastery = UIImage(named:"static_mastery_\(spart[indexPath.row - static_cell_rows_count].maestry.championLevel)")
                        cell.imgMaestry.image = champmastery
                        
                        let champ = rt.listaChamp(id: spart[indexPath.row - static_cell_rows_count].championId)
                        cell.imgChamp.sd_setImage(with: URL(string: "\(rootclass.images.champion)\(champ.imagefull)"), placeholderImage: UIImage(named: "static_null_all"))
                        cell.imgChamp.layer.borderWidth = 2
                        cell.imgChamp.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_BRILHANTE.rawValue).cgColor
                            
                        let spell1 = rt.listaSpeel(id: spart[indexPath.row - static_cell_rows_count].spell1Id)
                        cell.imgSpell1.sd_setImage(with: URL(string: "\(spell1.imagelink)"), placeholderImage: UIImage(named: "static_null"))
                        cell.imgSpell1.layer.borderWidth = 1
                        cell.imgSpell1.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
                            
                        let spell2 = rt.listaSpeel(id: spart[indexPath.row - static_cell_rows_count].spell2Id)
                        cell.imgSpell2.sd_setImage(with: URL(string: "\(spell2.imagelink)"), placeholderImage: UIImage(named: "static_null"))
                        cell.imgSpell2.layer.borderWidth = 1
                        cell.imgSpell2.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
                            
                        cell.txtSummonerName.text = spart[indexPath.row - static_cell_rows_count].summonerName
                        
                        let league = spart[indexPath.row - static_cell_rows_count].leagues
                        if league.count > 0 {
                            cell.imgTier.image = UIImage(named: "tier_\(league[0].tier.lowercased())\(league[0].division)")
                            cell.txtTier.text = "\(league[0].tier) \(league[0].division)"
                            cell.txtWins.text = "Wins: \(league[0].wins)"
                            cell.txtLoses.text = "Losses: \(league[0].losses)"
                        }
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
            return 6
        case 1:
            return 6
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if section == 0 {
            view.backgroundColor = UIColor(hex: rootclass.colors.TEXTO_VITORIA.rawValue)
        } else {
            view.backgroundColor = UIColor(hex: rootclass.colors.TEXTO_DERROTA.rawValue)
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let cell = self.tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerTVH")
        let cheader = cell as! headerTVH
        
        if section == 0 {
            cheader.header.text = sections[section]
            cheader.contentView.backgroundColor = UIColor(hex: rootclass.colors.TEXTO_VITORIA.rawValue)
            cheader.header.backgroundColor = UIColor(hex: rootclass.colors.TEXTO_VITORIA.rawValue)
            cheader.contentView.backgroundColor = UIColor(hex: rootclass.colors.TEXTO_VITORIA.rawValue)
            cell?.backgroundView?.backgroundColor = UIColor(hex: rootclass.colors.TEXTO_VITORIA.rawValue)
            cell?.backgroundColor = UIColor(hex: rootclass.colors.TEXTO_VITORIA.rawValue)
        } else {
            cheader.header.text = sections[section]
            cheader.contentView.backgroundColor = UIColor(hex: rootclass.colors.TEXTO_DERROTA.rawValue)
            cheader.header.backgroundColor = UIColor(hex: rootclass.colors.TEXTO_DERROTA.rawValue)
            cheader.contentView.backgroundColor = UIColor(hex: rootclass.colors.TEXTO_DERROTA.rawValue)
            cell?.backgroundView?.backgroundColor = UIColor(hex: rootclass.colors.TEXTO_DERROTA.rawValue)
            cell?.backgroundColor = UIColor(hex: rootclass.colors.TEXTO_DERROTA.rawValue)
        }
        
        return cheader
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                return 55
            case (1...5):
                return 115
            default:
                return 95
            }
        case 1:
            switch indexPath.row {
            case 0:
                return 55
            case (1...5):
                return 115
            default:
                return 95
            }
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
        
        self.title = "Spectador"
    }
    
    func initAdMob() {
        Analytics.setScreenName(rootclass.screens.spectador, screenClass: String(describing: specTVC.self))
        
        if rt.viewbanner {
            
            let adBannerView = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait)
            adBannerView.adUnitID = rootadmob.admob.admob_banner
            adBannerView.delegate = self
            adBannerView.rootViewController = self
            adBannerView.load(GADRequest())
            
            self.tableView.tableHeaderView = adBannerView
        }
    }
    
    func spopViewController(){
        self.navigationController?.popViewController(animated: true)
    }

}
