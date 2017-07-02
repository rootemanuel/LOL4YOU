//
//  rootclass.swift
//  LOL4YOU
//
//  Created by Emanuel Root on 11/04/17.
//  Copyright © 2017 Emanuel Root. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

final class rootclass: NSObject {

    static let sharedInstance: rootclass = rootclass()
    
    var lststaticspell = Array<staticspell>()
    var lststaticrunes = Array<staticrunes>()
    var lststaticchampions = Array<staticchampions>()
    var lststaticmastery = Array<staticmastery>()
    
    class staticspell {
        var id:Int = 0
        var key:String = ""
        var name:String = ""
        var imagefull:String = ""
        var imagelink:String = ""
    }
    
    class staticchampions {
        var id:Int = 0
        var key:String = ""
        var name:String = ""
        var imagefull:String = ""
        var imagelink:String = ""
    }
    
    class staticrunes {
        var id:Int = 0
        var name:String = ""
        var description:String = ""
        var isRune:Bool = false
        var tier:String = ""
        var type:String = ""
        var imagefull:String = ""
        var imagelink:String = ""
    }
    
    class staticmastery {
        var id:Int = 0
        var description:Array<String> = Array<String>()
        var name:String = ""
        var imagefull:String = ""
        var imagelink:String = ""
    }
    
    private override init() {
        super.init()
    }
    
    struct screens {
        static internal var search:String = "SEARCH"
        static internal var stats:String = "STATS"
        static internal var statsdet:String = "STATS_DET"
        static internal var menu:String = "MENU"
        static internal var matches:String = "MATCHES"
        static internal var matchesdet:String = "MATCHES_DET"
        static internal var perfilstats:String = "PERFIL_STATS"
        static internal var runes:String = "RUNES"
        static internal var runesdet:String = "RUNES_DET"
        static internal var masterys:String = "MASTERYS"
        static internal var masterysdet:String = "MASTERYS_DET"
    }
    
    struct lol4you {
        static internal var admob_app:String = "ca-app-pub-8175152842112808~9569832570"
        static internal var admob_banner:String = "ca-app-pub-8175152842112808/2046565779"
        static internal var admob_banner_video:String = "ca-app-pub-8175152842112808/6927103773"
    }
    
    struct lol {
        static internal var version:String = "7.9.2"
        static internal var api_key:String = "RGAPI-50a56712-a157-44cc-9760-0a4649629dff"
        static internal var server:String = "BR"
    }
    
    struct images {
        static internal let item:String = "https://ddragon.leagueoflegends.com/cdn/\(rootclass.lol.version)/img/item/"
        static internal let champion:String = "https://ddragon.leagueoflegends.com/cdn/\(rootclass.lol.version)/img/champion/"
        static internal let profileicon:String = "https://ddragon.leagueoflegends.com/cdn/\(rootclass.lol.version)/img/profileicon/"
        static internal let rune:String = "https://ddragon.leagueoflegends.com/cdn/\(rootclass.lol.version)/img/rune/"
        static internal let spell:String = "https://ddragon.leagueoflegends.com/cdn/\(rootclass.lol.version)/img/spell/"
        static internal let mastery:String = "https://ddragon.leagueoflegends.com/cdn/\(rootclass.lol.version)/img/mastery/"
        static internal let png:String = ".png"
    }
    
    struct shared {
        static internal let root:String = "root"
        static internal let version:String = "version"
        static internal let spells:String = "spells"
        static internal let runes:String = "runes"
        static internal let champions:String = "champions"
        static internal let masterys:String = "masterys"
    }
    
    
    public let const_zeros_i = 0
    public let const_zeros_s = "0"
    public let const_matches_qtds = 15
    
    enum colors:String {
        case FUNDO = "010a12"
        case FUNDO_CLARO = "252d33"
        case TEXTO_TOP_BAR = "f2e6d4"
        case BORDA_OFUSCADA = "795930"
        case BORDA_BRILHANTE = "ca9a4d"
        case TEXTO_VITORIA = "0097a8"
        case TEXTO_DERROTA = "c21a39"
        case FUNDO_EMPTY_TABLEVIEW = "efeff4"
    }
  
    enum Region : String  {
        case REGION_BR = "BR"       //Brazil
        case REGION_EUNE = "EUNE"   //EU Nordic & East
        case REGION_EUW = "EUW"     //EU West
        case REGION_LAN = "LAN"     //Latin America North
        case REGION_LAS = "LAS"     //Latin America South
        case REGION_NA = "NA"       //North America
        case REGION_OCE = "OCE"     //Oceania
        case REGION_RU = "RU"       //Russia
        case REGION_TR = "TR"       //Turkey
        case REGION_JP = "JP"       //Japan
        case REGION_KR = "KR"       //Korea
    }
    
    struct Summoner {
        static internal var name:String = ""
        static internal var summonerLevel:Int = 0
        static internal var profileIconId:Int = 0
        static internal var summonerID:Int = 0
        static internal var accountId:Int = 0
        static internal var imagelink:String = ""
    }
    
    class BEStats {
        var championID:Int = 0
        var win:String = ""
        var loss:String = ""
        var played:String = ""
        var winratio:String = ""
        var kills:String = ""
        var deaths:String = ""
        var assists:String = ""
        var creeps:String = ""
        var gold:Int = 0
        var doublekill:String = ""
        var triplekill:String = ""
        var quadrakill:String = ""
        var pentakill:String = ""
        var turretskilled:String = ""
        var firstblood:String = ""
    }
    
    class BELeague {
        var tier:String = ""
        var queue:String = ""
        var name:String = ""
        var division:String = ""
        var wins:Int = 0
        var losses:Int = 0
        var leaguePoints:Int = 0
    }
    
    class BEMatchSmall {
        var gameId:Int = 0
        var gameMode:String = ""
        var gameType:String = ""
        var subType:String = ""
        var teamId:Int = 0
        var championId:Int = 0
        var spell1:Int = 0
        var spell2:Int = 0
        var createDate:Double = 0
        var stats = BEStatsSmall()
    }
    
    class BEStatsSmall {
        var level:Int = 0
        var goldEarned:Double = 0
        var championsKilled:Int = 0
        var numDeaths:Int = 0
        var assists:Int = 0
        var win:Bool = false
        var item0:Int = 0
        var item0imagelink:String = ""
        var item1:Int = 0
        var item1imagelink:String = ""
        var item2:Int = 0
        var item2imagelink:String = ""
        var item3:Int = 0
        var item3imagelink:String = ""
        var item4:Int = 0
        var item4imagelink:String = ""
        var item5:Int = 0
        var item5imagelink:String = ""
        var item6:Int = 0
        var item6imagelink:String = ""
        var minionsKilled:Int = 0
        var timePlayed:Int = 0
    }
    
