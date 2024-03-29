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
import Firebase

protocol updateImagesSpec {
    func updateImagesSpec()
}

protocol updateMatches {
    func updateMatches()
}

final class rootclass: NSObject {
    
    static let sharedInstance: rootclass = rootclass()
    
    var delegateUpdateImagesSpec:updateImagesSpec! = nil
    var delegateUpdateMatches:updateMatches! = nil
    
    private override init() {
        super.init()
    }
    
    var viewbanner = true
    
    var dicStaticSpell = Dictionary<Int, staticspell>()
    var dicStaticRunes = Dictionary<Int, staticrunes>()
    var dicStaticRunesReforged = Dictionary<Int, staticrune>()
    var dicStaticChampions = Dictionary<Int, staticchampions>()
    var dicStaticMastery = Dictionary<Int, staticmastery>()
    var dicStaticChampMastery = Dictionary<Int, staticchampmastery>()
    var dicStaticItens = Dictionary<Int, staticitem>()
    var dicStaticMasteryOrder = Dictionary<String, Int>()
    
    var listStaticChampMastery = Array<staticchampmastery>()
    var listStaticChamp = Array<staticchampions>()
    var listStaticItem = Array<staticitem>()
    var listStaticRunesReforged = Array<staticrune>()
    
    var listSessionMatches = Array<Int>()
    var listSessionMatchesSmall = Array<BEMatchSmall>()
    var dicSessionMatches = Dictionary<Int, BEMatch>()
    var dicSessionMatchesQueue = Dictionary<Int, String>()
    
    class staticspell {
        var id:Int = 0
        var key:String = ""
        var name:String = ""
        var imagefull:String = ""
        var imagelink:String = ""
    }
    
    //#R00T
    // CHAMPION - INI
    class staticchampions {
        var id:Int = 0
        var key:String = ""
        var name:String = ""
        var imagefull:String = ""
        var imagelink:String = ""
        var lore:String = ""
        var title:String = ""
        var passiva_name:String = ""
        var passiva_descricao:String = ""
        var passiva_link:String = ""
        
        var info_attack:Int = 0
        var info_defense:Int = 0
        var info_magic:Int = 0
        var info_difficulty:Int = 0
        
        var stats:championstats = championstats()
        var tags:Array<String> = Array<String>()
        var skins:Array<championskin> = Array<championskin>()
        var speels:Array<championspell> = Array<championspell>()
    }
    
    class championskin {
        var name:String = ""
        var link:String = ""
    }
    
    class championspell {
        var name:String = ""
        var custo:String = ""
        var alcance:String = ""
        var cooldown:String = ""
        var sandescricao:String = ""
        var descricao:String = ""
        var image_link:String = ""
    }
    
    class championstats {
        var armor:Double = 0
        var armorperlevel:Double = 0
        var attackdamage:Double = 0
        var attackdamageperlevel:Double = 0
        var attackrange:Double = 0
        var attackspeedoffset:Double = 0
        var attackspeedperlevel:Double = 0
        var crit:Double = 0
        var critperlevel:Double = 0
        var hp:Double = 0
        var hpperlevel:Double = 0
        var hpregen:Double = 0
        var hpregenperlevel:Double = 0
        var movespeed:Double = 0
        var mp:Double = 0
        var mpperlevel:Double = 0
        var mpregen:Double = 0
        var mpregenperlevel:Double = 0
        var spellblock:Double = 0
        var spellblockperlevel:Double = 0
    }
    
    // CHAMPION - FIM
    
    class staticitem{
        var id:Int = 0
        var name:String = ""
        var description:String = ""
        var imagefull:String = ""
        var imagelink:String = ""
        var gold:staticitemgold = staticitemgold()
        var into:Array<String> = Array<String>()
        var from:Array<String> = Array<String>()
    }
    
    class staticitemgold{
        var base:Int = 0
        var total:Int = 0
        var sell:Int = 0
        var purchasable:Bool = false
    }
    
    class staticrune{
        var id:Int = 0
        var key:String = ""
        var name:String = ""
        var shortDesc:String = ""
        var longDesc:String = ""
        var runePathId:Int = 0
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
    
    class staticchampmastery {
        var championId:Int = 0
        var championPoints:Int = 0
        var championLevel:Int = 0
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
        static internal var masteryschamp:String = "MASTERYS_CHAMP"
        static internal var spectador:String = "SPECTADOR"
        static internal var spectadordet:String = "SPECTADOR_DET"
        static internal var champions:String = "CHAMPIONS"
        static internal var config:String = "CONFIG"
        static internal var language:String = "LANGUAGE"
        static internal var itens:String = "ITENS"
        static internal var itensdetalhe:String = "ITENS_DET"
    }
    
    struct lol {
        static internal var version:String = "7.9.2"
        static internal var api_key:String = "RGAPI-bf12658b-d9c8-45d1-8016-caca0b5d0d62"
        static internal var server:String = "BR"
        static internal var language:String = "en_US"
        static internal var language_description:String = "en_US"
    }
    
    struct images {
        static internal let champion_skins:String = "https://ddragon.leagueoflegends.com/cdn/img/champion/splash/"
        
        static internal let item:String = "https://ddragon.leagueoflegends.com/cdn/\(rootclass.lol.version)/img/item/"
        static internal let champion:String = "https://ddragon.leagueoflegends.com/cdn/\(rootclass.lol.version)/img/champion/"
        static internal let profileicon:String = "https://ddragon.leagueoflegends.com/cdn/\(rootclass.lol.version)/img/profileicon/"
        static internal let rune:String = "https://ddragon.leagueoflegends.com/cdn/\(rootclass.lol.version)/img/rune/"
        static internal let spell:String = "https://ddragon.leagueoflegends.com/cdn/\(rootclass.lol.version)/img/spell/"
        static internal let spell_champion:String = "https://ddragon.leagueoflegends.com/cdn/\(rootclass.lol.version)/img/spell/"
        static internal let mastery:String = "https://ddragon.leagueoflegends.com/cdn/\(rootclass.lol.version)/img/mastery/"
        static internal let passive:String = "https://ddragon.leagueoflegends.com/cdn/\(rootclass.lol.version)/img/passive/"
        
        static internal let png:String = ".png"
        static internal let jpg:String = ".jpg"
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
        //spectador
        var order:Int = 0;
    }
    
    class BEMatchSmall {
        var gameId:Int = 0
        var gameMode:String = ""
        var queue:String = ""
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
        var gameId:Int = 0
        var queueType:String = ""
        var gameDuration:Int = 0
        var gameCreation:Double = 0
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
        //BESpec
        var teamId:Int = 0
        //BESpec
        var championId:Int = 0
        var pickTurn:Int = 0
    }
    
    class BEParticipants {
        //BESpec
        var summonerName:String = ""
        var summonerId:Int = 0
        var leagues:Array<BELeague> = Array<BELeague>()
        var maestry:staticchampmastery = staticchampmastery()
        //BESpec
        var teamId:Int = 0
        var spell1Id:Int = 0
        var spell2Id:Int = 0
        var championId:Int = 0
        var participantId:Int = 0
        var stats:BEMatchStats = BEMatchStats()
        var masterys:Array<BEMastery> = Array<BEMastery>()
        var runes:Array<Int> = Array<Int>()
    }
    
    class BEParticipantsIdent {
        var participantId:Int = 0
        var summonerId:Int = 0
        var summonerName:String = ""
    }
    
    class BEMatchStats {
        var win:Bool = false
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
        var totalMinionsKilled:Int = 0
        var neutralMinionsKilled:Int = 0
        var neutralMinionsKilledTeamJungle:Int = 0
        var neutralMinionsKilledEnemyJungle:Int = 0
        var goldEarned:Double = 0.0
        var turretKills:Int = 0
        var visionWardsBoughtInGame:Int = 0
        var wardsPlaced:Int = 0
        var wardsKilled:Int = 0
    }
    
    class BETeams {
        var win:String = ""
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
    
    class BESpec {
        var participants:Array<BEParticipants> = Array<BEParticipants>()
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
    
    class BELanguage {
        var language:String = ""
        var description:String = ""
        
        init(language:String, description:String) {
            self.language = language
            self.description = description
        }
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
    
    func listarStaticChampMastery() {
        
        var url = ""
        
        switch lol.server {
        case Region.REGION_RU.rawValue,
             Region.REGION_KR.rawValue:
            url = "https://\(lol.server).api.riotgames.com/lol/champion-mastery/v3/champion-masteries/by-summoner/\(Summoner.summonerID)?api_key=\(lol.api_key)"
        case Region.REGION_BR.rawValue,
             Region.REGION_OCE.rawValue,
             Region.REGION_JP.rawValue,
             Region.REGION_NA.rawValue,
             Region.REGION_EUNE.rawValue,
             Region.REGION_EUW.rawValue,
             Region.REGION_TR.rawValue,
             Region.REGION_LAN.rawValue:
            url = "https://\(lol.server)1.api.riotgames.com/lol/champion-mastery/v3/champion-masteries/by-summoner/\(Summoner.summonerID)?api_key=\(lol.api_key)"
        case Region.REGION_LAS.rawValue:
            url = "https://\(lol.server)2.api.riotgames.com/lol/champion-mastery/v3/champion-masteries/by-summoner/\(Summoner.summonerID)?api_key=\(lol.api_key)"
        default:
            NSLog("#R00T - ERROR SERVER")
        }
        
        Alamofire.request(url).validate().responseJSON { response in
            
            switch response.result {
            case .success( _):
                let jmastery = JSON(response.result.value!)
                
                self.dicStaticChampMastery = Dictionary<Int, staticchampmastery>()
                self.listStaticChampMastery = Array<staticchampmastery>()
                
                if jmastery != JSON.null {
                    if(!jmastery.isEmpty){
                        for i in 0 ..< jmastery.count {
                            let r = staticchampmastery()
                            
                            if let championId = jmastery[i]["championId"].int {
                                r.championId = championId
                            }
                            
                            if let championLevel = jmastery[i]["championLevel"].int {
                                r.championLevel = championLevel
                            }
                            
                            if let championPoints = jmastery[i]["championPoints"].int {
                                r.championPoints = championPoints
                            }
                            
                            self.dicStaticChampMastery[r.championId] = r
                            self.listStaticChampMastery.append(r)
                        }
                    }
                }
                
            case .failure(let error):
                if let status = response.response?.statusCode {
                    
                    if status == 403 {
                        self.listaKeyLOL()
                    }
                }
                NSLog("#R00T - ERROR GET CHAMPION MASTERY - ERROR: \(error)")
            }
        }
    }
    
