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
    var participants = Array<rootclass.BEParticipants>()
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
        
        if matchs.count - 1 > indexPath.row {
        
            let participantsIdentities = matchs[indexPath.row].participantsIdentities
            let participantIdentitie = participantsIdentities.filter{ p in p.summonerId == rootclass.Summoner.summonerID }
            
            if participantIdentitie.count > 0 {
                let participantid = participantIdentitie[0].participantId
                participants = matchs[indexPath.row].participants.filter { p in p.participantId == participantid }
                
                let matches = participants[0].stats
                
                lmatches.queue.text = matchs[indexPath.row].queueType.replacingOccurrences(of: "_", with: " ")
                lmatches.gold.text = "\(matches.goldEarned)"
                lmatches.kda.text = "\(matches.kills)/\(matches.deaths)/\(matches.assists)"
                lmatches.minions.text = "\(matches.minionsKilled + matches.neutralMinionsKilled)"
                
                if matches.winner {
                    lmatches.imgwinloss.backgroundColor = UIColor.green
                } else {
                    lmatches.imgwinloss.backgroundColor = UIColor.red
                }
                
                let champion = rt.listaChamp(id: participants[0].championId)
                lmatches.imgchamp.image = UIImage(named:"champion_\(champion.key)")
                lmatches.imgitem0.image = UIImage(named:"item_\(matches.item0)")
                lmatches.imgitem1.image = UIImage(named:"item_\(matches.item1)")
                lmatches.imgitem2.image = UIImage(named:"item_\(matches.item2)")
                lmatches.imgitem3.image = UIImage(named:"item_\(matches.item3)")
                lmatches.imgitem4.image = UIImage(named:"item_\(matches.item4)")
                lmatches.imgitem5.image = UIImage(named:"item_\(matches.item5)")
                lmatches.imgtrinket.image = UIImage(named:"item_\(matches.item6)")

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
        } else {
            tableView.separatorStyle = .none
            tableView.backgroundView?.isHidden = false
        }
        
        return numOfSections
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func loadingView() {
        SVProgressHUD.show()
        
        rt.listarMatch() {(match) in
            self.listarMatchDet(matchids: match)
        }
    }
    
    func initemptytableview() {
        emptytableview = Bundle.main.loadNibNamed("emptytableview", owner: self, options: nil)?.first as? emptytableview
        self.tableView.backgroundView = emptytableview
    }
    
    func initView(){
        self.title = "Matches"
    }
    
    func listarMatchDet(matchids:Array<Int>) {
    
        for i in 0 ..< matchids.count {
            
            let url = "https://\(rootclass.Region.REGION_BR.rawValue.lowercased()).api.riotgames.com/api/lol/\(rootclass.Region.REGION_BR.rawValue.uppercased())/v2.2/match/\(matchids[i])?api_key=\(rootclass.Summoner.api_key)"
            
            Alamofire.request(url).responseJSON { response in
                
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
                            self.matchs.append(match)
                            if self.matchs.count == 15 {
                                self.matchs = self.matchs.sorted{ $0.matchCreation > $1.matchCreation }
                                self.tableView.reloadData()
                                SVProgressHUD.dismiss()
                            }
                        }
                    }
                case .failure(let error):
                    NSLog(error as! String)
                }
            }
        }
    }
}