    class BEMatch {
        var queueType:String = ""
        var matchDuration:Int = 0
        var matchCreation:Double = 0
        var participants:Array<BEParticipants> = Array<BEParticipants>()
        var participantsIdentities:Array<BEParticipantsIdent> = Array<BEParticipantsIdent>()
        var teams:Array<BETeams> = Array<BETeams>()
    }
    
    class BEMasterys {
        var name:String = ""
        var current:Bool = false
        var masteries:Array<BEMastery> = Array<BEMastery>()
    }
    
    class BEMastery {
        var masteryId:Int = 0
        var rank:Int = 0
    }
    
    class BERune {
        var runeId:Int = 0
        var rank:Int = 0
    }
    
    class BEBan {
        var championId:Int = 0
        var pickTurn:Int = 0
    }
    
    class BEParticipants {
        var teamId:Int = 0
        var spell1Id:Int = 0
        var spell2Id:Int = 0
        var championId:Int = 0
        var participantId:Int = 0
        var stats:BEMatchStats = BEMatchStats()
        var masterys:Array<BEMastery> = Array<BEMastery>()
        var runes:Array<BERune> = Array<BERune>()
    }
    
    class BEParticipantsIdent {
        var participantId:Int = 0
        var summonerId:Int = 0
        var summonerName:String = ""
    }
    
    class BEMatchStats {
        var winner:Bool = false
        var champLevel:Int = 0
        var item0:Int = 0
        var item0imagelink:String = ""
        var item1:Int = 0
        var item1imagelink:String = ""
        var item2:Int = 0
        var item2imagelink:String = ""
        var item3:Int = 0
        var item3imagelink:String = ""
        var item4:Int = 0
        var item4imagelink:String = ""
        var item5:Int = 0
        var item5imagelink:String = ""
        var item6:Int = 0
        var item6imagelink:String = ""
        var kills:Int = 0
        var deaths:Int = 0
        var assists:Int = 0
        var doubleKills:Int = 0
        var tripleKills:Int = 0
        var quadraKills:Int = 0
        var pentaKills:Int = 0
        var minionsKilled:Int = 0
        var neutralMinionsKilled:Int = 0
        var neutralMinionsKilledTeamJungle:Int = 0
        var neutralMinionsKilledEnemyJungle:Int = 0
        var goldEarned:Double = 0.0
        var towerKills:Int = 0
        var visionWardsBoughtInGame:Int = 0
        var wardsPlaced:Int = 0
        var wardsKilled:Int = 0
    }
    
    class BETeams {
        var winner:Bool = false
        var firstBlood:Bool = false
        var firstTower:Bool = false
        var firstBaron:Bool = false
        var firstDragon:Bool = false
        var towerKills:Int = 0
        var inhibitorKills:Int = 0
        var baronKills:Int = 0
        var dragonKills:Int = 0
        var bans:Array<BEBan> = Array<BEBan>()
    }
    
    class BERunes {
        var name:String = ""
        var current:Bool = false
        var slots:Array<BERunesSlots> = Array<BERunesSlots>()
    }
    
    class BERunesSlots {
        var runeSlotId:Int = 0
        var runeId:Int = 0
    }
    
    class BEErro {
        var msg:String = ""
        var id:Int = 0
    }
    