    func listarStaticSpell(spells:@escaping (JSON) -> ()) {
        
        let url = "https://na1.api.riotgames.com/lol/static-data/v3/summoner-spells?spellListData=image&api_key=\(lol.api_key)"
        
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
                    
                    self.dicStaticSpell[r.id] = r
                }
                
                if self.dicStaticSpell.count > 0 {
                    
                    NSLog("R00T - GET SPELLS SUCESS")
                    spells(jspell)
                }
                
            case .failure(let error):
                if let status = response.response?.statusCode {
                    
                    if status == 403 {
                        self.listaKeyLOL()
                    }
                }
                NSLog("R00T - GET SPELLS ERROR")
            }
        }
    }
    
    
    func listarStaticRunes(runes:@escaping (JSON) -> ()) {
        
        let url = "https://na1.api.riotgames.com/lol/static-data/v3/runes?locale=en_US&tags=all&api_key=\(lol.api_key)"
        //let url = "https://na1.api.riotgames.com/lol/static-data/v3/runes?runeListData=basic,image&api_key=\(lol.api_key)"
        
        
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
                    
                    self.dicStaticRunes[r.id] = r
                }
                
                if self.dicStaticRunes.count > 0 {
                    
                    NSLog("R00T - GET RUNES SUCESS")
                    runes(jrunes)
                }
                
