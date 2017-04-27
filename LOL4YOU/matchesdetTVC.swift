//
//  matchesdetTVC.swift
//  LOL4YOU
//
//  Created by Emanuel Root on 24/04/17.
//  Copyright © 2017 Emanuel Root. All rights reserved.
//

import UIKit
import SVProgressHUD

class matchesdetTVC: UITableViewController {
    
    let rt = rootclass.sharedInstance
    var matchdet = rootclass.BEMatch()
    var matchdetsmall = rootclass.BEMatchSmall()
    
    var sections = ["Winning Team","Losing Team"]
    let static_cell_rows_count = 9

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initView()
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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
                            let champion = rt.listaChamp(id: participant[0].championId)
                            vc.title = champion.name
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

        let twinner = matchdet.teams.filter{p in p.winner == true }
        let tlosing = matchdet.teams.filter{p in p.winner == false }
        
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
                                cell.imgchamp1.image = UIImage(named:"champion_\(champ.key)")
                                cell.imgchamp1.layer.borderWidth = 1
                                cell.imgchamp1.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_BRILHANTE.rawValue).cgColor
                            case 1:
                                let champ = rt.listaChamp(id: twinner[0].bans[1].championId)
                                cell.imgchamp2.image = UIImage(named:"champion_\(champ.key)")
                                cell.imgchamp2.layer.borderWidth = 1
                                cell.imgchamp2.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_BRILHANTE.rawValue).cgColor
                            case 2:
                                let champ = rt.listaChamp(id: twinner[0].bans[2].championId)
                                cell.imgchamp3.image = UIImage(named:"champion_\(champ.key)")
                                cell.imgchamp3.layer.borderWidth = 1
                                cell.imgchamp3.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_BRILHANTE.rawValue).cgColor
                            default:
                                print("R00T - INVALID")
                            }
                        }
                    } else {
                        cell.imgchamp1.isHidden = true
                        cell.imgchamp2.isHidden = true
                        cell.imgchamp3.isHidden = true
                    }
                } else {
                    cell.imgchamp1.isHidden = true
                    cell.imgchamp2.isHidden = true
                    cell.imgchamp3.isHidden = true
                }
                
                return cell
            default:
                let cell = Bundle.main.loadNibNamed("matchesdetplayersTVCC", owner: self, options: nil)?.first as! matchesdetplayersTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                cell.imgchampion.image = UIImage(named:"static_null")
                cell.imgitem0.image = UIImage(named:"static_null")
                cell.imgitem1.image = UIImage(named:"static_null")
                cell.imgitem2.image = UIImage(named:"static_null")
                cell.imgitem3.image = UIImage(named:"static_null")
                cell.imgitem4.image = UIImage(named:"static_null")
                cell.imgitem5.image = UIImage(named:"static_null")
                cell.imgtrinket.image = UIImage(named:"static_null")
                cell.imgtlt0.image = UIImage(named:"static_null")
                cell.imgtlt1.image = UIImage(named:"static_null")
                cell.imgtltmast.image = UIImage(named:"static_null")
                
                let tstats = matchdet.participants.filter{ p in p.stats.winner == true }
                
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
                        cell.minions.text = "\(tstats[indexPath.row - static_cell_rows_count].stats.minionsKilled + tstats[indexPath.row - static_cell_rows_count].stats.neutralMinionsKilled)"
                        
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
                        
                        if let imgchamp = UIImage(named:"champion_\(summoner.key)") {
                            cell.imgchampion.isHidden = false
                            cell.imgchampion.image = imgchamp
                            cell.imgchampion.layer.borderWidth = 2
                            cell.imgchampion.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_BRILHANTE.rawValue).cgColor
                        }
                        
                        if let imgitem0 = UIImage(named:"item_\(tstats[indexPath.row - static_cell_rows_count].stats.item0)") {
                            cell.imgitem0.image = imgitem0
                            cell.imgitem0.layer.borderWidth = 1
                            cell.imgitem0.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
                        }
                        
                        if let imgitem1 = UIImage(named:"item_\(tstats[indexPath.row - static_cell_rows_count].stats.item1)") {
                            cell.imgitem1.image = imgitem1
                            cell.imgitem1.layer.borderWidth = 1
                            cell.imgitem1.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
                        }
                        
                        if let imgitem2 = UIImage(named:"item_\(tstats[indexPath.row - static_cell_rows_count].stats.item2)") {
                            cell.imgitem2.image = imgitem2
                            cell.imgitem2.layer.borderWidth = 1
                            cell.imgitem2.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
                        }
                        
                        if let imgitem3 = UIImage(named:"item_\(tstats[indexPath.row - static_cell_rows_count].stats.item3)") {
                            cell.imgitem3.image = imgitem3
                            cell.imgitem3.layer.borderWidth = 1
                            cell.imgitem3.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
                        }
                        
                        if let imgitem4 = UIImage(named:"item_\(tstats[indexPath.row - static_cell_rows_count].stats.item4)") {
                            cell.imgitem4.image = imgitem4
                            cell.imgitem4.layer.borderWidth = 1
                            cell.imgitem4.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
                        }
                        
                        if let imgitem5 = UIImage(named:"item_\(tstats[indexPath.row - static_cell_rows_count].stats.item5)") {
                            cell.imgitem5.image = imgitem5
                            cell.imgitem5.layer.borderWidth = 1
                            cell.imgitem5.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
                        }
                        
                        if let imgitem6 = UIImage(named:"item_\(tstats[indexPath.row - static_cell_rows_count].stats.item6)") {
                            cell.imgtrinket.image = imgitem6
                            cell.imgtrinket.layer.borderWidth = 1
                            cell.imgtrinket.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
                        }
                        
                        if let spell1 = UIImage(named:"spell_summoner_\( tstats[indexPath.row - static_cell_rows_count].spell1Id)") {
                            cell.imgtlt0.image = spell1
                            cell.imgtlt0.layer.borderWidth = 1
                            cell.imgtlt0.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
                        }
                        
                        if let spell2 = UIImage(named:"spell_summoner_\(tstats[indexPath.row - static_cell_rows_count].spell2Id)") {
                            cell.imgtlt1.image = spell2
                            cell.imgtlt1.layer.borderWidth = 1
                            cell.imgtlt1.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
                        }
                        
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
                            if let spellm = UIImage(named:"mastery_\(masteryf[0].masteryId)") {
                                cell.imgtltmast.image = spellm
                                cell.imgtltmast.layer.borderWidth = 1
                                cell.imgtltmast.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
                            }
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
                                cell.imgchamp1.image = UIImage(named:"champion_\(champ.key)")
                                cell.imgchamp1.layer.borderWidth = 1
                                cell.imgchamp1.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_BRILHANTE.rawValue).cgColor
                            case 1:
                                let champ = rt.listaChamp(id: tlosing[0].bans[1].championId)
                                cell.imgchamp2.image = UIImage(named:"champion_\(champ.key)")
                                cell.imgchamp2.layer.borderWidth = 1
                                cell.imgchamp2.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_BRILHANTE.rawValue).cgColor
                            case 2:
                                let champ = rt.listaChamp(id: tlosing[0].bans[2].championId)
                                cell.imgchamp3.image = UIImage(named:"champion_\(champ.key)")
                                cell.imgchamp3.layer.borderWidth = 1
                                cell.imgchamp3.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_BRILHANTE.rawValue).cgColor
                            default:
                                print("R00T - INVALID")
                            }
                        }
                    } else {
                        cell.imgchamp1.isHidden = true
                        cell.imgchamp2.isHidden = true
                        cell.imgchamp3.isHidden = true
                    }
                } else {
                    cell.imgchamp1.isHidden = true
                    cell.imgchamp2.isHidden = true
                    cell.imgchamp3.isHidden = true
                }
                
                return cell
            default:
                let cell = Bundle.main.loadNibNamed("matchesdetplayersTVCC", owner: self, options: nil)?.first as! matchesdetplayersTVCC
                
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                cell.imgchampion.image = UIImage(named:"static_null")
                cell.imgitem0.image = UIImage(named:"static_null")
                cell.imgitem1.image = UIImage(named:"static_null")
                cell.imgitem2.image = UIImage(named:"static_null")
                cell.imgitem3.image = UIImage(named:"static_null")
                cell.imgitem4.image = UIImage(named:"static_null")
                cell.imgitem5.image = UIImage(named:"static_null")
                cell.imgtrinket.image = UIImage(named:"static_null")
                cell.imgtlt0.image = UIImage(named:"static_null")
                cell.imgtlt1.image = UIImage(named:"static_null")
                cell.imgtltmast.image = UIImage(named:"static_null")
                
                let tstats = matchdet.participants.filter{ p in p.stats.winner == false }
                
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
                        cell.minions.text = "\(tstats[indexPath.row - static_cell_rows_count].stats.minionsKilled + tstats[indexPath.row - static_cell_rows_count].stats.neutralMinionsKilled)"
                        
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
                        
                        if let imgchamp = UIImage(named:"champion_\(summoner.key)") {
                            cell.imgchampion.isHidden = false
                            cell.imgchampion.image = imgchamp
                            cell.imgchampion.layer.borderWidth = 2
                            cell.imgchampion.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_BRILHANTE.rawValue).cgColor
                        }
                        
                        if let imgitem0 = UIImage(named:"item_\(tstats[indexPath.row - static_cell_rows_count].stats.item0)") {
                            cell.imgitem0.image = imgitem0
                            cell.imgitem0.layer.borderWidth = 1
                            cell.imgitem0.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
                        }
                        
                        if let imgitem1 = UIImage(named:"item_\(tstats[indexPath.row - static_cell_rows_count].stats.item1)") {
                            cell.imgitem1.image = imgitem1
                            cell.imgitem1.layer.borderWidth = 1
                            cell.imgitem1.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
                        }
                        
                        if let imgitem2 = UIImage(named:"item_\(tstats[indexPath.row - static_cell_rows_count].stats.item2)") {
                            cell.imgitem2.image = imgitem2
                            cell.imgitem2.layer.borderWidth = 1
                            cell.imgitem2.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
                        }
                        
                        if let imgitem3 = UIImage(named:"item_\(tstats[indexPath.row - static_cell_rows_count].stats.item3)") {
                            cell.imgitem3.image = imgitem3
                            cell.imgitem3.layer.borderWidth = 1
                            cell.imgitem3.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
                        }
                        
                        if let imgitem4 = UIImage(named:"item_\(tstats[indexPath.row - static_cell_rows_count].stats.item4)") {
                            cell.imgitem4.image = imgitem4
                            cell.imgitem4.layer.borderWidth = 1
                            cell.imgitem4.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
                        }
                        
                        if let imgitem5 = UIImage(named:"item_\(tstats[indexPath.row - static_cell_rows_count].stats.item5)") {
                            cell.imgitem5.image = imgitem5
                            cell.imgitem5.layer.borderWidth = 1
                            cell.imgitem5.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
                        }
                        
                        if let imgitem6 = UIImage(named:"item_\(tstats[indexPath.row - static_cell_rows_count].stats.item6)") {
                            cell.imgtrinket.image = imgitem6
                            cell.imgtrinket.layer.borderWidth = 1
                            cell.imgtrinket.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
                        }
                        
                        if let spell1 = UIImage(named:"spell_summoner_\( tstats[indexPath.row - static_cell_rows_count].spell1Id)") {
                            cell.imgtlt0.image = spell1
                            cell.imgtlt0.layer.borderWidth = 1
                            cell.imgtlt0.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
                        }
                        
                        if let spell2 = UIImage(named:"spell_summoner_\(tstats[indexPath.row - static_cell_rows_count].spell2Id)") {
                            cell.imgtlt1.image = spell2
                            cell.imgtlt1.layer.borderWidth = 1
                            cell.imgtlt1.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
                        }
                        
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
                            if let spellm = UIImage(named:"mastery_\(masteryf[0].masteryId)") {
                                cell.imgtltmast.image = spellm
                                cell.imgtltmast.layer.borderWidth = 1
                                cell.imgtltmast.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
                            }
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
        
        self.title = "Match Details"
    }
    
    func spopViewController(){
        self.navigationController?.popViewController(animated: true)
    }
}