    func secondsToHoursMinutesSeconds(seconds : Int) -> (Int, Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    
    func readJsonLocal(file:String) -> Data {
        var rtn = Data()
        
        let path = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("\(file).json")
        
        do {
            let data = try Data(contentsOf: path)
            if data != nil {
                rtn = data
            }
        } catch {
            NSLog("R00T - READ JSON LOCAL - ERROR: \(error)")
        }
        
        return rtn
    }
    
    func writeJsonLocal(file:String,data:Data){
        let path = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("\(file).json")
        
        do {
            try data.write(to: path, options: .atomic)
        } catch {
            NSLog("R00T - WRITE JSON LOCAL - ERROR: \(error)")
        }
    }
    
    func listaStaticSpell(spells:@escaping (JSON) -> ()) {
        
        let url = "https://na1.api.riotgames.com/lol/static-data/v3/summoner-spells?spellListData=image&api_key=\(lol.api_key)"
        
        var loop = true
        while(loop){
            let semaphore = DispatchSemaphore(value: 0)
            let queue = DispatchQueue.global(qos: .background)
            Alamofire.request(url).validate().responseJSON(queue: queue) { response in
            
                switch response.result {
                case .success( _):
                    let jspell = JSON(response.result.value!)
                    
                    let dspell: Dictionary<String, JSON> = jspell["data"].dictionaryValue
                    
                    for (_, value) in dspell {
                        let r = staticspell()
                        
                        if let id = value["id"].int {
                            r.id = id
                        }
                        
                        if let name = value["name"].string {
                            r.name = name
                        }
                        
                        if let key = value["key"].string {
                            r.key = key
                        }
                        
                        if let imagefull = value["image"]["full"].string {
                            r.imagefull = imagefull
                            r.imagelink = "\(rootclass.images.spell)\(imagefull)"
                        }
                        
                        self.lststaticspell.append(r)
                    }
                    
                    if self.lststaticspell.count > 0 {
                       loop = false
                        
                        NSLog("R00T - GET SPELLS SUCESS")
                        spells(jspell)
                        semaphore.signal()
                    }
                    
                case .failure(let error):
                    loop = false
                    
                    NSLog("R00T - GET SPELLS ERROR")
                    semaphore.signal()
                }
            }
            semaphore.wait(timeout: .distantFuture)
        }
    }

    
    func listaStaticRunes(runes:@escaping (JSON) -> ()) {
        
        let url = "https://na1.api.riotgames.com/lol/static-data/v3/runes?locale=en_US&tags=all&api_key=\(lol.api_key)"
        //let url = "https://na1.api.riotgames.com/lol/static-data/v3/runes?runeListData=basic,image&api_key=\(lol.api_key)"
        
        var loop = true
        while(loop){
            let semaphore = DispatchSemaphore(value: 0)
            let queue = DispatchQueue.global(qos: .background)
            Alamofire.request(url).validate().responseJSON(queue: queue) { response in

                switch response.result {
                case .success( _):
                    let jrunes = JSON(response.result.value!)
                    
                    let drunes: Dictionary<String, JSON> = jrunes["data"].dictionaryValue
                       
                    for (_, value) in drunes {
                        let r = staticrunes()
                        
                        if let id = value["id"].int {
                           r.id = id
                        }
                        
                        if let description = value["description"].string {
                            r.description = description
                        }
                        
                        if let name = value["name"].string {
                            r.name = name
                        }
                        
                        if let type = value["rune"]["type"].string {
                            r.type = type
                        }
                        
                        if let tier = value["rune"]["tier"].string {
                            r.tier = tier
                        }
                        
                        if let isRune = value["rune"]["isRune"].bool {
                            r.isRune = isRune
                        }
                        
                        if let imagefull = value["image"]["full"].string {
                            r.imagefull = imagefull
                            r.imagelink = "\(rootclass.images.rune)\(imagefull)"
                        }
                        
                        self.lststaticrunes.append(r)
                    }
                    
                    if self.lststaticrunes.count > 0 {
                        loop = false
                        
                        NSLog("R00T - GET RUNES SUCESS")
                        runes(jrunes)
                        semaphore.signal()
                    }
                    
                case .failure(let error):
                    loop = false
                    
                    NSLog("R00T - GET RUNES ERROR")
                    semaphore.signal()
                }
            }
            semaphore.wait(timeout: .distantFuture)
        }
    }
    
    func listaStaticChampions(champions:@escaping (JSON) -> ()) {
        
        let url = "https://na1.api.riotgames.com/lol/static-data/v3/champions?champListData=image&api_key=\(lol.api_key)"
        
        var loop = true
        while(loop){
            let semaphore = DispatchSemaphore(value: 0)
            let queue = DispatchQueue.global(qos: .background)
            Alamofire.request(url).validate().responseJSON(queue: queue) { response in
            
                switch response.result {
                case .success( _):
                    let jchampions = JSON(response.result.value!)
                    
                    let dchampions: Dictionary<String, JSON> = jchampions["data"].dictionaryValue
                    
                    for (_, value) in dchampions {
                        let r = staticchampions()
                        
                        if let id = value["id"].int {
                            r.id = id
                        }
                        
                        if let key = value["key"].string {
                            r.key = key
                        }
                        
                        if let name = value["name"].string {
                            r.name = name
                        }
                        
                        if let imagefull = value["image"]["full"].string {
                            r.imagefull = imagefull
                            r.imagelink = "\(rootclass.images.champion)\(imagefull)"
                        }
                        
                        self.lststaticchampions.append(r)
                    }
                    
                    if self.lststaticchampions.count > 0 {
                        loop = false
                        
                        NSLog("R00T - GET CHAMPIONS SUCESS")
                        champions(jchampions)
                        semaphore.signal()
                    }
                    
                case .failure(let error):
                    loop = false
                    
                    NSLog("R00T - GET CHAMPIONS ERROR")
                    semaphore.signal()
                }
            }
            semaphore.wait(timeout: .distantFuture)
        }
    }
    
    func listaStaticMastery(mastery:@escaping (JSON) -> ()) {
        
        let url = "https://na1.api.riotgames.com/lol/static-data/v3/masteries?masteryListData=image&api_key=\(lol.api_key)"
        
        var loop = true
        while(loop){
            let semaphore = DispatchSemaphore(value: 0)
            let queue = DispatchQueue.global(qos: .background)
            Alamofire.request(url).validate().responseJSON(queue: queue) { response in
            
                switch response.result {
                case .success( _):
                    let jmastery = JSON(response.result.value!)
                    
                    let dmastery: Dictionary<String, JSON> = jmastery["data"].dictionaryValue
                    
                    for (_, value) in dmastery {
                        let r = staticmastery()
                        
                        if let id = value["id"].int {
                            r.id = id
                        }

                        if let name = value["name"].string {
                            r.name = name
                        }

                        if let imagefull = value["image"]["full"].string {
                            r.imagefull = imagefull
                            r.imagelink = "\(rootclass.images.mastery)\(imagefull)"
                        }
                        
                        for i in 0 ..< value["description"].count {
                            if let description = value["description"][i].string {
                                 r.description.append(description)
                            }
                        }
                        
                        self.lststaticmastery.append(r)
                    }
                    
                    if self.lststaticmastery.count > 0 {
                        loop = false
                        
                        NSLog("R00T - GET MASTERY SUCESS")
                        mastery(jmastery)
                        semaphore.signal()
                    }
                    
                case .failure(let error):
                    loop = false
                    
                    NSLog("R00T - GET MASTERY ERROR")
                    semaphore.signal()
                }
            }
            semaphore.wait(timeout: .distantFuture)
        }
    }
    
    func listaStaticSpell(jspell:JSON) {
        
        lststaticspell = Array<staticspell>()
        
        let dspell: Dictionary<String, JSON> = jspell["data"].dictionaryValue
        
        for (_, value) in dspell {
            let r = staticspell()
            
            if let id = value["id"].int {
                r.id = id
            }
            
            if let name = value["name"].string {
                r.name = name
            }
            
            if let key = value["key"].string {
                r.key = key
            }
            
            if let imagefull = value["image"]["full"].string {
                r.imagefull = imagefull
                r.imagelink = "\(rootclass.images.spell)\(imagefull)"
            }
            
            self.lststaticspell.append(r)
        }
    }
    
    func listaStaticRunes(jrunes:JSON) {
        
        lststaticrunes = Array<staticrunes>()
        
        let drunes: Dictionary<String, JSON> = jrunes["data"].dictionaryValue
        
        for (_, value) in drunes {
            let r = staticrunes()
            
            if let id = value["id"].int {
                r.id = id
            }
            
            if let description = value["description"].string {
                r.description = description
            }
            
            if let name = value["name"].string {
                r.name = name
            }
            
            if let type = value["rune"]["type"].string {
                r.type = type
            }
            
            if let tier = value["rune"]["tier"].string {
                r.tier = tier
            }
            
            if let isRune = value["rune"]["isRune"].bool {
                r.isRune = isRune
            }
            
            if let imagefull = value["image"]["full"].string {
                r.imagefull = imagefull
                r.imagelink = "\(rootclass.images.rune)\(imagefull)"
            }
            
            self.lststaticrunes.append(r)
        }
    }
    
    func listaStaticChampions(jchampions: JSON) {
        
        lststaticchampions = Array<staticchampions>()
        
        let dchampions: Dictionary<String, JSON> = jchampions["data"].dictionaryValue
        
        for (_, value) in dchampions {
            let r = staticchampions()
            
            if let id = value["id"].int {
                r.id = id
            }
            
            if let key = value["key"].string {
                r.key = key
            }
            
            if let name = value["name"].string {
                r.name = name
            }
            
            if let imagefull = value["image"]["full"].string {
                r.imagefull = imagefull
                r.imagelink = "\(rootclass.images.champion)\(imagefull)"
            }
            
            self.lststaticchampions.append(r)
        }
    }
    
    func listaStaticMastery(jmastery:JSON) {
        
        lststaticmastery = Array<staticmastery>()
        
        let dmastery: Dictionary<String, JSON> = jmastery["data"].dictionaryValue
        
        for (_, value) in dmastery {
            let r = staticmastery()
            
            if let id = value["id"].int {
                r.id = id
            }
            
            if let name = value["name"].string {
                r.name = name
            }
            
            if let imagefull = value["image"]["full"].string {
                r.imagefull = imagefull
                r.imagelink = "\(rootclass.images.mastery)\(imagefull)"
            }
            
            for i in 0 ..< value["description"].count {
                if let description = value["description"][i].string {
                    r.description.append(description)
                }
            }
            
            self.lststaticmastery.append(r)
        }
    }
    
    func listarVersion() {
    
        let url = "https://na1.api.riotgames.com/lol/static-data/v3/versions?api_key=\(lol.api_key)"
        
        var loop = true
        while(loop){
            let semaphore = DispatchSemaphore(value: 0)
            let queue = DispatchQueue.global(qos: .background)
            Alamofire.request(url).validate().responseJSON(queue: queue) { response in
                
                switch response.result {
                case .success( _):
                    let jversions = JSON(response.result.value!)
                    
                    if jversions != JSON.null {
                        if(!jversions.isEmpty){
                            if (jversions.count > 0) {
                                
                                if let lastversion = jversions[0].string {
                                    lol.version = lastversion
                                    loop = false

                                    NSLog("R00T - GET VERSION SUCESS")
                                    semaphore.signal()
                                }
                            }
                        }
                    }
                    
                case .failure(let error):
                    loop = false
                    NSLog("R00T - GET VERSION ERROR")
                    semaphore.signal()
                }
            }
            semaphore.wait(timeout: .distantFuture)
        }
    }
    
    func listarSummoner(summonername:String,error:@escaping (BEErro) -> ()) {
        
        let rtn = BEErro()
        
        let url = "https://\(Region.REGION_BR.rawValue.lowercased())1.api.riotgames.com/lol/summoner/v3/summoners/by-name/\(summonername)?api_key=\(lol.api_key)"
        
        Alamofire.request(url).validate().responseJSON { response in
            
            switch response.result {
            case .success( _):
                let jsummoner = JSON(response.result.value!)
                
                if jsummoner != JSON.null {
                    if(!jsummoner.isEmpty){
                        if (jsummoner["profileIconId"].int != nil) {
                            
                            if let profile = jsummoner["profileIconId"].int {
                                Summoner.profileIconId = profile
                                Summoner.imagelink = "\(rootclass.images.profileicon)\(Summoner.profileIconId)\(rootclass.images.png)"
                            }
                            
                            if let summonerLevel = jsummoner["summonerLevel"].int {
                                Summoner.summonerLevel = summonerLevel
                            }
                            
                            if let accountId = jsummoner["accountId"].int {
                                Summoner.accountId = accountId
                            }
                            
                            if let summonerID = jsummoner["id"].int {
                                Summoner.summonerID = summonerID
                            }
                            
                            if let name = jsummoner["name"].string {
                                Summoner.name = name
                            }
                            
                            rtn.id = 1
                            rtn.msg = "Sucess"

                        } else {
                            rtn.id = 400
                            rtn.msg = "Summoner not found"
                        }
                    }
                }
                
            case .failure(let error):
                rtn.id = 999
                rtn.msg = "Stack"
                NSLog(error as! String)
            }
            
            error(rtn)
        }
    }
    
    func listarStats(stats:@escaping (Array<BEStats>) -> ()) {
        
        var rtn = Array<BEStats>()
        
        let url = "https://\(Region.REGION_BR.rawValue.lowercased()).api.riotgames.com/api/lol/\(Region.REGION_BR.rawValue.uppercased())/v1.3/stats/by-summoner/\(Summoner.summonerID)/ranked?season=SEASON2017&api_key=\(lol.api_key)"
        
        Alamofire.request(url).validate().responseJSON { response in
            
            switch response.result {
            case .success( _):
                let jstats = JSON(response.result.value!)
                
                if jstats != JSON.null {
                    if(!jstats.isEmpty){
                        for i in 0 ..< jstats["champions"].count {
                            let r = BEStats()
                            
                            if let champid = jstats["champions"][i]["id"].int {
                                r.championID = champid
                            }
                            
                            if let totsp = jstats["champions"][i]["stats"]["totalSessionsPlayed"].int {
                                if let kill = jstats["champions"][i]["stats"]["totalChampionKills"].int {
                                    r.kills = "\(kill / totsp)"
                                } else {
                                    r.kills = self.const_zeros_s
                                }
                                
                                if let death = jstats["champions"][i]["stats"]["totalDeathsPerSession"].int {
                                    r.deaths = "\(death / totsp)"
                                } else {
                                    r.deaths = self.const_zeros_s
                                }
                                
                                if let assist = jstats["champions"][i]["stats"]["totalAssists"].int {
                                    r.assists = "\(assist / totsp)"
                                } else {
                                    r.assists = self.const_zeros_s
                                }
                                
                                if let creep = jstats["champions"][i]["stats"]["totalMinionKills"].int {
                                    r.creeps = "\(creep / totsp)"
                                } else {
                                    r.creeps = self.const_zeros_s
                                }
                            } else {
                                if let kill = jstats["champions"][i]["stats"]["totalChampionKills"].int {
                                    r.kills = "\(kill)"
                                } else {
                                    r.kills = self.const_zeros_s
                                }
                                
                                if let death = jstats["champions"][i]["stats"]["totalDeathsPerSession"].int {
                                    r.deaths = "\(death)"
                                } else {
                                    r.deaths = self.const_zeros_s
                                }
                                
                                if let assist = jstats["champions"][i]["stats"]["totalAssists"].int {
                                    r.assists = "\(assist)"
                                } else {
                                    r.assists = self.const_zeros_s
                                }
                                
                                if let creep = jstats["champions"][i]["stats"]["totalMinionKills"].int {
                                    r.creeps = "\(creep)"
                                } else {
                                    r.creeps = self.const_zeros_s
                                }
                            }
                            
                            if let gold = jstats["champions"][i]["stats"]["totalGoldEarned"].int {
                                r.gold = gold
                            } else {
                                r.gold = self.const_zeros_i
                            }
                            
                            if let wins = jstats["champions"][i]["stats"]["totalSessionsWon"].int {
                                r.win = "\(wins)"
                            } else {
                                r.win = self.const_zeros_s
                            }
                            
                            if let loss = jstats["champions"][i]["stats"]["totalSessionsLost"].int {
                                r.loss = "\(loss)"
                            } else {
                                r.win = self.const_zeros_s
                            }
                            
                            if let dkill = jstats["champions"][i]["stats"]["totalDoubleKills"].int {
                                r.doublekill = "\(dkill)"
                            } else {
                                r.doublekill = self.const_zeros_s
                            }
                            
                            if let tkill = jstats["champions"][i]["stats"]["totalTripleKills"].int {
                                r.triplekill = "\(tkill)"
                            } else {
                                r.triplekill = self.const_zeros_s
                            }
                            
                            if let qkill = jstats["champions"][i]["stats"]["totalQuadraKills"].int {
                                r.quadrakill = "\(qkill)"
                            } else {
                                r.quadrakill = self.const_zeros_s
                            }
                            
                            if let pkill = jstats["champions"][i]["stats"]["totalPentaKills"].int {
                                r.pentakill = "\(pkill)"
                            } else {
                                r.pentakill = self.const_zeros_s
                            }
                            
                            if let turrets = jstats["champions"][i]["stats"]["totalTurretsKilled"].int {
                                r.turretskilled = "\(turrets)"
                            } else {
                                r.turretskilled = self.const_zeros_s
                            }
                            
                            if let firstblood = jstats["champions"][i]["stats"]["totalFirstBlood"].int {
                                r.firstblood = "\(firstblood)"
                            } else {
                                r.firstblood = self.const_zeros_s
                            }
                            
                            rtn.append(r)
                        }
                    }
                }
                
            case .failure(let error):
                NSLog(error as! String)
            }
            
            stats(rtn)
        }
    }
    
    func listarStatsProfile(stats:@escaping (Array<BEStats>) -> ()) {
        
        var rtn = Array<BEStats>()
        
        let url = "https://\(Region.REGION_BR.rawValue.lowercased()).api.riotgames.com/api/lol/\(Region.REGION_BR.rawValue.uppercased())/v1.3/stats/by-summoner/\(Summoner.summonerID)/ranked?season=SEASON2017&api_key=\(lol.api_key)"
        
        Alamofire.request(url).validate().responseJSON { response in
            
            switch response.result {
            case .success( _):
                let jstats = JSON(response.result.value!)
                
                if jstats != JSON.null {
                    if(!jstats.isEmpty){
                        for i in 0 ..< jstats["champions"].count {
                            let r = BEStats()
                            
                            if let champid = jstats["champions"][i]["id"].int {
                                r.championID = champid
                            }
                            
                            if let totsp = jstats["champions"][i]["stats"]["totalSessionsPlayed"].int {
                                if let kill = jstats["champions"][i]["stats"]["totalChampionKills"].int {
                                    r.kills = "\(kill)"
                                } else {
                                    r.kills = self.const_zeros_s
                                }
                                
                                if let death = jstats["champions"][i]["stats"]["totalDeathsPerSession"].int {
                                    r.deaths = "\(death)"
                                } else {
                                    r.deaths = self.const_zeros_s
                                }
                                
                                if let assist = jstats["champions"][i]["stats"]["totalAssists"].int {
                                    r.assists = "\(assist)"
                                } else {
                                    r.assists = self.const_zeros_s
                                }
                                
                                if let creep = jstats["champions"][i]["stats"]["totalMinionKills"].int {
                                    r.creeps = "\(creep)"
                                } else {
                                    r.creeps = self.const_zeros_s
                                }
                            } else {
                                if let kill = jstats["champions"][i]["stats"]["totalChampionKills"].int {
                                    r.kills = "\(kill)"
                                } else {
                                    r.kills = self.const_zeros_s
                                }
                                
                                if let death = jstats["champions"][i]["stats"]["totalDeathsPerSession"].int {
                                    r.deaths = "\(death)"
                                } else {
                                    r.deaths = self.const_zeros_s
                                }
                                
                                if let assist = jstats["champions"][i]["stats"]["totalAssists"].int {
                                    r.assists = "\(assist)"
                                } else {
                                    r.assists = self.const_zeros_s
                                }
                                
                                if let creep = jstats["champions"][i]["stats"]["totalMinionKills"].int {
                                    r.creeps = "\(creep)"
                                } else {
                                    r.creeps = self.const_zeros_s
                                }
                            }
                            
                            if let gold = jstats["champions"][i]["stats"]["totalGoldEarned"].int {
                                r.gold = gold
                            } else {
                                r.gold = self.const_zeros_i
                            }
                            
                            if let wins = jstats["champions"][i]["stats"]["totalSessionsWon"].int {
                                r.win = "\(wins)"
                            } else {
                                r.win = self.const_zeros_s
                            }
                            
                            if let loss = jstats["champions"][i]["stats"]["totalSessionsLost"].int {
                                r.loss = "\(loss)"
                            } else {
                                r.win = self.const_zeros_s
                            }
                            
                            if let dkill = jstats["champions"][i]["stats"]["totalDoubleKills"].int {
                                r.doublekill = "\(dkill)"
                            } else {
                                r.doublekill = self.const_zeros_s
                            }
                            
                            if let tkill = jstats["champions"][i]["stats"]["totalTripleKills"].int {
                                r.triplekill = "\(tkill)"
                            } else {
                                r.triplekill = self.const_zeros_s
                            }
                            
                            if let qkill = jstats["champions"][i]["stats"]["totalQuadraKills"].int {
                                r.quadrakill = "\(qkill)"
                            } else {
                                r.quadrakill = self.const_zeros_s
                            }
                            
                            if let pkill = jstats["champions"][i]["stats"]["totalPentaKills"].int {
                                r.pentakill = "\(pkill)"
                            } else {
                                r.pentakill = self.const_zeros_s
                            }
                            
                            if let turrets = jstats["champions"][i]["stats"]["totalTurretsKilled"].int {
                                r.turretskilled = "\(turrets)"
                            } else {
                                r.turretskilled = self.const_zeros_s
                            }
                            
                            if let firstblood = jstats["champions"][i]["stats"]["totalFirstBlood"].int {
                                r.firstblood = "\(firstblood)"
                            } else {
                                r.firstblood = self.const_zeros_s
                            }
                            
                            rtn.append(r)
                        }
                    }
                }
                
            case .failure(let error):
                NSLog(error as! String)
            }
            
            stats(rtn)
        }
    }
    
    func listarLeague(league:@escaping (Array<BELeague>) -> ()) {
        
        var rtn = Array<BELeague>()
        
        let url = "https://\(Region.REGION_BR.rawValue.lowercased()).api.riotgames.com/api/lol/\(Region.REGION_BR.rawValue.uppercased())/v2.5/league/by-summoner/\(Summoner.summonerID)/entry?api_key=\(lol.api_key)"
        
        Alamofire.request(url).validate().responseJSON { response in
            
            switch response.result {
            case .success( _):
                let jleague = JSON(response.result.value!)
                
                if jleague != JSON.null {
                    if(!jleague.isEmpty){
                        for i in 0 ..< jleague["\(Summoner.summonerID)"].count {
                            let r = BELeague()
                            
                            if let tier = jleague["\(Summoner.summonerID)"][i]["tier"].string {
                                r.tier = tier
                            }
                            
                            if let queue = jleague["\(Summoner.summonerID)"][i]["queue"].string {
                                r.queue = queue
                            }
                            
                            if let name = jleague["\(Summoner.summonerID)"][i]["name"].string {
                                r.name = name
                            }
                            
                            for a in 0 ..< jleague["\(Summoner.summonerID)"][i]["entries"].count {
                                
                                if let division = jleague["\(Summoner.summonerID)"][i]["entries"][a]["division"].string {
                                    r.division = division
                                }
                                
                                if let wins = jleague["\(Summoner.summonerID)"][i]["entries"][a]["wins"].int {
                                    r.wins = wins
                                }
                                
                                if let losses = jleague["\(Summoner.summonerID)"][i]["entries"][a]["losses"].int {
                                    r.losses = losses
                                }
                                
                                if let leaguePoints = jleague["\(Summoner.summonerID)"][i]["entries"][a]["leaguePoints"].int {
                                    r.leaguePoints = leaguePoints
                                }
                            }
                            
                            rtn.append(r)
                        }
                    }
                }
                
            case .failure(let error):
                NSLog(error as! String)
            }
            
            league(rtn)
        }
    }
    
    func listarMatch(match:@escaping (Array<Int>) -> ()) {
        
        var rtn = Array<Int>()
        
        let url = "https://\(Region.REGION_BR.rawValue.lowercased()).api.riotgames.com/api/lol/\(Region.REGION_BR.rawValue.uppercased())/v2.2/matchlist/by-summoner/\(Summoner.summonerID)?api_key=\(lol.api_key)"
        
        Alamofire.request(url).validate().responseJSON { response in
            
            switch response.result {
            case .success( _):
                let jmatch = JSON(response.result.value!)
                
                if jmatch != JSON.null {
                    if(!jmatch.isEmpty){
                        var partidas = 0
                        for i in 0 ..< jmatch["matches"].count {
                            var r = Int()
                            
                            if let matchId = jmatch["matches"][i]["matchId"].int {
                                r = matchId
                            }
                        
                            rtn.append(r)
                            partidas += 1
                            
                            if partidas == self.const_matches_qtds {
                                break
                            }
                        }
                    }
                }
                
            case .failure(let error):
                NSLog(error as! String)
            }
            match(rtn)
        }
    }
    
    func listarMatchDetUni(matchid:Int, matchdet:@escaping (BEMatch?) -> ()) {

        let match = rootclass.BEMatch()
        let url = "https://\(rootclass.Region.REGION_BR.rawValue.lowercased()).api.riotgames.com/api/lol/\(rootclass.Region.REGION_BR.rawValue.uppercased())/v2.2/match/\(matchid)?api_key=\(rootclass.lol.api_key)"

        Alamofire.request(url).validate().responseJSON { response in
            
            switch response.result {
            case .success( _):
                let jmatchdet = JSON(response.result.value!)
                
                if jmatchdet != JSON.null {
                    if(!jmatchdet.isEmpty){
                    
                        if let matchCreation = jmatchdet["matchCreation"].double {
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
                                participant.stats.item0imagelink = "\(rootclass.images.item)\(item0)\(rootclass.images.png)"
                            }
                            
                            if let item1 = jmatchdet["participants"][a]["stats"]["item1"].int {
                                participant.stats.item1 = item1
                                participant.stats.item1imagelink = "\(rootclass.images.item)\(item1)\(rootclass.images.png)"
                            }
                            
                            if let item2 = jmatchdet["participants"][a]["stats"]["item2"].int {
                                participant.stats.item2 = item2
                                participant.stats.item2imagelink = "\(rootclass.images.item)\(item2)\(rootclass.images.png)"
                            }
                            
                            if let item3 = jmatchdet["participants"][a]["stats"]["item3"].int {
                                participant.stats.item3 = item3
                                participant.stats.item3imagelink = "\(rootclass.images.item)\(item3)\(rootclass.images.png)"
                            }
                            
                            if let item4 = jmatchdet["participants"][a]["stats"]["item4"].int {
                                participant.stats.item4 = item4
                                participant.stats.item4imagelink = "\(rootclass.images.item)\(item4)\(rootclass.images.png)"
                            }
                            
                            if let item5 = jmatchdet["participants"][a]["stats"]["item5"].int {
                                participant.stats.item5 = item5
                                participant.stats.item5imagelink = "\(rootclass.images.item)\(item5)\(rootclass.images.png)"
                            }
                            
                            if let item6 = jmatchdet["participants"][a]["stats"]["item6"].int {
                                participant.stats.item6 = item6
                                participant.stats.item6imagelink = "\(rootclass.images.item)\(item6)\(rootclass.images.png)"
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
                            
                            participant.masterys = participant.masterys.sorted{ $0.masteryId < $1.masteryId }
                            
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
                            
                            if let towerKills = jmatchdet["teams"][e]["towerKills"].int {
                                team.towerKills = towerKills
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
                                    ban.pickTurn = pickTurn
                                }
                                
                                team.bans.append(ban)
                            }
                            
                            match.teams.append(team)
                        }
                        matchdet(match)
                    }
                }
            case .failure(let error):
                matchdet(nil)
            }
        }
    }
    