            case .failure(let error):
                if let status = response.response?.statusCode {
                    
                    if status == 403 {
                        self.listaKeyLOL()
                    }
                }
                NSLog("R00T - GET RUNES ERROR")
            }
        }
    }
    
    //#R00T
    func listarStaticChampions(champions:@escaping (JSON) -> ()) {
        
       
        
//        
//        let url = "https://na1.api.riotgames.com/lol/static-data/v3/champions?tags=image&tags=spells&tags=info&tags=skins&tags=lore&tags=tags&dataById=false&api_key=\(lol.api_key)"
        
        let url = "https://na1.api.riotgames.com/lol/static-data/v3/champions?tags=image&locale=pt_BR&tags=passive&tags=stats&tags=spells&tags=info&tags=skins&tags=lore&tags=tags&dataById=false&api_key=\(lol.api_key)"
        
        let queue = DispatchQueue.global(qos: .background)
        Alamofire.request(url).validate().responseJSON(queue: queue) { response in
            
            switch response.result {
            case .success( _):
                
                do {
                    if let file = Bundle.main.url(forResource: "champion", withExtension: "json") {
                        let data = try Data(contentsOf: file)
                        let jchampions = try JSON(data:data)
                        
                        let dchampions: Dictionary<String, JSON> = jchampions["data"].dictionaryValue
                        
                        self.listStaticChamp = Array<staticchampions>()
                        
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
                            
                            if let title = value["title"].string {
                                r.title = title
                            }
                            
                            if let lore = value["lore"].string {
                                r.lore = lore
                            }
                            
                            if let attack = value["info"]["attack"].int {
                                r.info_attack = attack
                            }
                            
                            if let defense = value["info"]["defense"].int {
                                r.info_defense = defense
                            }
                            
                            if let magic = value["info"]["magic"].int {
                                r.info_magic = magic
                            }
                            
                            if let difficulty = value["info"]["difficulty"].int {
                                r.info_difficulty = difficulty
                            }
                            
                            if let passiva_name = value["passive"]["name"].string {
                                r.passiva_name = passiva_name
                            }
                            
                            if let passiva_descricao = value["passive"]["sanitizedDescription"].string {
                                r.passiva_descricao = passiva_descricao
                            }
                            
                            if let passiva_link = value["passive"]["image"]["full"].string {
                                r.passiva_link = "\(rootclass.images.passive)\(passiva_link)"
                            }
                            
                            if let armor = value["stats"]["armor"].double {
                                r.stats.armor = armor
                            }
                            
                            if let armorperlevel = value["stats"]["armorperlevel"].double {
                                r.stats.armorperlevel = armorperlevel
                            }
                            
                            if let attackdamage = value["stats"]["attackdamage"].double {
                                r.stats.attackdamage = attackdamage
                            }
                            
                            if let attackdamageperlevel = value["stats"]["attackdamageperlevel"].double {
                                r.stats.attackdamageperlevel = attackdamageperlevel
                            }
                            
                            if let attackrange = value["stats"]["attackrange"].double {
                                r.stats.attackrange = attackrange
                            }
                            
                            if let attackspeedoffset = value["stats"]["attackspeedoffset"].double {
                                r.stats.attackspeedoffset = attackspeedoffset
                            }
                            
                            if let attackspeedperlevel = value["stats"]["attackspeedperlevel"].double {
                                r.stats.attackspeedperlevel = attackspeedperlevel
                            }
                            
                            if let crit = value["stats"]["crit"].double {
                                r.stats.crit = crit
                            }
                            
                            if let critperlevel = value["stats"]["critperlevel"].double {
                                r.stats.critperlevel = critperlevel
                            }
                            
                            if let hp = value["stats"]["hp"].double {
                                r.stats.hp = hp
                            }
                            
                            if let hpperlevel = value["stats"]["hpperlevel"].double {
                                r.stats.hpperlevel = hpperlevel
                            }
                            
                            if let hpregen = value["stats"]["hpregen"].double {
                                r.stats.hpregen = hpregen
                            }
                            
                            if let hpregenperlevel = value["stats"]["hpregenperlevel"].double {
                                r.stats.hpregenperlevel = hpregenperlevel
                            }
                            
                            if let movespeed = value["stats"]["movespeed"].double {
                                r.stats.movespeed = movespeed
                            }
                            
                            if let mp = value["stats"]["mp"].double {
                                r.stats.mp = mp
                            }
                            
                            if let mpperlevel = value["stats"]["mpperlevel"].double {
                                r.stats.mpperlevel = mpperlevel
                            }
                            
                            if let mpregen = value["stats"]["mpregen"].double {
                                r.stats.mpregen = mpregen
                            }
                            
                            if let mpregenperlevel = value["stats"]["mpregenperlevel"].double {
                                r.stats.mpregenperlevel = mpregenperlevel
                            }
                            
                            if let spellblock = value["stats"]["spellblock"].double {
                                r.stats.spellblock = spellblock
                            }
                            
                            if let spellblockperlevel = value["stats"]["spellblockperlevel"].double {
                                r.stats.spellblockperlevel = spellblockperlevel
                            }
                            
                            for i in 0 ..< value["tags"].count {
                                if let tag = value["tags"][i].string {
                                    r.tags.append(tag)
                                }
                            }
                            
                            for i in 0 ..< value["skins"].count {
                                
                                let skin = championskin()
                                
                                if let name = value["skins"][i]["name"].string {
                                    skin.name = name
                                    if let num = value["skins"][i]["num"].int {
                                        if num == 0 {
                                            skin.name = r.name
                                        }
                                    }
                                }
                                
                                if let num = value["skins"][i]["num"].int {
                                    skin.link = "\(rootclass.images.champion_skins)\(r.key)_\(num)\(rootclass.images.jpg)"
                                }
                                
                                r.skins.append(skin)
                            }
                            
                            for i in 0 ..< value["spells"].count {
                                
                                let spell = championspell()
                                
                                // VARS - INI
                                var variables = Dictionary<String, String>()
                                for a in 0 ..< value["spells"][i]["effectBurn"].count {
                                    if let effect = value["spells"][i]["effectBurn"][a].string {
                                        variables["{{ e\(a) }}"] = effect
                                    }
                                }
                                
                                var coeffs = Array<String>()
                                for a in 0 ..< value["spells"][i]["vars"].count {
                                    if let key = value["spells"][i]["vars"][a]["key"].string {
                                        for b in 0 ..< value["spells"][i]["vars"][a]["coeff"].count {
                                            if let coeff = value["spells"][i]["vars"][a]["coeff"][b].double {
                                                coeffs.append("\(coeff)")
                                            }
                                        }
                                        variables["{{ \(key) }}"] = coeffs.flatMap({$0}).joined(separator:"/")
                                    }
                                }
                                
                                var costs = Array<String>()
                                for a in 0 ..< value["spells"][i]["cost"].count {
                                    if let cost = value["spells"][i]["cost"][a].int {
                                        costs.append("\(cost)")
                                    }
                                    variables["{{ cost }}"] = costs.flatMap({$0}).joined(separator:"/")
                                }
                                
                                if let costBurn = value["spells"][i]["costBurn"].string {
                                    if let costType = value["spells"][i]["costType"].string {
                                        if costBurn == "0" {
                                            spell.custo = costType
                                        } else {
                                            spell.custo = "\(costBurn)\(costType)"
                                        }
                                    }
                                }
                                
                                // VARS - FIM
                                
                                if let cooldownBurn = value["spells"][i]["cooldownBurn"].string {
                                    spell.cooldown = cooldownBurn
                                }
                                
                                if let sanitizedDescription = value["spells"][i]["sanitizedDescription"].string {
                                    spell.sandescricao = sanitizedDescription
                                }
                                
                                if let sanitizedDescription = value["spells"][i]["sanitizedDescription"].string {
                                    spell.sandescricao = sanitizedDescription
                                }
                                
                                if let tooltip = value["spells"][i]["tooltip"].string {
                                    spell.descricao = tooltip
                                }
                                
                                if let name = value["spells"][i]["name"].string {
                                    spell.name = name
                                }
                                
                                if let rangeBurn = value["spells"][i]["rangeBurn"].string {
                                    spell.alcance = rangeBurn
                                }
                                
                                if let image_speel = value["spells"][i]["image"]["full"].string {
                                    spell.image_link = "\(rootclass.images.spell_champion)\(image_speel)"
                                }
                                
                                
                                for ( key, value) in variables {
                                    spell.descricao = spell.descricao.replacingOccurrences(of: key, with: value, options: .literal, range: nil)
                                }
                                
                                if spell.descricao.contains("{{") {
                                    spell.descricao = spell.sandescricao
                                }
                                
                                //Retira HTML
                                spell.descricao = spell.descricao.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
                                r.speels.append(spell)
                                
                            }
                            
                            if let imagefull = value["image"]["full"].string {
                                r.imagefull = imagefull
                                r.imagelink = "\(rootclass.images.champion)\(imagefull)"
                            }
                            
                            self.dicStaticChampions[r.id] = r
                            self.listStaticChamp.append(r)
                        }
                        
                        var champcustom = Array<[String:Any]>()
                        
                        for i in 0 ..< self.listStaticChamp.count {
                            var skins = Array<[String:Any]>()
                            var speels = Array<[String:Any]>()
                            var tags = Array<[String:Any]>()
                            
                            for a in 0 ..< self.listStaticChamp[i].skins.count {
                                var skin:[String:Any] = [
                                    "link":self.listStaticChamp[i].skins[a].link,
                                    "name":self.listStaticChamp[i].skins[a].name,
                                    ]
                                
                                skins.append(skin)
                                
                            }
                            
                            for a in 0 ..< self.listStaticChamp[i].speels.count {
                                var speel:[String:Any] = [
                                    "alcance":self.listStaticChamp[i].speels[a].alcance,
                                    "cooldown":self.listStaticChamp[i].speels[a].cooldown,
                                    "custo":self.listStaticChamp[i].speels[a].custo,
                                    "descricao":self.listStaticChamp[i].speels[a].descricao,
                                    "image_link":self.listStaticChamp[i].speels[a].image_link,
                                    "name":self.listStaticChamp[i].speels[a].name,
                                    "sandescricao":self.listStaticChamp[i].speels[a].sandescricao
                                ]
                                
                                speels.append(speel)
                                
                            }
                            
                            for a in 0 ..< self.listStaticChamp[i].tags.count {
                                var tag:[String:Any] = [
                                    "valor":self.listStaticChamp[i].tags[a]
                                ]
                                
                                tags.append(tag)
                                
                            }
                            
                            var stats:[String:Any] = [
                                "armor":self.listStaticChamp[i].stats.armor,
                                "armorperlevel":self.listStaticChamp[i].stats.armorperlevel,
                                "attackdamage":self.listStaticChamp[i].stats.attackdamage,
                                "attackdamageperlevel":self.listStaticChamp[i].stats.attackdamageperlevel,
                                "attackrange":self.listStaticChamp[i].stats.attackrange,
                                "attackspeedoffset":self.listStaticChamp[i].stats.attackspeedoffset,
                                "attackspeedperlevel":self.listStaticChamp[i].stats.attackspeedperlevel,
                                "crit":self.listStaticChamp[i].stats.crit,
                                "critperlevel":self.listStaticChamp[i].stats.critperlevel,
                                "hp":self.listStaticChamp[i].stats.hp,
                                "hpperlevel":self.listStaticChamp[i].stats.hpperlevel,
                                "hpregen":self.listStaticChamp[i].stats.hpregen,
                                "hpregenperlevel":self.listStaticChamp[i].stats.hpregenperlevel,
                                "movespeed":self.listStaticChamp[i].stats.movespeed,
                                "mp":self.listStaticChamp[i].stats.mp,
                                "mpperlevel":self.listStaticChamp[i].stats.mpperlevel,
                                "mpregen":self.listStaticChamp[i].stats.mpregen,
                                "mpregenperlevel":self.listStaticChamp[i].stats.mpregenperlevel,
                                "spellblock":self.listStaticChamp[i].stats.spellblock,
                                "spellblockperlevel":self.listStaticChamp[i].stats.spellblockperlevel
                            ]
                            
                            
                            var rowC:[String:Any] = [
                                "id":self.listStaticChamp[i].id,
                                "imagefull":self.listStaticChamp[i].imagefull,
                                "imagelink":self.listStaticChamp[i].imagelink,
                                "info_attack":self.listStaticChamp[i].info_attack,
                                "info_defense":self.listStaticChamp[i].info_defense,
                                "info_difficulty":self.listStaticChamp[i].info_difficulty,
                                "key":self.listStaticChamp[i].key,
                                "lore":self.listStaticChamp[i].lore,
                                "name":self.listStaticChamp[i].name,
                                "passiva_descricao":self.listStaticChamp[i].passiva_descricao,
                                "passiva_link":self.listStaticChamp[i].passiva_link,
                                "title":self.listStaticChamp[i].title,
                                "skins":JSON(skins),
                                "speels":JSON(speels),
                                "tags":JSON(tags),
                                "stats":JSON(stats)
                            ]
                            
                            champcustom.append(rowC)
                        }
                        
                        let jchampcustom = JSON(champcustom)
                        
                        if self.dicStaticChampions.count > 0 {
                            NSLog("R00T - GET CHAMPIONS SUCESS")
                            champions(jchampcustom)
                        }
                    }
                } catch {
                    print(error.localizedDescription)
                }
                
            case .failure(let error):
                if let status = response.response?.statusCode {
                    
                    if status == 403 {
                        self.listaKeyLOL()
                    }
                }
                NSLog("R00T - GET CHAMPIONS ERROR")
            }
        }
    }
    
    func listarStaticMastery(mastery:@escaping (JSON) -> ()) {
        
        let url = "https://na1.api.riotgames.com/lol/static-data/v3/masteries?masteryListData=image&api_key=\(lol.api_key)"
        
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
                    
                    self.dicStaticMastery[r.id] = r
                }
                
                if self.dicStaticMastery.count > 0 {
                    NSLog("R00T - GET MASTERY SUCESS")
                    mastery(jmastery)
                }
                
            case .failure(let error):
                if let status = response.response?.statusCode {
                    
                    if status == 403 {
                        self.listaKeyLOL()
                    }
                }
                NSLog("R00T - GET MASTERY ERROR")
            }
        }
    }
    
    func listarStaticSpell(jspell:JSON) {
        
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
            
            self.dicStaticSpell[r.id] = r
        }
    }
    
    func listarStaticRunes(jrunes:JSON) {
        
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
            
            self.dicStaticRunes[r.id] = r
        }
    }
    
    //#R00T
    func carregarChampionsLocal() {
        
        if let url = Bundle.main.url(forResource:"champion-\(rootclass.lol.language)", withExtension: "json") {
            do {
                let data = try Data(contentsOf:url)
                let jchampions = try JSON(data: data)
                
                if jchampions != JSON.null {
                    if(!jchampions.isEmpty){
                        
                        self.dicStaticChampions = Dictionary<Int, staticchampions>()
                        self.listStaticChamp = Array<staticchampions>()
                        
                        for i in 0 ..< jchampions.count {
                            
                            let r = staticchampions()
                            
                            if let id = jchampions[i]["id"].int {
                                r.id = id
                            }
                            
                            if let key = jchampions[i]["key"].string {
                                r.key = key
                            }
                            
                            if let name = jchampions[i]["name"].string {
                                r.name = name
                            }
                            
                            if let imagefull = jchampions[i]["imagefull"].string {
                                r.imagefull = imagefull
                            }
                            
                            if let imagelink = jchampions[i]["imagelink"].string {
                                r.imagelink = imagelink
                            }
                            
                            if let lore = jchampions[i]["lore"].string {
                                r.lore = lore
                            }
                            
                            if let title = jchampions[i]["title"].string {
                                r.title = title
                            }
                            
                            if let passiva_name = jchampions[i]["passiva_name"].string {
                                r.passiva_name = passiva_name
                            }
                            
                            if let passiva_descricao = jchampions[i]["passiva_descricao"].string {
                                r.passiva_descricao = passiva_descricao
                            }
                            
                            if let passiva_link = jchampions[i]["passiva_link"].string {
                                r.passiva_link = passiva_link
                            }
                            
                            if let info_attack = jchampions[i]["info_attack"].int {
                                r.info_attack = info_attack
                            }
                            
                            if let info_defense = jchampions[i]["info_defense"].int {
                                r.info_defense = info_defense
                            }
                            
                            if let info_magic = jchampions[i]["info_magic"].int {
                                r.info_magic = info_magic
                            }
                            
                            if let info_difficulty = jchampions[i]["info_difficulty"].int {
                                r.info_difficulty = info_difficulty
                            }
                            
                            // STATS
                            var stat = championstats()
                            
                            if let armor = jchampions[i]["stats"]["armor"].double {
                                stat.armor = armor
                            }
                            
                            if let armorperlevel = jchampions[i]["stats"]["armorperlevel"].double {
                                stat.armorperlevel = armorperlevel
                            }
                            
                            if let attackdamage = jchampions[i]["stats"]["attackdamage"].double {
                                stat.armor = attackdamage
                            }
                            
                            if let attackdamageperlevel = jchampions[i]["stats"]["attackdamageperlevel"].double {
                                stat.attackdamageperlevel = attackdamageperlevel
                            }
                            
                            if let attackrange = jchampions[i]["stats"]["attackrange"].double {
                                stat.attackrange = attackrange
                            }
                            
                            if let attackspeedoffset = jchampions[i]["stats"]["attackspeedoffset"].double {
                                stat.attackspeedoffset = attackspeedoffset
                            }
                            
                            if let attackspeedperlevel = jchampions[i]["stats"]["attackspeedperlevel"].double {
                                stat.attackspeedperlevel = attackspeedperlevel
                            }
                            
                            if let crit = jchampions[i]["stats"]["crit"].double {
                                stat.crit = crit
                            }
                            
                            if let critperlevel = jchampions[i]["stats"]["critperlevel"].double {
                                stat.critperlevel = critperlevel
                            }
                            
                            if let hp = jchampions[i]["stats"]["hp"].double {
                                stat.hp = hp
                            }
                            
                            if let hpperlevel = jchampions[i]["stats"]["hpperlevel"].double {
                                stat.hpperlevel = hpperlevel
                            }
                            
                            if let hpregen = jchampions[i]["stats"]["hpregen"].double {
                                stat.hpregen = hpregen
                            }
                            
                            if let hpregenperlevel = jchampions[i]["stats"]["hpregenperlevel"].double {
                                stat.hpregenperlevel = hpregenperlevel
                            }
                            
                            if let movespeed = jchampions[i]["stats"]["movespeed"].double {
                                stat.movespeed = movespeed
                            }
                            
                            if let mp = jchampions[i]["stats"]["mp"].double {
                                stat.mp = mp
                            }
                            
                            if let mpperlevel = jchampions[i]["stats"]["mpperlevel"].double {
                                stat.mpperlevel = mpperlevel
                            }
                            
                            if let mpregen = jchampions[i]["stats"]["mpregen"].double {
                                stat.mpregen = mpregen
                            }
                            
                            if let mpregenperlevel = jchampions[i]["stats"]["mpregenperlevel"].double {
                                stat.mpregenperlevel = mpregenperlevel
                            }
                            
                            if let spellblock = jchampions[i]["stats"]["spellblock"].double {
                                stat.spellblock = spellblock
                            }
                            
                            if let spellblockperlevel = jchampions[i]["stats"]["spellblockperlevel"].double {
                                stat.spellblockperlevel = spellblockperlevel
                            }
                            
                            r.stats = stat
                            
                            for a in 0 ..< jchampions[i]["tags"].count {
                                if let valor = jchampions[i]["tags"][a].string {
                                    r.tags.append(valor)
                                }
                            }
                            
                            for a in 0 ..< jchampions[i]["skins"].count {
                                
                                var skin = championskin()
                                
                                if let name = jchampions[i]["skins"][a]["name"].string {
                                    skin.name = name
                                }
                                
                                if let link = jchampions[i]["skins"][a]["link"].string {
                                    skin.link = link
                                }
                                
                                r.skins.append(skin)
                            }
                            
                            for a in 0 ..< jchampions[i]["spells"].count {
                                
                                var spell = championspell()
                                
                                if let name = jchampions[i]["spells"][a]["name"].string {
                                    spell.name = name
                                }
                                
                                if let custo = jchampions[i]["spells"][a]["custo"].string {
                                    spell.custo = custo
                                }
                                
                                if let alcance = jchampions[i]["spells"][a]["alcance"].string {
                                    spell.alcance = alcance
                                }
                                
                                if let cooldown = jchampions[i]["spells"][a]["cooldown"].string {
                                    spell.cooldown = cooldown
                                }
                                
                                if let sandescricao = jchampions[i]["spells"][a]["sandescricao"].string {
                                    spell.sandescricao = sandescricao
                                }
                                
                                if let descricao = jchampions[i]["spells"][a]["descricao"].string {
                                    spell.descricao = descricao
                                }
                                
                                if let image_link = jchampions[i]["spells"][a]["image_link"].string {
                                    spell.image_link = image_link
                                }
                                
                                r.speels.append(spell)
                            }
                            
                            self.dicStaticChampions[r.id] = r
                            self.listStaticChamp.append(r)
                        }
                    }
                }
            } catch {
                print(error)
            }
        }
    }
    
    //#R00T
    func carregarItensLocal() {
        
        if let url = Bundle.main.url(forResource:"item-\(rootclass.lol.language)", withExtension: "json") {
            do {
                let data = try Data(contentsOf:url)
                let jitens = try JSON(data: data)
                
                if jitens != JSON.null {
                    if(!jitens.isEmpty){
                        
                        self.dicStaticItens = Dictionary<Int, staticitem>()
                        self.listStaticItem = Array<staticitem>()
                        
                        for i in 0 ..< jitens.count {
                            
                            let r = staticitem()
                            
                            if let id = jitens[i]["id"].int {
                                r.id = id
                            }
                            
                            if let name = jitens[i]["name"].string {
                                r.name = name
                            }
                            
                            if let description = jitens[i]["description"].string {
                                r.description = description
                            }
                            
                            if let imagefull = jitens[i]["imagefull"].string {
                                r.imagefull = imagefull
                            }
                            
                            if let imagelink = jitens[i]["imagelink"].string {
                                r.imagelink = imagelink
                            }
                            
                            if let goldbase = jitens[i]["gold"]["base"].int {
                                r.gold.base = goldbase
                            }
                            
                            if let goldtotal = jitens[i]["gold"]["total"].int {
                                r.gold.total = goldtotal
                            }
                            
                            if let goldsell = jitens[i]["gold"]["sell"].int {
                                r.gold.sell = goldsell
                            }
                            
                            if let goldpurchasable = jitens[i]["gold"]["purchasable"].bool {
                                r.gold.purchasable = goldpurchasable
                            }
                            
                            for a in 0 ..< jitens[i]["into"].count {
                                if let valor = jitens[i]["into"][a].string {
                                    r.into.append(valor)
                                }
                            }
                            
                            for a in 0 ..< jitens[i]["from"].count {
                                if let valor = jitens[i]["from"][a].string {
                                    r.from.append(valor)
                                }
                            }
                            
                            self.dicStaticItens[r.id] = r
                            self.listStaticItem.append(r)
                        }
                    }
                }
            } catch {
                print(error)
            }
        }
    }

    func listarStaticMasteryJson(jmastery:JSON) {
        
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
            
            self.dicStaticMastery[r.id] = r
        }
    }

    func listarVersion() {
        
        let url = "https://na1.api.riotgames.com/lol/static-data/v3/versions?api_key=\(lol.api_key)"
        
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
                                
                                NSLog("R00T - GET VERSION SUCESS")
                                semaphore.signal()
                            }
                        }
                    }
                }
                
            case .failure(let error):
                if let status = response.response?.statusCode {
                    
                    if status == 403 {
                        self.listaKeyLOL()
                    }
                }
                NSLog("R00T - GET VERSION ERROR")
                semaphore.signal()
            }
        }
        semaphore.wait(timeout: .distantFuture)
    }
    
    func carregarLanguage() {
        let defaults:UserDefaults = UserDefaults.standard
        
        if let language:String = defaults.string(forKey: "language" ) {
            rootclass.lol.language = language
        }
        
        if let language_description:String = defaults.string(forKey: "language_description" ) {
            rootclass.lol.language_description = language_description
        }
    }

    func carregarSpellsLocal() {
        
        if let url = Bundle.main.url(forResource:"spells-\(rootclass.lol.language)", withExtension: "json") {
            do {
                let data = try Data(contentsOf:url)
                let jspells = try JSON(data: data)
                
                if jspells != JSON.null {
                    if(!jspells.isEmpty){
                        
                        self.dicStaticSpell = Dictionary<Int, staticspell>()
                        
                        for i in 0 ..< jspells.count {
                            
                            let r = staticspell()
                            
                            if let id = jspells[i]["id"].int {
                                r.id = id
                            }
                            
                            if let name = jspells[i]["name"].string {
                                r.name = name
                            }
                            
                            if let key = jspells[i]["key"].string {
                                r.key = key
                            }
                            
                            if let imagelink = jspells[i]["imagelink"].string {
                                r.imagelink = imagelink
                            }
                            
                            self.dicStaticSpell[r.id] = r
                        }
                    }
                }
            } catch {
                print(error)
            }
        }
    }
    
    func carregarRunesLocal() {
        
        if let url = Bundle.main.url(forResource:"runes-\(rootclass.lol.language)", withExtension: "json") {
            do {
                let data = try Data(contentsOf:url)
                let jrunes = try JSON(data: data)
                
                if jrunes != JSON.null {
                    if(!jrunes.isEmpty){
                        
                        self.dicStaticRunesReforged = Dictionary<Int, staticrune>()
                        self.listStaticRunesReforged = Array<staticrune>()
                        
                        for i in 0 ..< jrunes.count {
                            
                            let r = staticrune()
                            
                            if let id = jrunes[i]["id"].int {
                                r.id = id
                            }
                            
                            if let key = jrunes[i]["key"].string {
                                r.key = key
                            }
                            
                            if let name = jrunes[i]["name"].string {
                                r.name = name
                            }
                            
                            if let shortDesc = jrunes[i]["shortDesc"].string {
                                r.shortDesc = shortDesc
                            }
                            
                            if let longDesc = jrunes[i]["longDesc"].string {
                                r.longDesc = longDesc
                            }
                            
                            if let runePathId = jrunes[i]["runePathId"].int {
                                r.runePathId = runePathId
                            }
                            
                            if let imagefull = jrunes[i]["imagefull"].string {
                                r.imagefull = imagefull
                            }
                            
                            if let imagelink = jrunes[i]["imagelink"].string {
                                r.imagelink = imagelink
                            }
                            
                            self.dicStaticRunesReforged[r.id] = r
                            self.listStaticRunesReforged.append(r)
                        }
                    }
                }
            } catch {
                print(error)
            }
        }
    }
    
    func listarStaticMastery(jmastery:JSON) {
        
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
            
            self.dicStaticMastery[r.id] = r
        }
    }
    
   
    func listaKeyLOL() {
        
        let url = "https://lol4you-32c31.firebaseio.com/key_riot.json"
        
//        let semaphore = DispatchSemaphore(value: 0)
//        let queue = DispatchQueue.global(qos: .background)
//        Alamofire.request(url).validate().responseJSON(queue: queue) { response in
        Alamofire.request(url).validate().responseJSON { response in
            
            switch response.result {
            case .success( _):
                
                if let key = response.result.value as? String {
                    lol.api_key = key
                }
                
//                semaphore.signal()
                
            case .failure(let error):
                NSLog("R00T - GET KEY LOL")
//                semaphore.signal()
            }
        }
//        semaphore.wait(timeout: .distantFuture)
    }
    
    func listarSummoner(summonername:String,error:@escaping (BEErro) -> ()) {
        
        let rtn = BEErro()
        
        var url = ""
        
        switch lol.server {
        case Region.REGION_RU.rawValue,
             Region.REGION_KR.rawValue:
            url = "https://\(lol.server).api.riotgames.com/lol/summoner/v3/summoners/by-name/\(summonername)?api_key=\(lol.api_key)"
        case Region.REGION_BR.rawValue,
             Region.REGION_OCE.rawValue,
             Region.REGION_JP.rawValue,
             Region.REGION_NA.rawValue,
             Region.REGION_EUNE.rawValue,
             Region.REGION_EUW.rawValue,
             Region.REGION_TR.rawValue,
             Region.REGION_LAN.rawValue:
            url = "https://\(lol.server)1.api.riotgames.com/lol/summoner/v3/summoners/by-name/\(summonername)?api_key=\(lol.api_key)"
        case Region.REGION_LAS.rawValue:
            url = "https://\(lol.server)2.api.riotgames.com/lol/summoner/v3/summoners/by-name/\(summonername)?api_key=\(lol.api_key)"
        default:
            NSLog("#R00T - ERROR SERVER")
        }
        
        url = url.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)!
        
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
                            rtn.msg = "Invalid Summoner"
                        }
                    }
                }
                
            case .failure(let error):
                
                if let status = response.response?.statusCode {
                    if status == 404 {
                        rtn.id = 400
                        rtn.msg = "Invalid Summoner"
                    }
                    
                    if status == 403 {
                        self.listaKeyLOL()
                    }
                }
                
                NSLog("#R00T - ERROR GET SUMMONER - ERROR: \(error)")
            }
            
            error(rtn)
        }
    }
    
    func listarStats(stats:@escaping (Array<BEStats>) -> ()) {
        
        var rtn = Array<BEStats>()
        
        var url = ""
        
        switch lol.server {
        case Region.REGION_RU.rawValue,
             Region.REGION_KR.rawValue:
            url = "https://\(lol.server).api.riotgames.com/api/lol/\(lol.server)/v1.3/stats/by-summoner/\(Summoner.summonerID)/ranked?season=SEASON2017&api_key=\(lol.api_key)"
        case Region.REGION_BR.rawValue,
             Region.REGION_OCE.rawValue,
             Region.REGION_JP.rawValue,
             Region.REGION_NA.rawValue,
             Region.REGION_EUNE.rawValue,
             Region.REGION_EUW.rawValue,
             Region.REGION_TR.rawValue,
             Region.REGION_LAN.rawValue:
            url = "https://\(lol.server)1.api.riotgames.com/api/lol/\(lol.server)/v1.3/stats/by-summoner/\(Summoner.summonerID)/ranked?season=SEASON2017&api_key=\(lol.api_key)"
        case Region.REGION_LAS.rawValue:
            url = "https://\(lol.server)2.api.riotgames.com/api/lol/\(lol.server)/v1.3/stats/by-summoner/\(Summoner.summonerID)/ranked?season=SEASON2017&api_key=\(lol.api_key)"
        default:
            NSLog("#R00T - ERROR SERVER")
        }
        
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
                if let status = response.response?.statusCode {
                    
                    if status == 403 {
                        self.listaKeyLOL()
                    }
                }
                NSLog("#R00T - ERROR GET STATS - ERROR: \(error)")
            }
            
            stats(rtn)
        }
    }
    
    func listarStatsProfile(stats:@escaping (Array<BEStats>) -> ()) {
        
        var rtn = Array<BEStats>()
        
        var url = ""
        
        switch lol.server {
        case Region.REGION_RU.rawValue,
             Region.REGION_KR.rawValue:
            url = "https://\(lol.server).api.riotgames.com/api/lol/\(lol.server)/v1.3/stats/by-summoner/\(Summoner.summonerID)/ranked?season=SEASON2017&api_key=\(lol.api_key)"
        case Region.REGION_BR.rawValue,
             Region.REGION_OCE.rawValue,
             Region.REGION_JP.rawValue,
             Region.REGION_NA.rawValue,
             Region.REGION_EUNE.rawValue,
             Region.REGION_EUW.rawValue,
             Region.REGION_TR.rawValue,
             Region.REGION_LAN.rawValue:
            url = "https://\(lol.server)1.api.riotgames.com/api/lol/\(lol.server)/v1.3/stats/by-summoner/\(Summoner.summonerID)/ranked?season=SEASON2017&api_key=\(lol.api_key)"
        case Region.REGION_LAS.rawValue:
            url = "https://\(lol.server)2.api.riotgames.com/api/lol/\(lol.server)/v1.3/stats/by-summoner/\(Summoner.summonerID)/ranked?season=SEASON2017&api_key=\(lol.api_key)"
        default:
            NSLog("#R00T - ERROR SERVER")
        }
        
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
                if let status = response.response?.statusCode {
                    
                    if status == 403 {
                        self.listaKeyLOL()
                    }
                }
                NSLog("#R00T - ERROR GET STATS PROFILE - ERROR: \(error)")
            }
            
            stats(rtn)
        }
    }
    
    func listarLeague( league:@escaping (Array<BELeague>) -> ()) {
        
        var rtn = Array<BELeague>()
        var url = ""
        
        switch lol.server {
        case Region.REGION_RU.rawValue,
             Region.REGION_KR.rawValue:
            url = "https://\(lol.server).api.riotgames.com/lol/league/v3/positions/by-summoner/\(Summoner.summonerID)?api_key=\(lol.api_key)"
        case Region.REGION_BR.rawValue,
             Region.REGION_OCE.rawValue,
             Region.REGION_JP.rawValue,
             Region.REGION_NA.rawValue,
             Region.REGION_EUNE.rawValue,
             Region.REGION_EUW.rawValue,
             Region.REGION_TR.rawValue,
             Region.REGION_LAN.rawValue:
            url = "https://\(lol.server)1.api.riotgames.com/lol/league/v3/positions/by-summoner/\(Summoner.summonerID)?api_key=\(lol.api_key)"
        case Region.REGION_LAS.rawValue:
            url = "https://\(lol.server)2.api.riotgames.com/lol/league/v3/positions/by-summoner/\(Summoner.summonerID)?api_key=\(lol.api_key)"
        default:
            NSLog("#R00T - ERROR SERVER")
        }
        
        Alamofire.request(url).validate().responseJSON { response in
            
            switch response.result {
            case .success( _):
                let jleague = JSON(response.result.value!)
                
                if jleague != JSON.null {
                    if(!jleague.isEmpty){
                        for i in 0 ..< jleague.count {
                            let r = BELeague()
                            
                            if let tier = jleague[i]["tier"].string {
                                r.tier = tier
                            }
                            
                            if let queue = jleague[i]["queueType"].string {
                                r.queue = queue
                            }
                            
                            if let name = jleague[i]["leagueName"].string {
                                r.name = name
                            }
                            
                            
                            if let division = jleague[i]["rank"].string {
                                r.division = division
                            }
                            
                            if let wins = jleague[i]["wins"].int {
                                r.wins = wins
                            }
                            
                            if let losses = jleague[i]["losses"].int {
                                r.losses = losses
                            }
                            
                            if let leaguePoints = jleague[i]["leaguePoints"].int {
                                r.leaguePoints = leaguePoints
                            }
                            
                            rtn.append(r)
                        }
                    }
                }
                
            case .failure(let error):
                if let status = response.response?.statusCode {
                    
                    if status == 403 {
                        self.listaKeyLOL()
                    }
                }
                NSLog("#R00T - ERROR GET LEAGUE - ERROR: \(error)")
            }
            
            league(rtn)
        }
    }
    
    func listarLeagueSync(summonerid:Int, league:@escaping (Array<BELeague>) -> ()) {
        
        var rtn = Array<BELeague>()
        var url = ""
        
        switch lol.server {
        case Region.REGION_RU.rawValue,
             Region.REGION_KR.rawValue:
            url = "https://\(lol.server).api.riotgames.com/lol/league/v3/positions/by-summoner/\(summonerid)?api_key=\(lol.api_key)"
        case Region.REGION_BR.rawValue,
             Region.REGION_OCE.rawValue,
             Region.REGION_JP.rawValue,
             Region.REGION_NA.rawValue,
             Region.REGION_EUNE.rawValue,
             Region.REGION_EUW.rawValue,
             Region.REGION_TR.rawValue,
             Region.REGION_LAN.rawValue:
            url = "https://\(lol.server)1.api.riotgames.com/lol/league/v3/positions/by-summoner/\(summonerid)?api_key=\(lol.api_key)"
        case Region.REGION_LAS.rawValue:
            url = "https://\(lol.server)2.api.riotgames.com/lol/league/v3/positions/by-summoner/\(summonerid)?api_key=\(lol.api_key)"
        default:
            NSLog("#R00T - ERROR SERVER")
        }

        Alamofire.request(url).validate().responseJSON { response in
            
            switch response.result {
            case .success( _):
                let jleague = JSON(response.result.value!)
                
                if jleague != JSON.null {
                    if(!jleague.isEmpty){
                        for i in 0 ..< jleague.count {
                            let r = BELeague()
                            
                            if let tier = jleague[i]["tier"].string {
                                r.tier = tier
                            }
                            
                            if let queue = jleague[i]["queueType"].string {
                                r.queue = queue
                            }
                            
                            if let name = jleague[i]["leagueName"].string {
                                r.name = name
                            }
                            
                            
                            if let division = jleague[i]["rank"].string {
                                r.division = division
                            }
                            
                            if let wins = jleague[i]["wins"].int {
                                r.wins = wins
                            }
                            
                            if let losses = jleague[i]["losses"].int {
                                r.losses = losses
                            }
                            
                            if let leaguePoints = jleague[i]["leaguePoints"].int {
                                r.leaguePoints = leaguePoints
                            }
                            
                            r.order = self.getLeague(league: "\(r.tier.lowercased())\(r.division)")
                                                       
                            rtn.append(r)
                        }
                    }
                }
                
            case .failure(let error):
                if let status = response.response?.statusCode {
                    
                    if status == 403 {
                        self.listaKeyLOL()
                    }
                }
                NSLog("#R00T - ERROR GET LEAGUE - ERROR: \(error)")
            }
            
            league(rtn.sorted(by: { $0.order > $1.order }))
        }
    }
    
    //#AQUI
    func listarMaestrySync(summonerid:Int,champion:Int, maestry:@escaping (staticchampmastery) -> ()) {
        
        var rtn = staticchampmastery()
        var url = ""

        switch lol.server {
        case Region.REGION_RU.rawValue,
             Region.REGION_KR.rawValue:
            url = "https://\(lol.server).api.riotgames.com/lol/champion-mastery/v3/champion-masteries/by-summoner/\(summonerid)/by-champion/\(champion)?api_key=\(lol.api_key)"
        case Region.REGION_BR.rawValue,
             Region.REGION_OCE.rawValue,
             Region.REGION_JP.rawValue,
             Region.REGION_NA.rawValue,
             Region.REGION_EUNE.rawValue,
             Region.REGION_EUW.rawValue,
             Region.REGION_TR.rawValue,
             Region.REGION_LAN.rawValue:
             url = "https://\(lol.server)1.api.riotgames.com/lol/champion-mastery/v3/champion-masteries/by-summoner/\(summonerid)/by-champion/\(champion)?api_key=\(lol.api_key)"
        case Region.REGION_LAS.rawValue:
             url = "https://\(lol.server)2.api.riotgames.com/lol/champion-mastery/v3/champion-masteries/by-summoner/\(summonerid)/by-champion/\(champion)?api_key=\(lol.api_key)"
        default:
            NSLog("#R00T - ERROR SERVER")
        }
        
        Alamofire.request(url).validate().responseJSON { response in
        
            switch response.result {
            case .success( _):
                let jmaestry = JSON(response.result.value!)
                
                if jmaestry != JSON.null {
                    if(!jmaestry.isEmpty){
                            if let championId = jmaestry["championId"].int {
                                rtn.championId = championId
                            }
                            
                            if let championLevel = jmaestry["championLevel"].int {
                                rtn.championLevel = championLevel
                            }
                            
                            if let championPoints = jmaestry["championPoints"].int {
                                rtn.championPoints = championPoints
                            }
                        }
                    }
                
            case .failure(let error):
                if let status = response.response?.statusCode {
                    
                    if status == 403 {
                        self.listaKeyLOL()
                    }
                }
                NSLog("#R00T - ERROR GET MAESTRY - ERROR: \(error)")
            }
            
            maestry(rtn)
        }
    }
    
    func listarMatchesSession(matchesid:@escaping (Array<Int>) -> ()) {
        
        var rtn = Array<Int>()
        self.listSessionMatches = Array<Int>()
        self.dicSessionMatches = Dictionary<Int, BEMatch>()
        self.listSessionMatchesSmall = Array<BEMatchSmall>()
        
        var url = ""
        
        switch lol.server {
        case Region.REGION_RU.rawValue,
             Region.REGION_KR.rawValue:
            url = "https://\(lol.server).api.riotgames.com/lol/match/v3/matchlists/by-account/\(Summoner.accountId)?api_key=\(lol.api_key)"
        case Region.REGION_BR.rawValue,
             Region.REGION_OCE.rawValue,
             Region.REGION_JP.rawValue,
             Region.REGION_NA.rawValue,
             Region.REGION_EUNE.rawValue,
             Region.REGION_EUW.rawValue,
             Region.REGION_TR.rawValue,
             Region.REGION_LAN.rawValue:
            url = "https://\(lol.server)1.api.riotgames.com/lol/match/v3/matchlists/by-account/\(Summoner.accountId)?api_key=\(lol.api_key)"
        case Region.REGION_LAS.rawValue:
            url = "https://\(lol.server)2.api.riotgames.com/lol/match/v3/matchlists/by-account/\(Summoner.accountId)?api_key=\(lol.api_key)"
        default:
            NSLog("#R00T - ERROR SERVER")
        }
        
        Alamofire.request(url).validate().responseJSON { response in
            
            switch response.result {
            case .success( _):
                let jmatch = JSON(response.result.value!)
                
                if jmatch != JSON.null {
                    if(!jmatch.isEmpty){
                        var partidas = 0
                        for i in 0 ..< jmatch["matches"].count {
                            var r = Int()
                            
                            if let matchId = jmatch["matches"][i]["gameId"].int {
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
                if let status = response.response?.statusCode {
                    
                    //MOCK
                    rtn.append(1566075412)
                    rtn.append(1566044397)
                    rtn.append(1563538700)
                    rtn.append(1563474563)
                    rtn.append(1562886976)
                    
                    if status == 403 {
                        self.listaKeyLOL()
                    }
                }
                NSLog("#R00T - ERROR GET MATCHES - ERROR: \(error)")
            }
            
            self.listSessionMatches = rtn
            matchesid(rtn)
        }
    }
    
    //#AQUI
    func listarMatchUni(matchid:Int) {
        
        let match = rootclass.BEMatch()
        
        var url = ""
        
        switch lol.server {
        case Region.REGION_RU.rawValue,
             Region.REGION_KR.rawValue:
            url = "https://\(lol.server).api.riotgames.com/lol/match/v3/matches/\(matchid)?api_key=\(lol.api_key)"
        case Region.REGION_BR.rawValue,
             Region.REGION_OCE.rawValue,
             Region.REGION_JP.rawValue,
             Region.REGION_NA.rawValue,
             Region.REGION_EUNE.rawValue,
             Region.REGION_EUW.rawValue,
             Region.REGION_TR.rawValue,
             Region.REGION_LAN.rawValue:
            url = "https://\(lol.server)1.api.riotgames.com/lol/match/v3/matches/\(matchid)?api_key=\(lol.api_key)"
        case Region.REGION_LAS.rawValue:
            url = "https://\(lol.server)2.api.riotgames.com/lol/match/v3/matches/\(matchid)?api_key=\(lol.api_key)"
        default:
            NSLog("#R00T - ERROR SERVER")
        }
        
        let queue = DispatchQueue.global(qos: .background)
        Alamofire.request(url).validate().responseJSON(queue: queue) { response in
            
            switch response.result {
            case .success( _):
                let jmatchdet = JSON(response.result.value!)
                
                if jmatchdet != JSON.null {
                    if(!jmatchdet.isEmpty){
                        
                        if let gameId = jmatchdet["gameId"].int {
                            match.gameId = gameId
                        }
                        
                        if let gameCreation = jmatchdet["gameCreation"].double {
                            match.gameCreation = gameCreation
                        }
                        
                        if let gameDuration = jmatchdet["gameDuration"].int {
                            match.gameDuration = gameDuration
                        }
                        
                        if let queueId = jmatchdet["queueId"].int {
                            let queueIdS = self.listaQueue(id: queueId)
                            match.queueType = queueIdS
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
                            if let win = jmatchdet["participants"][a]["stats"]["win"].bool {
                                participant.stats.win = win
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
                            
                            if let totalMinionsKilled = jmatchdet["participants"][a]["stats"]["totalMinionsKilled"].int {
                                participant.stats.totalMinionsKilled = totalMinionsKilled
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
                            
                            if let turretKills = jmatchdet["participants"][a]["stats"]["turretKills"].int {
                                participant.stats.turretKills = turretKills
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
                            
                            if let perk0 = jmatchdet["participants"][a]["stats"]["perk0"].int {
                                participant.runes.append(perk0)
                            }
                            
                            if let perk1 = jmatchdet["participants"][a]["stats"]["perk1"].int {
                                participant.runes.append(perk1)
                            }
                            
                            if let perk2 = jmatchdet["participants"][a]["stats"]["perk2"].int {
                                participant.runes.append(perk2)
                            }
                            
                            if let perk3 = jmatchdet["participants"][a]["stats"]["perk3"].int {
                                participant.runes.append(perk3)
                            }
                            
                            if let perk4 = jmatchdet["participants"][a]["stats"]["perk4"].int {
                                participant.runes.append(perk4)
                            }
                            
                            if let perk5 = jmatchdet["participants"][a]["stats"]["perk5"].int {
                                participant.runes.append(perk5)
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
                            
                            if let win = jmatchdet["teams"][e]["win"].string {
                                team.win = win
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
                        NSLog("#R00T - TESTANDOOOOOOOOOOOOOOOOOOOOOOOOOO - 2: \(NSDate())")
                        self.dicSessionMatches[matchid] = match
//                        self.listarMatchesTeste(match: match)
                    }
                }
            case .failure(let error):
                if let status = response.response?.statusCode {
                    
                    if status == 403 {
                        self.listaKeyLOL()
                    }
                }
                NSLog("#R00T - ERROR GET MATCHE DET - ERROR: \(error)")
            }
        }
    }
    
    func listarMatches(match:@escaping (Array<BEMatchSmall>) -> ()) {
        
        var rtn = Array<BEMatchSmall>()
        
        for i in 0 ..< self.listSessionMatches.count {
            
            let r = BEMatchSmall()
            
            if let match = self.dicSessionMatches[self.listSessionMatches[i]] {
                
                let participantId = match.participantsIdentities.filter { p in p.summonerId == Summoner.summonerID }
                
                if participantId.count > 0 {
                    
                    let participants = match.participants.filter { p in p.participantId == participantId[0].participantId }
                    
                    r.createDate = match.gameCreation
                    r.gameId = match.gameId
                    r.queue = match.queueType
                    r.championId = participants[0].championId
                    r.spell1 = participants[0].spell1Id
                    r.spell2 = participants[0].spell2Id
                    
                    r.stats.item0 = participants[0].stats.item0
                    r.stats.item0imagelink = participants[0].stats.item0imagelink
                    
                    r.stats.item1 = participants[0].stats.item1
                    r.stats.item1imagelink = participants[0].stats.item1imagelink
                    
                    r.stats.item2 = participants[0].stats.item2
                    r.stats.item2imagelink = participants[0].stats.item2imagelink
                    
                    r.stats.item3 = participants[0].stats.item3
                    r.stats.item3imagelink = participants[0].stats.item3imagelink
                    
                    r.stats.item4 = participants[0].stats.item4
                    r.stats.item4imagelink = participants[0].stats.item4imagelink
                    
                    r.stats.item5 = participants[0].stats.item5
                    r.stats.item5imagelink = participants[0].stats.item5imagelink
                    
                    r.stats.item6 = participants[0].stats.item6
                    r.stats.item6imagelink = participants[0].stats.item6imagelink
                    
                    r.stats.goldEarned = participants[0].stats.goldEarned
                    r.stats.championsKilled = participants[0].stats.kills
                    r.stats.numDeaths = participants[0].stats.deaths
                    r.stats.assists = participants[0].stats.assists
                    r.stats.timePlayed = match.gameDuration
                    r.stats.win = participants[0].stats.win
                    r.stats.level = participants[0].stats.champLevel
                    r.stats.minionsKilled = participants[0].stats.totalMinionsKilled + participants[0].stats.neutralMinionsKilled
                    
                } else {
                    let participants = match.participants.filter { p in p.participantId == 1 }
                    
                    r.createDate = match.gameCreation
                    r.gameId = match.gameId
                    r.queue = match.queueType
                    r.championId = participants[0].championId
                    r.spell1 = participants[0].spell1Id
                    r.spell2 = participants[0].spell2Id
                    
                    r.stats.item0 = participants[0].stats.item0
                    r.stats.item0imagelink = participants[0].stats.item0imagelink
                    
                    r.stats.item1 = participants[0].stats.item1
                    r.stats.item1imagelink = participants[0].stats.item1imagelink
                    
                    r.stats.item2 = participants[0].stats.item2
                    r.stats.item2imagelink = participants[0].stats.item2imagelink
                    
                    r.stats.item3 = participants[0].stats.item3
                    r.stats.item3imagelink = participants[0].stats.item3imagelink
                    
                    r.stats.item4 = participants[0].stats.item4
                    r.stats.item4imagelink = participants[0].stats.item4imagelink
                    
                    r.stats.item5 = participants[0].stats.item5
                    r.stats.item5imagelink = participants[0].stats.item5imagelink
                    
                    r.stats.item6 = participants[0].stats.item6
                    r.stats.item6imagelink = participants[0].stats.item6imagelink
                    
                    r.stats.goldEarned = participants[0].stats.goldEarned
                    r.stats.championsKilled = participants[0].stats.kills
                    r.stats.numDeaths = participants[0].stats.deaths
                    r.stats.assists = participants[0].stats.assists
                    r.stats.timePlayed = match.gameDuration
                    r.stats.win = participants[0].stats.win
                    r.stats.level = participants[0].stats.champLevel
                    r.stats.minionsKilled = participants[0].stats.totalMinionsKilled + participants[0].stats.neutralMinionsKilled
                }
                
                rtn.append(r)
            }
        }
        match(rtn)
    }
    
    //#AQUI
    func listarMatchesTeste(match:BEMatch) {
        
            let r = BEMatchSmall()
        
                let participantId = match.participantsIdentities.filter { p in p.summonerId == Summoner.summonerID }
                
                if participantId.count > 0 {
                    
                    let participants = match.participants.filter { p in p.participantId == participantId[0].participantId }
                    
                    r.createDate = match.gameCreation
                    r.gameId = match.gameId
                    r.queue = match.queueType
                    r.championId = participants[0].championId
                    r.spell1 = participants[0].spell1Id
                    r.spell2 = participants[0].spell2Id
                    
                    r.stats.item0 = participants[0].stats.item0
                    r.stats.item0imagelink = participants[0].stats.item0imagelink
                    
                    r.stats.item1 = participants[0].stats.item1
                    r.stats.item1imagelink = participants[0].stats.item1imagelink
                    
                    r.stats.item2 = participants[0].stats.item2
                    r.stats.item2imagelink = participants[0].stats.item2imagelink
                    
                    r.stats.item3 = participants[0].stats.item3
                    r.stats.item3imagelink = participants[0].stats.item3imagelink
                    
                    r.stats.item4 = participants[0].stats.item4
                    r.stats.item4imagelink = participants[0].stats.item4imagelink
                    
                    r.stats.item5 = participants[0].stats.item5
                    r.stats.item5imagelink = participants[0].stats.item5imagelink
                    
                    r.stats.item6 = participants[0].stats.item6
                    r.stats.item6imagelink = participants[0].stats.item6imagelink
                    
                    r.stats.goldEarned = participants[0].stats.goldEarned
                    r.stats.championsKilled = participants[0].stats.kills
                    r.stats.numDeaths = participants[0].stats.deaths
                    r.stats.assists = participants[0].stats.assists
                    r.stats.timePlayed = match.gameDuration
                    r.stats.win = participants[0].stats.win
                    r.stats.level = participants[0].stats.champLevel
                    r.stats.minionsKilled = participants[0].stats.totalMinionsKilled + participants[0].stats.neutralMinionsKilled
                    
                } else {
                    let participants = match.participants.filter { p in p.participantId == 1 }
                    
                    r.createDate = match.gameCreation
                    r.gameId = match.gameId
                    r.queue = match.queueType
                    r.championId = participants[0].championId
                    r.spell1 = participants[0].spell1Id
                    r.spell2 = participants[0].spell2Id
                    
                    r.stats.item0 = participants[0].stats.item0
                    r.stats.item0imagelink = participants[0].stats.item0imagelink
                    
                    r.stats.item1 = participants[0].stats.item1
                    r.stats.item1imagelink = participants[0].stats.item1imagelink
                    
                    r.stats.item2 = participants[0].stats.item2
                    r.stats.item2imagelink = participants[0].stats.item2imagelink
                    
                    r.stats.item3 = participants[0].stats.item3
                    r.stats.item3imagelink = participants[0].stats.item3imagelink
                    
                    r.stats.item4 = participants[0].stats.item4
                    r.stats.item4imagelink = participants[0].stats.item4imagelink
                    
                    r.stats.item5 = participants[0].stats.item5
                    r.stats.item5imagelink = participants[0].stats.item5imagelink
                    
                    r.stats.item6 = participants[0].stats.item6
                    r.stats.item6imagelink = participants[0].stats.item6imagelink
                    
                    r.stats.goldEarned = participants[0].stats.goldEarned
                    r.stats.championsKilled = participants[0].stats.kills
                    r.stats.numDeaths = participants[0].stats.deaths
                    r.stats.assists = participants[0].stats.assists
                    r.stats.timePlayed = match.gameDuration
                    r.stats.win = participants[0].stats.win
                    r.stats.level = participants[0].stats.champLevel
                    r.stats.minionsKilled = participants[0].stats.totalMinionsKilled + participants[0].stats.neutralMinionsKilled
                }
        
        self.listSessionMatchesSmall.append(r)
        
//        if self.delegateUpdateMatches != nil {
//            self.delegateUpdateMatches.updateMatches()
//        }
    }
    
    func listarRunes(runes:@escaping (Array<BERunes>) -> ()) {
        
        var rtn = Array<BERunes>()
        
        var url = ""
        
        switch lol.server {
        case Region.REGION_RU.rawValue,
             Region.REGION_KR.rawValue:
            url = "https://\(lol.server).api.riotgames.com/lol/platform/v3/runes/by-summoner/\(Summoner.summonerID)?api_key=\(lol.api_key)"
        case Region.REGION_BR.rawValue,
             Region.REGION_OCE.rawValue,
             Region.REGION_JP.rawValue,
             Region.REGION_NA.rawValue,
             Region.REGION_EUNE.rawValue,
             Region.REGION_EUW.rawValue,
             Region.REGION_TR.rawValue,
             Region.REGION_LAN.rawValue:
            url = "https://\(lol.server)1.api.riotgames.com/lol/platform/v3/runes/by-summoner/\(Summoner.summonerID)?api_key=\(lol.api_key)"
        case Region.REGION_LAS.rawValue:
            url = "https://\(lol.server)2.api.riotgames.com/lol/platform/v3/runes/by-summoner/\(Summoner.summonerID)?api_key=\(lol.api_key)"
        default:
            NSLog("#R00T - ERROR SERVER")
        }
        
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
                if let status = response.response?.statusCode {
                    
                    if status == 403 {
                        self.listaKeyLOL()
                    }
                }
                NSLog("#R00T - ERROR GET RUNES - ERROR: \(error)")
                runes(rtn)
            }
        }
    }
    
    func listarMasterys(masterys:@escaping (Array<BEMasterys>) -> ()) {
        
        var rtn = Array<BEMasterys>()
        
        var url = ""
        
        switch lol.server {
        case Region.REGION_RU.rawValue,
             Region.REGION_KR.rawValue:
            url = "https://\(lol.server).api.riotgames.com/lol/platform/v3/masteries/by-summoner/\(Summoner.summonerID)?api_key=\(lol.api_key)"
        case Region.REGION_BR.rawValue,
             Region.REGION_OCE.rawValue,
             Region.REGION_JP.rawValue,
             Region.REGION_NA.rawValue,
             Region.REGION_EUNE.rawValue,
             Region.REGION_EUW.rawValue,
             Region.REGION_TR.rawValue,
             Region.REGION_LAN.rawValue:
            url = "https://\(lol.server)1.api.riotgames.com/lol/platform/v3/masteries/by-summoner/\(Summoner.summonerID)?api_key=\(lol.api_key)"
        case Region.REGION_LAS.rawValue:
            url = "https://\(lol.server)2.api.riotgames.com/lol/platform/v3/masteries/by-summoner/\(Summoner.summonerID)?api_key=\(lol.api_key)"
        default:
            NSLog("#R00T - ERROR SERVER")
        }
        
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
                if let status = response.response?.statusCode {
                    
                    if status == 403 {
                        self.listaKeyLOL()
                    }
                }
                NSLog("#R00T - ERROR GET MASTERYS DET - ERROR: \(error)")
                masterys(rtn)
            }
        }
    }
    
    func listarSpec(spec:@escaping (BESpec) -> ()) {
        
        var rtn = BESpec()
        
        var url = ""
        
        switch lol.server {
        case Region.REGION_RU.rawValue,
             Region.REGION_KR.rawValue:
            url = "https://\(lol.server).api.riotgames.com/lol/spectator/v3/active-games/by-summoner/\(Summoner.summonerID)?api_key=\(lol.api_key)"
        case Region.REGION_BR.rawValue,
             Region.REGION_OCE.rawValue,
             Region.REGION_JP.rawValue,
             Region.REGION_NA.rawValue,
             Region.REGION_EUNE.rawValue,
             Region.REGION_EUW.rawValue,
             Region.REGION_TR.rawValue,
             Region.REGION_LAN.rawValue:
            url = "https://\(lol.server)1.api.riotgames.com/lol/spectator/v3/active-games/by-summoner/\(Summoner.summonerID)?api_key=\(lol.api_key)"
        case Region.REGION_LAS.rawValue:
            url = "https://\(lol.server)2.api.riotgames.com/lol/spectator/v3/active-games/by-summoner/\(Summoner.summonerID)?api_key=\(lol.api_key)"
        default:
                NSLog("#R00T - ERROR SERVER")
        }
        
        Alamofire.request(url).validate().responseJSON { response in
            
            switch response.result {
            case .success( _):
                let jspec = JSON(response.result.value!)
                
                if jspec != JSON.null {
                    if(!jspec.isEmpty){
                        for a in 0 ..< jspec["participants"].count {
                            let participant = BEParticipants()
                            
                            if let summonerName = jspec["participants"][a]["summonerName"].string {
                                participant.summonerName = summonerName
                            }
                            
                            if let teamId = jspec["participants"][a]["teamId"].int {
                                participant.teamId = teamId
                            }
                            
                            if let spell1Id = jspec["participants"][a]["spell1Id"].int {
                                participant.spell1Id = spell1Id
                            }
                            
                            if let spell2Id = jspec["participants"][a]["spell2Id"].int {
                                participant.spell2Id = spell2Id
                            }
                            
                            if let summonerId = jspec["participants"][a]["summonerId"].int {
                                participant.summonerId = summonerId
                                
                                self.listarLeagueSync(summonerid: summonerId) {(league) in
                                    participant.leagues = league
                                }
                            }
                            
                            if let championId = jspec["participants"][a]["championId"].int {
                                participant.championId = championId
                                
                                self.listarMaestrySync(summonerid: participant.summonerId, champion: participant.championId) {(maestry) in
                                    participant.maestry = maestry
                                    self.delegateUpdateImagesSpec.updateImagesSpec()
                                }
                            }
                            
                            
                            for b in 0 ..< jspec["participants"][a]["perks"]["perkIds"].count {
                                
                                if let perk = jspec["participants"][a]["perks"]["perkIds"][b].int {
                                    participant.runes.append(perk)
                                }
                            }
                            
                            rtn.participants.append(participant)
                            
                            for b in 0 ..< jspec["bannedChampions"].count {
                                let ban = BEBan()
                                
                                if let championId = jspec["bannedChampions"][b]["championId"].int {
                                    ban.championId = championId
                                }
                                
                                if let pickTurn = jspec["bannedChampions"][b]["pickTurn"].int {
                                    ban.pickTurn = pickTurn
                                }
                                
                                if let teamId = jspec["bannedChampions"][b]["teamId"].int {
                                    ban.teamId = teamId
                                }
                                
                                rtn.bans.append(ban)
                            }
                            
                        }
                        spec(rtn)
                    }
                }
                
            case .failure(let error):
                if let status = response.response?.statusCode {
                    
                    if status == 403 {
                        self.listaKeyLOL()
                    }
                }
                NSLog("#R00T - ERROR GET SPEC DET - ERROR: \(error)")
                spec(rtn)
            }
        }
        
    }
    
    func listarStaticQueue() {
        self.dicSessionMatchesQueue = Dictionary<Int, String>()
        
        self.dicSessionMatchesQueue[0] = "Custom"
        self.dicSessionMatchesQueue[8] = "Normal 3v3"
        self.dicSessionMatchesQueue[2] = "Normal 5v5"
        self.dicSessionMatchesQueue[14] = "Normal 5v5"
        self.dicSessionMatchesQueue[4] = "Ranked Solo 5v5"
        self.dicSessionMatchesQueue[6] = "Ranked Premade 5v5"
        self.dicSessionMatchesQueue[41] = "Ranked Team 3v3"
        self.dicSessionMatchesQueue[42] = "Ranked Team 5v5"
        self.dicSessionMatchesQueue[16] = "Dominion 5v5"
        self.dicSessionMatchesQueue[17] = "Dominion 5v5"
        self.dicSessionMatchesQueue[61] = "Team Builder"
        self.dicSessionMatchesQueue[65] = "ARAM "
        self.dicSessionMatchesQueue[70] = "One for All"
        self.dicSessionMatchesQueue[72] = "Snowdown 1v1"
        self.dicSessionMatchesQueue[73] = "Snowdown 2v2"
        self.dicSessionMatchesQueue[75] = "Hexakill"
        self.dicSessionMatchesQueue[98] = "Twisted Treeline Hexakill"
        self.dicSessionMatchesQueue[100] = "Butcher's Bridge"
        self.dicSessionMatchesQueue[300] = "King Poro"
        self.dicSessionMatchesQueue[310] = "Nemesis"
        self.dicSessionMatchesQueue[313] = "Black Market Brawlers"
        self.dicSessionMatchesQueue[315] = "Nexus Siege"
        self.dicSessionMatchesQueue[317] = "Definitely Not Dominion"
        self.dicSessionMatchesQueue[318] = "All Random URF"
        self.dicSessionMatchesQueue[325] = "All Random Summoner's Rift"
        self.dicSessionMatchesQueue[400] = "Normal 5v5"
        self.dicSessionMatchesQueue[410] = "Ranked 5v5"
        self.dicSessionMatchesQueue[420] = "Ranked 5v5 Solo"
        self.dicSessionMatchesQueue[430] = "Normal 5v5"
        self.dicSessionMatchesQueue[440] = "Ranked 5v5 Flex"
        self.dicSessionMatchesQueue[450] = "ARAM"
        self.dicSessionMatchesQueue[460] = "Normal 3v3"
        self.dicSessionMatchesQueue[470] = "Ranked 3v3 Flex"
        self.dicSessionMatchesQueue[600] = "Blood Hunt Assassin"
        self.dicSessionMatchesQueue[610] = "Dark Star"
        self.dicSessionMatchesQueue[800] = "Twisted Treeline Co-op vs. AI Intermediate Bot"
        self.dicSessionMatchesQueue[810] = "Twisted Treeline Co-op vs. AI Intro Bot"
        self.dicSessionMatchesQueue[820] = "Twisted Treeline Co-op vs. AI Beginner Bot"
        self.dicSessionMatchesQueue[830] = "Summoner's Rift Co-op vs. AI Intro Bot"
        self.dicSessionMatchesQueue[840] = "Summoner's Rift Co-op vs. AI Beginner Bot"
        self.dicSessionMatchesQueue[850] = "Summoner's Rift Co-op vs. AI Intermediate Bot"
        self.dicSessionMatchesQueue[980] = "Star Guardian Invasion: Normal"
        self.dicSessionMatchesQueue[990] = "Star Guardian Invasion: Onslaught"
    }
    
    func listarStaticMaestryOrder() {
        self.dicStaticMasteryOrder = Dictionary<String, Int>()
        
        self.dicStaticMasteryOrder["bronzeV"] = 0
        self.dicStaticMasteryOrder["bronzeIV"] = 1
        self.dicStaticMasteryOrder["bronzeIII"] = 2
        self.dicStaticMasteryOrder["bronzeII"] = 3
        self.dicStaticMasteryOrder["bronzeI"] = 4
        
        self.dicStaticMasteryOrder["silverV"] = 5
        self.dicStaticMasteryOrder["silverIV"] = 6
        self.dicStaticMasteryOrder["silverIII"] = 7
        self.dicStaticMasteryOrder["silverII"] = 8
        self.dicStaticMasteryOrder["silverI"] = 9
        
        self.dicStaticMasteryOrder["goldV"] = 10
        self.dicStaticMasteryOrder["goldIV"] = 11
        self.dicStaticMasteryOrder["goldIII"] = 12
        self.dicStaticMasteryOrder["goldII"] = 13
        self.dicStaticMasteryOrder["goldI"] = 14
        
        self.dicStaticMasteryOrder["platinumV"] = 15
        self.dicStaticMasteryOrder["platinumIV"] = 16
        self.dicStaticMasteryOrder["platinumIII"] = 17
        self.dicStaticMasteryOrder["platinumII"] = 18
        self.dicStaticMasteryOrder["platinumI"] = 19
    
        self.dicStaticMasteryOrder["diamondV"] = 20
        self.dicStaticMasteryOrder["diamondIV"] = 21
        self.dicStaticMasteryOrder["diamondIII"] = 22
        self.dicStaticMasteryOrder["diamondII"] = 23
        self.dicStaticMasteryOrder["diamondI"] = 24
        
        self.dicStaticMasteryOrder["masterI"] = 25
        
        self.dicStaticMasteryOrder["challengerI"] = 26
    }
    
    //#R00TAQUI
    func listarStaticLanguage() -> Array<BELanguage> {
        
        var rtn = Array<BELanguage>()
        
        rtn.append(BELanguage(language:"cs_CZ", description:"Czech (Czech Republic)"))
        rtn.append(BELanguage(language:"it_IT", description:"Italian (Italy)"))
        rtn.append(BELanguage(language:"de_DE", description:"German (Germany)"))
        rtn.append(BELanguage(language:"ja_JP", description:"Japanese (Japan)"))
        rtn.append(BELanguage(language:"el_GR", description:"Greek (Greece)"))
        rtn.append(BELanguage(language:"ko_KR", description:"Korean (Korea)"))
        rtn.append(BELanguage(language:"en_AU", description:"English (Australia)"))
        rtn.append(BELanguage(language:"ms_MY", description:"Malay (Malaysia)"))
        rtn.append(BELanguage(language:"en_GB", description:"English (United Kingdom)"))
        rtn.append(BELanguage(language:"pl_PL", description:"Polish (Poland)"))
        rtn.append(BELanguage(language:"en_PH", description:"English (Republic of the Philippines)"))
        rtn.append(BELanguage(language:"pt_BR", description:"Portuguese (Brazil)"))
        rtn.append(BELanguage(language:"en_PL", description:"English (Poland)"))
        rtn.append(BELanguage(language:"ro_RO", description:"Romanian (Romania)"))
        rtn.append(BELanguage(language:"en_SG", description:"English (Singapore)"))
        rtn.append(BELanguage(language:"ru_RU", description:"Russian (Russia)"))
        rtn.append(BELanguage(language:"en_US", description:"English (United States)"))
        rtn.append(BELanguage(language:"th_TH", description:"Thai (Thailand)"))
        rtn.append(BELanguage(language:"es_AR", description:"Spanish (Argentina)"))
        rtn.append(BELanguage(language:"tr_TR", description:"Turkish (Turkey)"))
        rtn.append(BELanguage(language:"es_ES", description:"Spanish (Spain)"))
        rtn.append(BELanguage(language:"vn_VN", description:"Vietnamese (Viet Nam)"))
        rtn.append(BELanguage(language:"es_MX", description:"Spanish (Mexico)"))
        rtn.append(BELanguage(language:"zh_CN", description:"Chinese (China)"))
        rtn.append(BELanguage(language:"fr_FR", description:"French (France)"))
        rtn.append(BELanguage(language:"zh_MY", description:"Chinese (Malaysia)"))
        rtn.append(BELanguage(language:"hu_HU", description:"Hungarian (Hungary)"))
        rtn.append(BELanguage(language:"zh_TW", description:"Chinese (Taiwan)"))
        rtn.append(BELanguage(language:"id_ID", description:"Indonesian (Indonesia)"))

        return rtn
    }
    
    func listaChampMastery(id:Int) -> staticchampmastery {
        var rtn = staticchampmastery()
        
        if let champmastery = self.dicStaticChampMastery[id] {
            rtn = champmastery
        }
        
        return rtn
    }
    
    func listaItem(id:Int) -> staticitem {
        var rtn = staticitem()
        
        if let item = self.dicStaticItens[id] {
            rtn = item
        }
        
        return rtn
    }
    
    func listaChamp(id:Int) -> staticchampions {
        var rtn = staticchampions()
        
        if let champmastery = self.dicStaticChampions[id] {
            rtn = champmastery
        }
        
        return rtn
    }
    
    func listaRuneReforged(id:Int) -> staticrune {
        var rtn = staticrune()
        
        if let runes = self.dicStaticRunesReforged[id] {
            rtn = runes
        }
        
        return rtn
    }
    
    func listaRune(id:Int) -> staticrunes {
        var rtn = staticrunes()
        
        if let runes = self.dicStaticRunes[id] {
            rtn = runes
        }
        
        return rtn
    }
    
    func listaMastery(id:Int) -> staticmastery {
        var rtn = staticmastery()
        
        if let mastery = self.dicStaticMastery[id] {
            rtn = mastery
        }
        
        return rtn
    }
    
    func listaSpeel(id:Int) -> staticspell {
        var rtn = staticspell()
        
        if let spell = self.dicStaticSpell[id] {
            rtn = spell
        }
        
        return rtn
    }
    
    func listaMatch(id:Int) -> BEMatch {
        var rtn = BEMatch()
        
        if let match = self.dicSessionMatches[id] {
            rtn = match
        }
        
        return rtn
    }
    
    func listaQueue(id:Int) -> String {
        var rtn = "Undefined"
        
        if let queue = self.dicSessionMatchesQueue[id] {
            rtn = queue
        }
        
        return rtn
    }
    
    func getLeague(league:String) -> Int {
        var rtn = 0
        
        if let queue = self.dicStaticMasteryOrder[league] {
            rtn = queue
        }
        
        return rtn
    }
    
}
