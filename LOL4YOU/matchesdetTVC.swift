//
//  matchesdetTVC.swift
//  LOL4YOU
//
//  Created by Emanuel Root on 24/04/17.
//  Copyright © 2017 Emanuel Root. All rights reserved.
//

import UIKit
import SVProgressHUD
import GoogleMobileAds
import FirebaseAnalytics

class matchesdetTVC: UITableViewController, GADBannerViewDelegate{
    
    let rt = rootclass.sharedInstance
    let admob = rootadmob.sharedInstance
    
    var matchdet = rootclass.BEMatch()
    var matchdetsmall = rootclass.BEMatchSmall()
    
    var sections = ["Winning Team","Losing Team"]
    let static_cell_rows_count = 9

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
        
        switch indexPath.row {
        case (9...13):
            if let cell = tableView.cellForRow(at: indexPath) {
                let participant = matchdet.participants.filter{ p in p.participantId == cell.tag }
                let summoner = matchdet.participantsIdentities.filter{ p in p.participantId == cell.tag }
                if participant.count > 0 {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "matchesstatsdet") as! matchesstatsdetTVC
                    
                    vc.participant = participant[0]
                    
                    if summoner.count > 0 {
                        if summoner[0].summonerName.isEmpty {
                            let champ = rt.listaChamp(id: participant[0].championId)
                            vc.title = champ.name
                        } else {
                            vc.title = "\(summoner[0].summonerName)"
                        }
                    }
                    
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        default:
            print("ROOT - DEFAULT - DIDSELCT")
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let twinner = matchdet.teams.filter{p in p.win == "Win" }
        let tlosing = matchdet.teams.filter{p in p.win == "Fail" }
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                //First Blood
                let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                cell.item.text = "First Blood"
                if twinner.count > 0 {
                    if twinner[0].firstBlood {
                        cell.valor.text = "Yes"
                    } else {
                        cell.valor.text = "No"
                    }
                } else {
                    cell.valor.text = "No"
                }
                
                return cell
            case 1:
                //First Tower
                let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                cell.item.text = "First Tower"
                if twinner.count > 0 {
                    if twinner[0].firstTower {
                        cell.valor.text = "Yes"
                    } else {
                        cell.valor.text = "No"
                    }
                } else {
                    cell.valor.text = "No"
                }
                
                return cell
            case 2:
                //First Baron
                let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                cell.item.text = "First Baron"
                if twinner.count > 0 {
                    if twinner[0].firstBaron {
                        cell.valor.text = "Yes"
                    } else {
                        cell.valor.text = "No"
                    }
                } else {
                    cell.valor.text = "No"
                }
                
                return cell
            case 3:
                //First Dragon
                let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                cell.item.text = "First Dragon"
                if twinner.count > 0 {
                    if twinner[0].firstDragon {
                        cell.valor.text = "Yes"
                    } else {
                        cell.valor.text = "No"
                    }
                } else {
                    cell.valor.text = "No"
                }
                
                return cell
            case 4:
                //Inhibitor Kills
                let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                cell.item.text = "Inhibitor Kills"
                if twinner.count > 0 {
                    cell.valor.text = "\(twinner[0].inhibitorKills)"
                } else {
                    cell.valor.text = rt.const_zeros_s
                }

                return cell
            case 5:
                //Tower Kills
                let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                cell.item.text = "Tower Kills"
                if twinner.count > 0 {
                    cell.valor.text = "\(twinner[0].towerKills)"
                } else {
                    cell.valor.text = rt.const_zeros_s
                }
                
                return cell
            case 6:
                //Baron Kills
                let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                cell.item.text = "Baron Kills"
                if twinner.count > 0 {
                    cell.valor.text = "\(twinner[0].baronKills)"
                } else {
                    cell.valor.text = rt.const_zeros_s
                }
                
                return cell
            case 7:
                //Dragon Kills
                let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                cell.item.text = "Dragon Kills"
                if twinner.count > 0 {
                    cell.valor.text = "\(twinner[0].dragonKills)"
                } else {
                    cell.valor.text = rt.const_zeros_s
                }
                
                return cell
            case 8:
                //Bans Champions
                let cell = Bundle.main.loadNibNamed("matchesdetbansTVCC", owner: self, options: nil)?.first as! matchesdetbansTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                if twinner.count > 0 {
                    if twinner[0].bans.count > 0 {
                        for i in 0 ..< twinner[0].bans.count {
                            switch i {
                            case 0:
                                let champ = rt.listaChamp(id: twinner[0].bans[0].championId)
                                cell.imgchamp1.sd_setImage(with: URL(string: "\(rootclass.images.champion)\(champ.imagefull)"), placeholderImage: UIImage(named: "static_null_all"))
                                cell.imgchamp1.layer.borderWidth = 1
                                cell.imgchamp1.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_BRILHANTE.rawValue).cgColor
                            case 1:
                                let champ = rt.listaChamp(id: twinner[0].bans[1].championId)
                                cell.imgchamp2.sd_setImage(with: URL(string: "\(rootclass.images.champion)\(champ.imagefull)"), placeholderImage: UIImage(named: "static_null_all"))
                                cell.imgchamp2.layer.borderWidth = 1
                                cell.imgchamp2.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_BRILHANTE.rawValue).cgColor
                            case 2:
                                let champ = rt.listaChamp(id: twinner[0].bans[2].championId)
                                cell.imgchamp3.sd_setImage(with: URL(string: "\(rootclass.images.champion)\(champ.imagefull)"), placeholderImage: UIImage(named: "static_null_all"))
                                cell.imgchamp3.layer.borderWidth = 1
                                cell.imgchamp3.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_BRILHANTE.rawValue).cgColor
                            case 3:
                                let champ = rt.listaChamp(id: twinner[0].bans[3].championId)
                                cell.imgchamp4.sd_setImage(with: URL(string: "\(rootclass.images.champion)\(champ.imagefull)"), placeholderImage: UIImage(named: "static_null_all"))
                                cell.imgchamp4.layer.borderWidth = 1
                                cell.imgchamp4.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_BRILHANTE.rawValue).cgColor
                            case 4:
                                let champ = rt.listaChamp(id: twinner[0].bans[4].championId)
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
            default:
                let cell = Bundle.main.loadNibNamed("matchesdetplayersTVCC", owner: self, options: nil)?.first as! matchesdetplayersTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                
                let tstats = matchdet.participants.filter{ p in p.stats.win == true }
                
                if tstats.count > 0 {
                    if (indexPath.row - static_cell_rows_count) < tstats.count {
                        let summoner = rt.listaChamp(id: tstats[indexPath.row - static_cell_rows_count].championId)
                        let tsummonername = matchdet.participantsIdentities.filter{ p in p.participantId == tstats[indexPath.row - static_cell_rows_count].participantId }
                        
                        cell.tag = tstats[indexPath.row - static_cell_rows_count].participantId
                        
                        if tsummonername.count > 0 {
                            if tsummonername[0].summonerName.isEmpty {
                                cell.summonername.text = summoner.name
                            } else {
                                cell.summonername.text = tsummonername[0].summonerName
                            }
                        }
                        
                        cell.kda.text = "\(tstats[indexPath.row - static_cell_rows_count].stats.kills)/\(tstats[indexPath.row - static_cell_rows_count].stats.deaths)/\(tstats[indexPath.row - static_cell_rows_count].stats.assists)"
                        cell.minions.text = "\(tstats[indexPath.row - static_cell_rows_count].stats.totalMinionsKilled + tstats[indexPath.row - static_cell_rows_count].stats.neutralMinionsKilled)"
                        
                        if tstats[indexPath.row - static_cell_rows_count].stats.goldEarned >= 1000 {
                            cell.gold.text = String(format:"%.1f K", Double(tstats[indexPath.row - static_cell_rows_count].stats.goldEarned) / Double(1000))
                        } else {
                            cell.gold.text = String(format:"%.1f K", Double(tstats[indexPath.row - static_cell_rows_count].stats.goldEarned))
                        }
                        
                        if tstats[indexPath.row - static_cell_rows_count].stats.champLevel > 0 {
                            
                            cell.imglvl.isHidden = false
                            cell.lvl.isHidden = false
                            
                            cell.lvl.text = "\(tstats[indexPath.row - static_cell_rows_count].stats.champLevel)"
                            cell.imglvl.backgroundColor = UIColor(hex: rootclass.colors.FUNDO.rawValue)
                            cell.imglvl.layer.borderWidth = 1
                            cell.imglvl.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
                        }
                        
                    
                        cell.imgchampion.sd_setImage(with: URL(string: summoner.imagelink), placeholderImage: UIImage(named: "static_null_all"))
                        cell.imgchampion.layer.borderWidth = 2
                        cell.imgchampion.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_BRILHANTE.rawValue).cgColor
                        
                        cell.imgitem0.sd_setImage(with: URL(string: tstats[indexPath.row - static_cell_rows_count].stats.item0imagelink), placeholderImage: UIImage(named: "static_null"))
                        cell.imgitem0.layer.borderWidth = 1
                        cell.imgitem0.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
                        
                        cell.imgitem1.sd_setImage(with: URL(string: tstats[indexPath.row - static_cell_rows_count].stats.item1imagelink), placeholderImage: UIImage(named: "static_null"))
                        cell.imgitem1.layer.borderWidth = 1
                        cell.imgitem1.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
                        
                        cell.imgitem2.sd_setImage(with: URL(string: tstats[indexPath.row - static_cell_rows_count].stats.item2imagelink), placeholderImage: UIImage(named: "static_null"))
                        cell.imgitem2.layer.borderWidth = 1
                        cell.imgitem2.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
                        
                        cell.imgitem3.sd_setImage(with: URL(string: tstats[indexPath.row - static_cell_rows_count].stats.item3imagelink), placeholderImage: UIImage(named: "static_null"))
                        cell.imgitem3.layer.borderWidth = 1
                        cell.imgitem3.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
                        
                        cell.imgitem4.sd_setImage(with: URL(string: tstats[indexPath.row - static_cell_rows_count].stats.item4imagelink), placeholderImage: UIImage(named: "static_null"))
                        cell.imgitem4.layer.borderWidth = 1
                        cell.imgitem4.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
                        
                        cell.imgitem5.sd_setImage(with: URL(string: tstats[indexPath.row - static_cell_rows_count].stats.item5imagelink), placeholderImage: UIImage(named: "static_null"))
                        cell.imgitem5.layer.borderWidth = 1
                        cell.imgitem5.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
                        
                        cell.imgtrinket.sd_setImage(with: URL(string: tstats[indexPath.row - static_cell_rows_count].stats.item6imagelink), placeholderImage: UIImage(named: "static_null"))
                        cell.imgtrinket.layer.borderWidth = 1
                        cell.imgtrinket.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
                        
                        let spell1 = rt.listaSpeel(id: tstats[indexPath.row - static_cell_rows_count].spell1Id)
                        cell.imgtlt0.sd_setImage(with: URL(string: "\(spell1.imagelink)"), placeholderImage: UIImage(named: "static_null"))
                        cell.imgtlt0.layer.borderWidth = 1
                        cell.imgtlt0.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
                        
                        let spell2 = rt.listaSpeel(id: tstats[indexPath.row - static_cell_rows_count].spell2Id)
                        cell.imgtlt1.sd_setImage(with: URL(string: "\(spell2.imagelink)"), placeholderImage: UIImage(named: "static_null"))
                        cell.imgtlt1.layer.borderWidth = 1
                        cell.imgtlt1.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
                        
                        let masterys = tstats[indexPath.row - static_cell_rows_count].masterys
                        
                        let masteryf = masterys.filter{
                            
                            if ($0.masteryId == 6161 ||
                                $0.masteryId == 6162 ||
                                $0.masteryId == 6164 ||
                                $0.masteryId == 6363 ||
                                $0.masteryId == 6362 ||
                                $0.masteryId == 6361 ||
                                $0.masteryId == 6263 ||
                                $0.masteryId == 6262 ||
                                $0.masteryId == 6261 ) {
                                return true
                            } else {
                                return false
                            }
                        }
                        
                        if masteryf.count > 0 {
                            let mastery = rt.listaMastery(id: masteryf[0].masteryId)
                            cell.imgtltmast.sd_setImage(with: URL(string: "\(mastery.imagelink)"), placeholderImage: UIImage(named: "static_null"))
                            cell.imgtltmast.layer.borderWidth = 1
                            cell.imgtltmast.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor

                        } else {
                            cell.imgtltmast.isHidden = true
                        }
                    }
                }
                return cell
            }
        case 1:
            switch indexPath.row {
            case 0:
                //First Blood
                let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                cell.item.text = "First Blood"
                if tlosing.count > 0 {
                    if tlosing[0].firstBlood {
                        cell.valor.text = "Yes"
                    } else {
                        cell.valor.text = "No"
                    }
                } else {
                    cell.valor.text = "No"
                }
                
                return cell
            case 1:
                //First Tower
                let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                cell.item.text = "First Tower"
                if tlosing.count > 0 {
                    if tlosing[0].firstTower {
                        cell.valor.text = "Yes"
                    } else {
                        cell.valor.text = "No"
                    }
                } else {
                    cell.valor.text = "No"
                }
                
                return cell
            case 2:
                //First Baron
                let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                cell.item.text = "First Baron"
                if tlosing.count > 0 {
                    if tlosing[0].firstBaron {
                        cell.valor.text = "Yes"
                    } else {
                        cell.valor.text = "No"
                    }
                } else {
                    cell.valor.text = "No"
                }
                
                return cell
            case 3:
                //First Dragon
                let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                cell.item.text = "First Dragon"
                if tlosing.count > 0 {
                    if tlosing[0].firstDragon {
                        cell.valor.text = "Yes"
                    } else {
                        cell.valor.text = "No"
                    }
                } else {
                    cell.valor.text = "No"
                }
                
                return cell
            case 4:
                //Inhibitor Kills
                let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                cell.item.text = "Inhibitor Kills"
                if tlosing.count > 0 {
                    cell.valor.text = "\(tlosing[0].inhibitorKills)"
                } else {
                    cell.valor.text = rt.const_zeros_s
                }
                
                
                return cell
            case 5:
                //Tower Kills
                let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                cell.item.text = "Tower Kills"
                if tlosing.count > 0 {
                    cell.valor.text = "\(tlosing[0].towerKills)"
                } else {
                    cell.valor.text = rt.const_zeros_s
                }
                
                return cell
            case 6:
                //Baron Kills
                let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                cell.item.text = "Baron Kills"
                if tlosing.count > 0 {
                    cell.valor.text = "\(tlosing[0].baronKills)"
                } else {
                    cell.valor.text = rt.const_zeros_s
                }
                
                return cell
            case 7:
                //Dragon Kills
                let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                cell.item.text = "Dragon Kills"
                if tlosing.count > 0 {
                    cell.valor.text = "\(tlosing[0].dragonKills)"
                } else {
                    cell.valor.text = rt.const_zeros_s
                }
                
                return cell
            case 8:
            //Bans Champions
                //Bans Champions
                let cell = Bundle.main.loadNibNamed("matchesdetbansTVCC", owner: self, options: nil)?.first as! matchesdetbansTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                if tlosing.count > 0 {
                    if tlosing[0].bans.count > 0 {
                        for i in 0 ..< tlosing[0].bans.count {
                            switch i {
                            case 0:
                                let champ = rt.listaChamp(id: tlosing[0].bans[0].championId)
                                cell.imgchamp1.sd_setImage(with: URL(string: "\(rootclass.images.champion)\(champ.imagefull)"), placeholderImage: UIImage(named: "static_null_all"))
                                cell.imgchamp1.layer.borderWidth = 1
                                cell.imgchamp1.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_BRILHANTE.rawValue).cgColor
                            case 1:
                                let champ = rt.listaChamp(id: tlosing[0].bans[1].championId)
                                cell.imgchamp2.sd_setImage(with: URL(string: "\(rootclass.images.champion)\(champ.imagefull)"), placeholderImage: UIImage(named: "static_null_all"))
                                cell.imgchamp2.layer.borderWidth = 1
                                cell.imgchamp2.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_BRILHANTE.rawValue).cgColor
                            case 2:
                                let champ = rt.listaChamp(id: tlosing[0].bans[2].championId)
                                cell.imgchamp3.sd_setImage(with: URL(string: "\(rootclass.images.champion)\(champ.imagefull)"), placeholderImage: UIImage(named: "static_null_all"))
                                cell.imgchamp3.layer.borderWidth = 1
                                cell.imgchamp3.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_BRILHANTE.rawValue).cgColor
                            case 3:
                                let champ = rt.listaChamp(id: tlosing[0].bans[3].championId)
                                cell.imgchamp4.sd_setImage(with: URL(string: "\(rootclass.images.champion)\(champ.imagefull)"), placeholderImage: UIImage(named: "static_null_all"))
                                cell.imgchamp4.layer.borderWidth = 1
                                cell.imgchamp4.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_BRILHANTE.rawValue).cgColor
                            case 4:
                                let champ = rt.listaChamp(id: tlosing[0].bans[4].championId)
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
            default:
                let cell = Bundle.main.loadNibNamed("matchesdetplayersTVCC", owner: self, options: nil)?.first as! matchesdetplayersTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                
                let tstats = matchdet.participants.filter{ p in p.stats.win == false }
                
                if tstats.count > 0 {
                    if (indexPath.row - static_cell_rows_count) < tstats.count {
                        let summoner = rt.listaChamp(id: tstats[indexPath.row - static_cell_rows_count].championId)
                        let tsummonername = matchdet.participantsIdentities.filter{ p in p.participantId == tstats[indexPath.row - static_cell_rows_count].participantId }
                        
                        cell.tag = tstats[indexPath.row - static_cell_rows_count].participantId
                        
                        if tsummonername.count > 0 {
                            if tsummonername[0].summonerName.isEmpty {
                                cell.summonername.text = summoner.name
                            } else {
                                cell.summonername.text = tsummonername[0].summonerName
                            }
                        }
                    
                        cell.kda.text = "\(tstats[indexPath.row - static_cell_rows_count].stats.kills)/\(tstats[indexPath.row - static_cell_rows_count].stats.deaths)/\(tstats[indexPath.row - static_cell_rows_count].stats.assists)"
                        cell.minions.text = "\(tstats[indexPath.row - static_cell_rows_count].stats.totalMinionsKilled + tstats[indexPath.row - static_cell_rows_count].stats.neutralMinionsKilled)"
                        
                        if tstats[indexPath.row - static_cell_rows_count].stats.goldEarned >= 1000 {
                            cell.gold.text = String(format:"%.1f K", Double(tstats[indexPath.row - static_cell_rows_count].stats.goldEarned) / Double(1000))
                        } else {
                            cell.gold.text = String(format:"%.1f K", Double(tstats[indexPath.row - static_cell_rows_count].stats.goldEarned))
                        }
                        
                        if tstats[indexPath.row - static_cell_rows_count].stats.champLevel > 0 {
                            
                            cell.imglvl.isHidden = false
                            cell.lvl.isHidden = false
                            
                            cell.lvl.text = "\(tstats[indexPath.row - static_cell_rows_count].stats.champLevel)"
                            cell.imglvl.backgroundColor = UIColor(hex: rootclass.colors.FUNDO.rawValue)
                            cell.imglvl.layer.borderWidth = 1
                            cell.imglvl.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
                        }
                        
                        cell.imgchampion.sd_setImage(with: URL(string: summoner.imagelink), placeholderImage: UIImage(named: "static_null_all"))
                        cell.imgchampion.layer.borderWidth = 2
                        cell.imgchampion.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_BRILHANTE.rawValue).cgColor
                        
                        cell.imgitem0.sd_setImage(with: URL(string: tstats[indexPath.row - static_cell_rows_count].stats.item0imagelink), placeholderImage: UIImage(named: "static_null"))
                        cell.imgitem0.layer.borderWidth = 1
                        cell.imgitem0.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
                        
                        cell.imgitem1.sd_setImage(with: URL(string: tstats[indexPath.row - static_cell_rows_count].stats.item1imagelink), placeholderImage: UIImage(named: "static_null"))
                        cell.imgitem1.layer.borderWidth = 1
                        cell.imgitem1.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
                        
                        cell.imgitem2.sd_setImage(with: URL(string: tstats[indexPath.row - static_cell_rows_count].stats.item2imagelink), placeholderImage: UIImage(named: "static_null"))
                        cell.imgitem2.layer.borderWidth = 1
                        cell.imgitem2.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
                        
                        cell.imgitem3.sd_setImage(with: URL(string: tstats[indexPath.row - static_cell_rows_count].stats.item3imagelink), placeholderImage: UIImage(named: "static_null"))
                        cell.imgitem3.layer.borderWidth = 1
                        cell.imgitem3.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
                        
                        cell.imgitem4.sd_setImage(with: URL(string: tstats[indexPath.row - static_cell_rows_count].stats.item4imagelink), placeholderImage: UIImage(named: "static_null"))
                        cell.imgitem4.layer.borderWidth = 1
                        cell.imgitem4.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
                        
                        cell.imgitem5.sd_setImage(with: URL(string: tstats[indexPath.row - static_cell_rows_count].stats.item5imagelink), placeholderImage: UIImage(named: "static_null"))
                        cell.imgitem5.layer.borderWidth = 1
                        cell.imgitem5.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
                        
                        cell.imgtrinket.sd_setImage(with: URL(string: tstats[indexPath.row - static_cell_rows_count].stats.item6imagelink), placeholderImage: UIImage(named: "static_null"))
                        cell.imgtrinket.layer.borderWidth = 1
                        cell.imgtrinket.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
                        
                        let spell1 = rt.listaSpeel(id: tstats[indexPath.row - static_cell_rows_count].spell1Id)
                        cell.imgtlt0.sd_setImage(with: URL(string: "\(spell1.imagelink)"), placeholderImage: UIImage(named: "static_null"))
                        cell.imgtlt0.layer.borderWidth = 1
                        cell.imgtlt0.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
                        
                        let spell2 = rt.listaSpeel(id: tstats[indexPath.row - static_cell_rows_count].spell2Id)
                        cell.imgtlt1.sd_setImage(with: URL(string: "\(spell2.imagelink)"), placeholderImage: UIImage(named: "static_null"))
                        cell.imgtlt1.layer.borderWidth = 1
                        cell.imgtlt1.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
                        
                        let masterys = tstats[indexPath.row - static_cell_rows_count].masterys
                        
                        let masteryf = masterys.filter{
                            
                            if ($0.masteryId == 6161 ||
                                $0.masteryId == 6162 ||
                                $0.masteryId == 6164 ||
                                $0.masteryId == 6363 ||
                                $0.masteryId == 6362 ||
                                $0.masteryId == 6361 ||
                                $0.masteryId == 6263 ||
                                $0.masteryId == 6262 ||
                                $0.masteryId == 6261 ) {
                                return true
                            } else {
                                return false
                            }
                        }
                        
                        if masteryf.count > 0 {
                            let mastery = rt.listaMastery(id: masteryf[0].masteryId)
                            cell.imgtltmast.sd_setImage(with: URL(string: "\(mastery.imagelink)"), placeholderImage: UIImage(named: "static_null"))
                            cell.imgtltmast.layer.borderWidth = 1
                            cell.imgtltmast.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
                            
                        } else {
                            cell.imgtltmast.isHidden = true
                        }
                    }
                }
                
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
            return 14
        case 1:
            return 14
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
            case (0...7):
                return 44
            case 8:
                 return 55
            default:
                return 95
            }
        case 1:
            switch indexPath.row {
            case (0...7):
                return 44
            case 8:
                return 55
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
            NSAttributedStringKey.foregroundColor: UIColor(hex:rootclass.colors.TEXTO_TOP_BAR.rawValue),
            NSAttributedStringKey.font: UIFont(name: "Friz Quadrata TT", size: 17)!
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
        
        self.title = "Match Details"
    }
    
    func initAdMob() {
        Analytics.setScreenName(rootclass.screens.matchesdet, screenClass: String(describing: matchesdetTVC.self))
        
        if rt.viewbanner {
            
            let adBannerView = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait)
            adBannerView.adUnitID = rootadmob.admob.admob_banner
            adBannerView.delegate = self
            adBannerView.rootViewController = self
            adBannerView.load(GADRequest())
            
            self.tableView.tableHeaderView = adBannerView
        }
    }
    
    @objc func spopViewController(){
        self.navigationController?.popViewController(animated: true)
    }
}