    func listarMatchDet(matchs:Array<Int>, matchdet:@escaping (Array<BEMatch>) -> ()) {
        
        var matchids = matchs
        
        var i = -1
        var tentativas = 0
        var matchant = 0
        
        var rtn = Array<BEMatch>()
        
        if matchids.count > 0 {
            while true {
                
                i += 1
                
                if matchids.count == 0 {
                    break
                }
                
                let semaphore = DispatchSemaphore(value: 0)
                let url = "https://\(rootclass.Region.REGION_BR.rawValue.lowercased()).api.riotgames.com/api/lol/\(rootclass.Region.REGION_BR.rawValue.uppercased())/v2.2/match/\(matchids[i])?api_key=\(rootclass.lol.api_key)"
                
                let queue = DispatchQueue.global(qos: .background)
                Alamofire.request(url).validate().responseJSON(queue: queue) { response in
            
                    switch response.result {
                    case .success( _):
                        let jmatchdet = JSON(response.result.value!)
                        
                        if jmatchdet != JSON.null {
                            if(!jmatchdet.isEmpty){
                                let match = rootclass.BEMatch()
                                
                                if let matchCreation = jmatchdet["matchCreation"].double {
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
                                        participant.stats.item0imagelink = "\(rootclass.images.item)\(item0)\(rootclass.images.png)"
                                    }
                                    
                                    if let item1 = jmatchdet["participants"][a]["stats"]["item1"].int {
                                        participant.stats.item1 = item1
                                        participant.stats.item1imagelink = "\(rootclass.images.item)\(item1)\(rootclass.images.png)"
                                    }
                                    
                                    if let item2 = jmatchdet["participants"][a]["stats"]["item2"].int {
                                        participant.stats.item2 = item2
                                        participant.stats.item2imagelink = "\(rootclass.images.item)\(item2)\(rootclass.images.png)"
                                    }
                                    
                                    if let item3 = jmatchdet["participants"][a]["stats"]["item3"].int {
                                        participant.stats.item3 = item3
                                        participant.stats.item3imagelink = "\(rootclass.images.item)\(item3)\(rootclass.images.png)"
                                    }
                                    
                                    if let item4 = jmatchdet["participants"][a]["stats"]["item4"].int {
                                        participant.stats.item4 = item4
                                        participant.stats.item4imagelink = "\(rootclass.images.item)\(item4)\(rootclass.images.png)"
                                    }
                                    
                                    if let item5 = jmatchdet["participants"][a]["stats"]["item5"].int {
                                        participant.stats.item5 = item5
                                        participant.stats.item5imagelink = "\(rootclass.images.item)\(item5)\(rootclass.images.png)"
                                    }
                                    
                                    if let item6 = jmatchdet["participants"][a]["stats"]["item6"].int {
                                        participant.stats.item6 = item6
                                        participant.stats.item6imagelink = "\(rootclass.images.item)\(item6)\(rootclass.images.png)"
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
                                    
                                    if let towerKills = jmatchdet["teams"][e]["towerKills"].int {
                                        team.towerKills = towerKills
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
                                            ban.pickTurn = pickTurn
                                        }
                                        
                                        team.bans.append(ban)
                                    }
                                    
                                    match.teams.append(team)
                                }

                                if match.matchCreation != 0 {
                                    tentativas = 0
                                    matchant = matchids[i]
                                    rtn.append(match)
                                    matchids.remove(at: i)
                                } else {
                                    if matchant == matchids[i] {
                                        if tentativas > 10 {
                                            matchdet(rtn)
                                        } else {
                                            tentativas += 1
                                        }
                                    }
                                }
                                
                                i = -1
                                semaphore.signal()

                                if rtn.count == self.const_matches_qtds {
                                    rtn = rtn.sorted{ $0.matchCreation > $1.matchCreation }
                                    matchdet(rtn)
                                }
                            }
                        }
                    case .failure(let error):
                        NSLog(error as! String)
                    }
                }
                semaphore.wait(timeout: .distantFuture)
            }
        }
    }
    
    func listarGame(match:@escaping (Array<BEMatchSmall>) -> ()) {
        
        var rtn = Array<BEMatchSmall>()
        
        let url = "https://\(Region.REGION_BR.rawValue.lowercased()).api.riotgames.com/api/lol/\(Region.REGION_BR.rawValue.uppercased())/v1.3/game/by-summoner/\(Summoner.summonerID)/recent?api_key=\(lol.api_key)"
        
        Alamofire.request(url).validate().responseJSON { response in
            
            switch response.result {
            case .success( _):
                let jgames = JSON(response.result.value!)
                
                if jgames != JSON.null {
                    if(!jgames.isEmpty){
                        for i in 0 ..< jgames["games"].count {
                            let r = BEMatchSmall()
                            
                            if let championId = jgames["games"][i]["championId"].int {
                                r.championId = championId
                            }
                            
                            if let gameId = jgames["games"][i]["gameId"].int {
                                r.gameId = gameId
                            }
                            
                            if let gameMode = jgames["games"][i]["gameMode"].string {
                                r.gameMode = gameMode
                            }
                            
                            if let gameType = jgames["games"][i]["gameType"].string {
                                r.gameType = gameType
                            }
                            
                            if let subType = jgames["games"][i]["subType"].string {
                                r.subType = subType
                            }
                            
                            if let createDate = jgames["games"][i]["createDate"].double {
                                r.createDate = createDate
                            }
                            
                            if let spell1 = jgames["games"][i]["spell1"].int {
                                r.spell1 = spell1
                            }
                           
                            if let spell2 = jgames["games"][i]["spell2"].int {
                                r.spell2 = spell2
                            }
                            
                            if let item0 = jgames["games"][i]["stats"]["item0"].int {
                                r.stats.item0 = item0
                                r.stats.item0imagelink = "\(rootclass.images.item)\(item0)\(rootclass.images.png)"
                            }
                            
                            if let item1 = jgames["games"][i]["stats"]["item1"].int {
                                r.stats.item1 = item1
                                r.stats.item1imagelink = "\(rootclass.images.item)\(item1)\(rootclass.images.png)"
                            }
                            
                            if let item2 = jgames["games"][i]["stats"]["item2"].int {
                                r.stats.item2 = item2
                                r.stats.item2imagelink = "\(rootclass.images.item)\(item2)\(rootclass.images.png)"
                            }
                            
                            if let item3 = jgames["games"][i]["stats"]["item3"].int {
                                r.stats.item3 = item3
                                r.stats.item3imagelink = "\(rootclass.images.item)\(item3)\(rootclass.images.png)"
                            }
                            
                            if let item4 = jgames["games"][i]["stats"]["item4"].int {
                                r.stats.item4 = item4
                                r.stats.item4imagelink = "\(rootclass.images.item)\(item4)\(rootclass.images.png)"
                            }
                            
                            if let item5 = jgames["games"][i]["stats"]["item5"].int {
                                r.stats.item5 = item5
                                r.stats.item5imagelink = "\(rootclass.images.item)\(item5)\(rootclass.images.png)"
                            }
                            
                            if let item6 = jgames["games"][i]["stats"]["item6"].int {
                                r.stats.item6 = item6
                                r.stats.item6imagelink = "\(rootclass.images.item)\(item6)\(rootclass.images.png)"
                            }
                            
                            if let goldEarned = jgames["games"][i]["stats"]["goldEarned"].double {
                                r.stats.goldEarned = goldEarned
                            }
                            
                            if let championsKilled = jgames["games"][i]["stats"]["championsKilled"].int {
                                r.stats.championsKilled = championsKilled
                            }
                            
                            if let numDeaths = jgames["games"][i]["stats"]["numDeaths"].int {
                                r.stats.numDeaths = numDeaths
                            }
                            
                            if let assists = jgames["games"][i]["stats"]["assists"].int {
                                r.stats.assists = assists
                            }
                            
                            if let timePlayed = jgames["games"][i]["stats"]["timePlayed"].int {
                                r.stats.timePlayed = timePlayed
                            }
                            
                            if let win = jgames["games"][i]["stats"]["win"].bool {
                                r.stats.win = win
                            }
                            
                            if let level = jgames["games"][i]["stats"]["level"].int {
                                r.stats.level = level
                            }
                            
                            if let minionsKilled = jgames["games"][i]["stats"]["minionsKilled"].int {
                                r.stats.minionsKilled = minionsKilled
                            }
 
                            rtn.append(r)
                        }
                        match(rtn)
                    }
                }
                
            case .failure(let error):
                print("ERROR - MATCHES SIMPLE")
            }
            match(rtn)
        }
    }
    
    func listarRunes(runes:@escaping (Array<BERunes>) -> ()) {
        
        var rtn = Array<BERunes>()
        
        let url = "https://\(Region.REGION_BR.rawValue.lowercased())1.api.riotgames.com/lol/platform/v3/runes/by-summoner/\(Summoner.summonerID)?api_key=\(lol.api_key)"
        
        Alamofire.request(url).validate().responseJSON { response in
            
            switch response.result {
            case .success( _):
                let jrunes = JSON(response.result.value!)
                
                if jrunes != JSON.null {
                    if(!jrunes.isEmpty){
                        for a in 0 ..< jrunes["pages"].count {
                            let rune = BERunes()
                            
                            if let name = jrunes["pages"][a]["name"].string {
                                rune.name = name
                            }
                            
                            if let current = jrunes["pages"][a]["current"].bool {
                                rune.current = current
                            }
                            
                            for b in 0 ..< jrunes["pages"][a]["slots"].count {
                                let r = BERunesSlots()
                                
                                if let runeId = jrunes["pages"][a]["slots"][b]["runeId"].int {
                                    r.runeId = runeId
                                }
                                
                                if let runeSlotId = jrunes["pages"][a]["slots"][b]["runeSlotId"].int {
                                    r.runeSlotId = runeSlotId
                                }
                                
                                rune.slots.append(r)
                            }
                            rtn.append(rune)
                        }
                        runes(rtn)
                    }
                }
                
            case .failure(let error):
                print("ERROR - MATCHES SIMPLE")
                runes(rtn)
            }
        }
    }
    
    func listarMasterys(masterys:@escaping (Array<BEMasterys>) -> ()) {
        
        var rtn = Array<BEMasterys>()
        
        let url = "https://\(Region.REGION_BR.rawValue.lowercased())1.api.riotgames.com/lol/platform/v3/masteries/by-summoner/\(Summoner.summonerID)?api_key=\(lol.api_key)"
        
        Alamofire.request(url).validate().responseJSON { response in
            
            switch response.result {
            case .success( _):
                let jmastery = JSON(response.result.value!)
                
                if jmastery != JSON.null {
                    if(!jmastery.isEmpty){
                        for a in 0 ..< jmastery["pages"].count {
                            let mast = BEMasterys()
                            
                            if let name = jmastery["pages"][a]["name"].string {
                                mast.name = name
                            }
                            
                            if let current = jmastery["pages"][a]["current"].bool {
                                mast.current = current
                            }
                            
                            for b in 0 ..< jmastery["pages"][a]["masteries"].count {
                                let r = BEMastery()
                                
                                if let masteryId = jmastery["pages"][a]["masteries"][b]["id"].int {
                                    r.masteryId = masteryId
                                }
                                
                                if let rank = jmastery["pages"][a]["masteries"][b]["rank"].int {
                                    r.rank = rank
                                }
                                
                                mast.masteries.append(r)
                            }
                            
                            mast.masteries = mast.masteries.sorted{ $0.masteryId < $1.masteryId }
                            
                            rtn.append(mast)
                        }
                        masterys(rtn)
                    }
                }
                
            case .failure(let error):
                print("ERROR - MATCHES SIMPLE")
                masterys(rtn)
            }
        }
    }

    func listaChamp(id:Int) -> staticchampions {
        var rtn = staticchampions()
        
        let champf = lststaticchampions.filter({ p in p.id == id})
        if champf.count > 0 {
            rtn = champf[0]
        }
        
        return rtn
    }
    
    func listaRune(id:Int) -> staticrunes {
        var rtn = staticrunes()
        
        let runef = lststaticrunes.filter({ p in p.id == id})
        if runef.count > 0 {
            rtn = runef[0]
        }
        
        return rtn
    }
    
    func listaMastery(id:Int) -> staticmastery {
        var rtn = staticmastery()
        
        let mastf = lststaticmastery.filter({ p in p.id == id})
        if mastf.count > 0 {
            rtn = mastf[0]
        }
        
        return rtn
    }
    
    func listaSpeel(id:Int) -> staticspell {
        var rtn = staticspell()
        
        let spellf = lststaticspell.filter({ p in p.id == id})
        if spellf.count > 0 {
            rtn = spellf[0]
        }
        
        return rtn
    }
}
