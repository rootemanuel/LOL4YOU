//
//  matchesTVC.swift
//  LOL4YOU
//
//  Created by Emanuel Root on 18/04/17.
//  Copyright © 2017 Emanuel Root. All rights reserved.
//

import UIKit
import SVProgressHUD
import Alamofire
import SwiftyJSON

class matchesTVC: UITableViewController {

    var rt = rootclass.sharedInstance
    
    var matchs = Array<rootclass.BEMatch>()
    var emptytableview:emptytableview? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initView()
        self.loadingView()
        
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "statsdet") as! statsdetTVC
//        
//        vc.statsdet = stats[indexPath.row]
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let lmatches = tableView.dequeueReusableCell(withIdentifier: "matchescell", for: indexPath as IndexPath) as! matchesTVCC
        
        lmatches.selectionStyle = UITableViewCellSelectionStyle.none
        
        let tmatchs = matchs[indexPath.row]
        let tparticipantsIdentities = tmatchs.participantsIdentities.filter{ p in p.summonerId == rootclass.Summoner.summonerID }
        
        if tparticipantsIdentities.count > 0 {
            let tparticipants = tmatchs.participants.filter { p in p.participantId == tparticipantsIdentities[0].participantId }
            
            let matches = tparticipants[0].stats
            let masterys = tparticipants[0].masterys
            
            lmatches.queue.text = tmatchs.queueType.replacingOccurrences(of: "_", with: " ")
            lmatches.gold.text = "\(matches.goldEarned)"
            lmatches.kda.text = "\(matches.kills)/\(matches.deaths)/\(matches.assists)"
            lmatches.minions.text = "\(matches.minionsKilled + matches.neutralMinionsKilled)"

            
            if tmatchs.matchDuration > 0 {
                let (h,m,s) = rt.secondsToHoursMinutesSeconds(seconds: tmatchs.matchDuration)
                if h > 0 {
                    lmatches.minutes.text = "\(String(format: "%.2d",h)):\(String(format: "%.2d",m)):\(String(format: "%.2d",s))"
                } else {
                    lmatches.minutes.text = "\(String(format: "%.2d",m)):\(String(format: "%.2d",s))"
                }
            }
            
            if tmatchs.matchCreation > 0 {
                let date = Date(timeIntervalSince1970: TimeInterval(tmatchs.matchCreation / 1000))
                let formatter  = DateFormatter()
                formatter.dateFormat = "MM/dd/yyyy"
                
                lmatches.day.text = formatter.string(from: date)
            }
            
            if matches.winner {
                lmatches.winloss.text = "VICTORY"
                lmatches.winloss.textColor = UIColor(hex: rootclass.colors.TEXTO_VITORIA.rawValue)
            } else {
                lmatches.winloss.text = "DEFEAT"
                lmatches.winloss.textColor = UIColor(hex: rootclass.colors.TEXTO_DERROTA.rawValue)
            }
            
            if matches.champLevel > 0 {
                lmatches.lvl.text = "\(matches.champLevel)"
                lmatches.imglvl.backgroundColor = UIColor(hex: rootclass.colors.FUNDO.rawValue)
                lmatches.imglvl.layer.borderWidth = 1
                lmatches.imglvl.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
            } else {
                lmatches.imglvl.isHidden = true
                lmatches.lvl.isHidden = true
            }
            
            let champion = rt.listaChamp(id: tparticipants[0].championId)
            
            if let imgchamp = UIImage(named:"champion_\(champion.key)") {
                lmatches.imgchamp.image = imgchamp
                lmatches.imgchamp.layer.borderWidth = 2
                lmatches.imgchamp.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_BRILHANTE.rawValue).cgColor
            }
            
            if let imgitem0 = UIImage(named:"item_\(matches.item0)") {
                lmatches.imgitem0.image = imgitem0
                lmatches.imgitem0.layer.borderWidth = 1
                lmatches.imgitem0.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
            }
            
            if let imgitem1 = UIImage(named:"item_\(matches.item1)") {
                lmatches.imgitem1.image = imgitem1
                lmatches.imgitem1.layer.borderWidth = 1
                lmatches.imgitem1.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
            }
            
            if let imgitem2 = UIImage(named:"item_\(matches.item2)") {
                lmatches.imgitem2.image = imgitem2
                lmatches.imgitem2.layer.borderWidth = 1
                lmatches.imgitem2.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
            }
            
            if let imgitem3 = UIImage(named:"item_\(matches.item3)") {
                lmatches.imgitem3.image = imgitem3
                lmatches.imgitem3.layer.borderWidth = 1
                lmatches.imgitem3.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
            }

            if let imgitem4 = UIImage(named:"item_\(matches.item4)") {
                lmatches.imgitem4.image = imgitem4
                lmatches.imgitem4.layer.borderWidth = 1
                lmatches.imgitem4.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
            }

            if let imgitem5 = UIImage(named:"item_\(matches.item5)") {
                lmatches.imgitem5.image = imgitem5
                lmatches.imgitem5.layer.borderWidth = 1
                lmatches.imgitem5.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
            }
            
            if let imgitem6 = UIImage(named:"item_\(matches.item6)") {
                lmatches.imgtrinket.image = imgitem6
                lmatches.imgtrinket.layer.borderWidth = 1
                lmatches.imgtrinket.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
            }
            
            if let spell1 = UIImage(named:"spell_summoner_\(tparticipants[0].spell1Id)") {
                lmatches.imgtlt0.image = spell1
                lmatches.imgtlt0.layer.borderWidth = 1
                lmatches.imgtlt0.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
            }
            
            if let spell2 = UIImage(named:"spell_summoner_\(tparticipants[0].spell2Id)") {
                lmatches.imgtlt1.image = spell2
                lmatches.imgtlt1.layer.borderWidth = 1
                lmatches.imgtlt1.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
            }
            
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
                    lmatches.imgtltmast.image = spellm
                    lmatches.imgtltmast.layer.borderWidth = 1
                    lmatches.imgtltmast.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
                }
            }
        }
        return lmatches
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numOfSections: Int = 0
        
        if matchs.count > 0 {
            numOfSections = matchs.count
            tableView.separatorStyle = .singleLine
            tableView.backgroundView?.isHidden = true
            tableView.backgroundColor = UIColor(hex: rootclass.colors.FUNDO.rawValue)
        } else {
            tableView.separatorStyle = .none
            tableView.backgroundView?.isHidden = false
            tableView.backgroundColor = UIColor(hex: rootclass.colors.FUNDO_EMPTY_TABLEVIEW.rawValue)
        }
        
        return numOfSections
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func loadingView() {
        SVProgressHUD.show(withStatus: "Loading Matches")
    
        rt.listarMatch() {(match) in
            self.listarMatchDet(matchs: match)
//            self.rt.listarMatchDet(matchs: match) {(matchdet) in
//                
//                DispatchQueue.main.async {
//                    self.matchs = matchdet
//                    self.tableView.reloadData()
//                    SVProgressHUD.dismiss()
//                }
//            }
        }
    }
    
    func initemptytableview() {
        emptytableview = Bundle.main.loadNibNamed("emptytableview", owner: self, options: nil)?.first as? emptytableview
        self.tableView.backgroundView = emptytableview
    }
    
    func initView(){
        let attnav = [
            NSForegroundColorAttributeName: UIColor(hex:rootclass.colors.TEXTO_TOP_BAR.rawValue),
            NSFontAttributeName: UIFont(name: "Friz Quadrata TT", size: 15)!
        ]
        
        let button = UIButton.init(type: .custom)
        button.setImage(UIImage(named:"static_button_back"), for: UIControlState.normal)
        button.addTarget(self, action:#selector(spopViewController), for: UIControlEvents.touchUpInside)
        button.frame = CGRect.init(x: 0, y: 0, width: 30, height: 30)
        let barButton = UIBarButtonItem.init(customView: button)
        self.navigationItem.leftBarButtonItem = barButton
        
        self.navigationController?.navigationBar.barTintColor = UIColor(hex: rootclass.colors.FUNDO.rawValue)
        self.navigationController?.navigationBar.titleTextAttributes = attnav
        self.title = "Matches"
    }
    
    func listarMatchDet(matchs:Array<Int>) {
    
        var matchids = matchs
        
        var i = -1
        var tentativas = 0
        var matchant = 0
        
        if matchids.count > 0 {
             while true {
                i += 1
                
                if matchids.count == 0 {
                    break
                }
            
                let semaphore = DispatchSemaphore(value: 0)
                let url = "https://\(rootclass.Region.REGION_BR.rawValue.lowercased()).api.riotgames.com/api/lol/\(rootclass.Region.REGION_BR.rawValue.uppercased())/v2.2/match/\(matchids[i])?api_key=\(rootclass.Summoner.api_key)"
                
                let queue = DispatchQueue.global(qos: .background)
                Alamofire.request(url).responseJSON(queue: queue) { response in
                    
                    
                    switch response.result {
                    case .success( _):
                        let jmatchdet = JSON(response.result.value!)
                        
                        if jmatchdet != JSON.null {
                            if(!jmatchdet.isEmpty){
                                let match = rootclass.BEMatch()
                                
                                if let matchCreation = jmatchdet["matchCreation"].int {
                                    match.matchCreation = matchCreation
                                }
                                
                                if let matchDuration = jmatchdet["matchDuration"].int {
                                    match.matchDuration = matchDuration
                                }
                                
                                if let queueType = jmatchdet["queueType"].string {
                                    match.queueType = queueType
                                }
                                
                                //Participants
                                for a in 0 ..< jmatchdet["participants"].count {
                                    
                                    let participant = rootclass.BEParticipants()
                                    
                                    //Match
                                    if let teamId = jmatchdet["participants"][a]["teamId"].int {
                                        participant.teamId = teamId
                                    }
                                    
                                    if let spell1Id = jmatchdet["participants"][a]["spell1Id"].int {
                                        participant.spell1Id = spell1Id
                                    }
                                    
                                    if let spell2Id = jmatchdet["participants"][a]["spell2Id"].int {
                                        participant.spell2Id = spell2Id
                                    }
                                    
                                    if let championId = jmatchdet["participants"][a]["championId"].int {
                                        participant.championId = championId
                                    }
                                    
                                    if let participantId = jmatchdet["participants"][a]["participantId"].int {
                                        participant.participantId = participantId
                                    }
                                    
                                    //Stats
                                    if let winner = jmatchdet["participants"][a]["stats"]["winner"].bool {
                                        participant.stats.winner = winner
                                    }
                                    
                                    if let champLevel = jmatchdet["participants"][a]["stats"]["champLevel"].int {
                                        participant.stats.champLevel = champLevel
                                    }
                                    
                                    if let item0 = jmatchdet["participants"][a]["stats"]["item0"].int {
                                        participant.stats.item0 = item0
                                    }
                                    
                                    if let item1 = jmatchdet["participants"][a]["stats"]["item1"].int {
                                        participant.stats.item1 = item1
                                    }
                                    
                                    if let item2 = jmatchdet["participants"][a]["stats"]["item2"].int {
                                        participant.stats.item2 = item2
                                    }
                                    
                                    if let item3 = jmatchdet["participants"][a]["stats"]["item3"].int {
                                        participant.stats.item3 = item3
                                    }
                                    
                                    if let item4 = jmatchdet["participants"][a]["stats"]["item4"].int {
                                        participant.stats.item4 = item4
                                    }
                                    
                                    if let item5 = jmatchdet["participants"][a]["stats"]["item5"].int {
                                        participant.stats.item5 = item5
                                    }
                                    
                                    if let item6 = jmatchdet["participants"][a]["stats"]["item6"].int {
                                        participant.stats.item6 = item6
                                    }
                                    
                                    if let kills = jmatchdet["participants"][a]["stats"]["kills"].int {
                                        participant.stats.kills = kills
                                    }
                                    
                                    if let deaths = jmatchdet["participants"][a]["stats"]["deaths"].int {
                                        participant.stats.deaths = deaths
                                    }
                                    
                                    if let assists = jmatchdet["participants"][a]["stats"]["assists"].int {
                                        participant.stats.assists = assists
                                    }
                                    
                                    if let doubleKills = jmatchdet["participants"][a]["stats"]["doubleKills"].int {
                                        participant.stats.doubleKills = doubleKills
                                    }
                                    
                                    if let tripleKills = jmatchdet["participants"][a]["stats"]["tripleKills"].int {
                                        participant.stats.tripleKills = tripleKills
                                    }
                                    
                                    if let quadraKills = jmatchdet["participants"][a]["stats"]["quadraKills"].int {
                                        participant.stats.quadraKills = quadraKills
                                    }
                                    
                                    if let pentaKills = jmatchdet["participants"][a]["stats"]["pentaKills"].int {
                                        participant.stats.pentaKills = pentaKills
                                    }
                                    
                                    if let minionsKilled = jmatchdet["participants"][a]["stats"]["minionsKilled"].int {
                                        participant.stats.minionsKilled = minionsKilled
                                    }
                                    
                                    if let neutralMinionsKilled = jmatchdet["participants"][a]["stats"]["neutralMinionsKilled"].int {
                                        participant.stats.neutralMinionsKilled = neutralMinionsKilled
                                    }
                                    
                                    if let neutralMinionsKilledTeamJungle = jmatchdet["participants"][a]["stats"]["neutralMinionsKilledTeamJungle"].int {
                                        participant.stats.neutralMinionsKilledTeamJungle = neutralMinionsKilledTeamJungle
                                    }
                                    
                                    if let neutralMinionsKilledEnemyJungle = jmatchdet["participants"][a]["stats"]["neutralMinionsKilledEnemyJungle"].int {
                                        participant.stats.neutralMinionsKilledEnemyJungle = neutralMinionsKilledEnemyJungle
                                    }
                                    
                                    if let goldEarned = jmatchdet["participants"][a]["stats"]["goldEarned"].double {
                                        participant.stats.goldEarned = goldEarned
                                    }
                                    
                                    if let towerKills = jmatchdet["participants"][a]["stats"]["towerKills"].int {
                                        participant.stats.towerKills = towerKills
                                    }
                                    
                                    if let visionWardsBoughtInGame = jmatchdet["participants"][a]["stats"]["visionWardsBoughtInGame"].int {
                                        participant.stats.visionWardsBoughtInGame = visionWardsBoughtInGame
                                    }
                                    
                                    
                                    if let wardsPlaced = jmatchdet["participants"][a]["stats"]["wardsPlaced"].int {
                                        participant.stats.wardsPlaced = wardsPlaced
                                    }
                                    
                                    if let wardsKilled = jmatchdet["participants"][a]["stats"]["wardsKilled"].int {
                                        participant.stats.wardsKilled = wardsKilled
                                    }
                                    
                                    //Runes
                                    
                                    for b in 0 ..< jmatchdet["participants"][a]["runes"].count {
                                        
                                        let rune = rootclass.BERune()
                                        
                                        if let runeId = jmatchdet["participants"][a]["runes"][b]["runeId"].int {
                                            rune.runeId = runeId
                                        }
                                        
                                        if let rank = jmatchdet["participants"][a]["runes"][b]["rank"].int {
                                            rune.rank = rank
                                        }
                                        
                                        participant.runes.append(rune)
                                        
                                    }
                                    
                                    //Mastery
                                    
                                    for c in 0 ..< jmatchdet["participants"][a]["masteries"].count {
                                        
                                        let mastery = rootclass.BEMastery()
                                        
                                        if let masteryId = jmatchdet["participants"][a]["masteries"][c]["masteryId"].int {
                                            mastery.masteryId = masteryId
                                        }
                                        
                                        if let rank = jmatchdet["participants"][a]["masteries"][c]["rank"].int {
                                            mastery.rank = rank
                                        }
                                        
                                        participant.masterys.append(mastery)
                                        
                                    }
                                    
                                    match.participants.append(participant)
                                }
                                
                                //Participants Identities
                                for d in 0 ..< jmatchdet["participantIdentities"].count {
                                    let participantident = rootclass.BEParticipantsIdent()
                                    
                                    if let participantId = jmatchdet["participantIdentities"][d]["participantId"].int {
                                        participantident.participantId = participantId
                                    }
                                    
                                    if let summonerId = jmatchdet["participantIdentities"][d]["player"]["summonerId"].int {
                                        participantident.summonerId = summonerId
                                    }
                                    
                                    if let summonerName = jmatchdet["participantIdentities"][d]["player"]["summonerName"].string {
                                        participantident.summonerName = summonerName
                                    }
                                    
                                    match.participantsIdentities.append(participantident)
                                }
                                
                                //Participants Teams
                                for e in 0 ..< jmatchdet["teams"].count {
                                    let team = rootclass.BETeams()
                                    
                                    if let winner = jmatchdet["teams"][e]["winner"].bool {
                                        team.winner = winner
                                    }
                                    
                                    if let firstBlood = jmatchdet["teams"][e]["firstBlood"].bool {
                                        team.firstBlood = firstBlood
                                    }
                                    
                                    if let firstTower = jmatchdet["teams"][e]["firstTower"].bool {
                                        team.firstTower = firstTower
                                    }
                                    
                                    if let firstBaron = jmatchdet["teams"][e]["firstBaron"].bool {
                                        team.firstBaron = firstBaron
                                    }
                                    
                                    if let firstDragon = jmatchdet["teams"][e]["firstDragon"].bool {
                                        team.firstDragon = firstDragon
                                    }
                                    
                                    if let inhibitorKills = jmatchdet["teams"][e]["inhibitorKills"].int {
                                        team.inhibitorKills = inhibitorKills
                                    }
                                    
                                    if let inhibitorKills = jmatchdet["teams"][e]["inhibitorKills"].int {
                                        team.inhibitorKills = inhibitorKills
                                    }
                                    
                                    if let baronKills = jmatchdet["teams"][e]["baronKills"].int {
                                        team.baronKills = baronKills
                                    }
                                    
                                    if let dragonKills = jmatchdet["teams"][e]["dragonKills"].int {
                                        team.dragonKills = dragonKills
                                    }
                                    
                                    for f in 0 ..< jmatchdet["teams"][e]["bans"].count {
                                        let ban = rootclass.BEBan()
                                        
                                        if let championId = jmatchdet["teams"][e]["bans"][f]["championId"].int {
                                            ban.championId = championId
                                        }
                                        
                                        if let pickTurn = jmatchdet["teams"][e]["bans"][f]["pickTurn"].int {
                                            ban.championId = pickTurn
                                        }
                                        
                                        team.bans.append(ban)
                                    }
                                    
                                    match.teams.append(team)
                                }
                                
                                if match.matchCreation != 0 {
                                    tentativas = 0
                                    matchant = matchids[i]
                                    self.matchs.append(match)
                                    matchids.remove(at: i)
                                } else {
                                    if matchant == matchids[i] {
                                        if tentativas > 10 {
                                            break
                                        } else {
                                            tentativas += 1
                                        }
                                    }
                                }
                                
                                i = -1
                                semaphore.signal()
                                
                                print("--------------------------------------- \(self.matchs.count) --------------------------------------- ")
                                if self.matchs.count == 15 {
                                    self.matchs = self.matchs.sorted{ $0.matchCreation > $1.matchCreation }
                                    
                                    print(" ")
                                    print(" ")
                                    print(" ")
                                    print(" ")
                                    print(" ")
                                    print(" ")
                                    print(" ")
                                    print(" ")
                                    print(" ")
                                    print(" ")
                                    print(" ")
                                    print(" ")
                                    print(" ")
                                    print(" ")
                                    print(" ")
                                    print(" ")
                                    print(" ")
                                    print(" ")
                                    print(" ")
                                    print(" ")
                                    print(" ")
                                    print(" ")
                                    print(" ")
                                    print(" ")
                                    print(" ")
                                    print("---------------------------------------------------")
                                    print("              COMECOU AQUI                         ")
                                    print("---------------------------------------------------")
                                    
                                    print("COUNT - \(self.matchs.count)")
                                    for x in 0 ..< self.matchs.count {
                                        
                                        print("INDEX - \(x)")
                                        print("MATCH CREATION - \(self.matchs[x].matchCreation)")
                                        let partcipantsidentitiesTESTE = self.matchs[x].participantsIdentities.filter{ p in p.summonerId == rootclass.Summoner.summonerID }
                                        let partcipantsTESTE = self.matchs[x].participants.filter{p in p.participantId == partcipantsidentitiesTESTE[0].participantId}
                                        for w in 0 ..< partcipantsTESTE.count {
                                            
                                            let champ = self.rt.listaChamp(id: partcipantsTESTE[w].championId)
                                            print("CHAMPION ID - \(champ.name)")
                                            print("KILLS - \(partcipantsTESTE[w].stats.kills)")
                                            print("DEATHS - \(partcipantsTESTE[w].stats.deaths)")
                                            print("ASSISTS - \(partcipantsTESTE[w].stats.assists)")
                                            print("ITEM0 - \(partcipantsTESTE[w].stats.item0)")
                                            print("ITEM1 - \(partcipantsTESTE[w].stats.item1)")
                                            print("ITEM2 - \(partcipantsTESTE[w].stats.item2)")
                                            print("ITEM3 - \(partcipantsTESTE[w].stats.item3)")
                                            print("ITEM4 - \(partcipantsTESTE[w].stats.item4)")
                                            print("ITEM5 - \(partcipantsTESTE[w].stats.item5)")
                                            print("ITEM6 - \(partcipantsTESTE[w].stats.item6)")
                                            print("GOLD - \(partcipantsTESTE[w].stats.goldEarned)")
                                            print("MINIONS - \(partcipantsTESTE[w].stats.minionsKilled + partcipantsTESTE[w].stats.neutralMinionsKilled)")
                                            print("---------------------------------------------------")
                                        }
                                        
                                    }
                                    
                                    print("---------------------------------------------------")
                                    print("              FINALIZOU AQUI                       ")
                                    print("---------------------------------------------------")
                                    print(" ")
                                    print(" ")
                                    print(" ")
                                    print(" ")
                                    print(" ")
                                    print(" ")
                                    print(" ")
                                    print(" ")
                                    print(" ")
                                    print(" ")
                                    print(" ")
                                    print(" ")
                                    print(" ")
                                    print(" ")
                                    print(" ")
                                    print(" ")
                                    print(" ")
                                    print(" ")
                                    print(" ")
                                    print(" ")
                                    print(" ")
                                    print(" ")
                                    print(" ")
                                    print(" ")
                                    print(" ")
                                    
                                    DispatchQueue.main.async {
                                        self.tableView.reloadData()
                                        SVProgressHUD.dismiss()
                                    }
                                    
                                }
                            }
                        }
                    case .failure(let error):
                        NSLog(error as! String)
                    }
                }
                semaphore.wait(timeout: .distantFuture)
            }
        } else {
            self.initemptytableview()
            SVProgressHUD.dismiss()
        }
    }
    
    func spopViewController(){
        self.navigationController?.popViewController(animated: true)
    }
}
