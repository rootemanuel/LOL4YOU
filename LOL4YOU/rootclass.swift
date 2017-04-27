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

class rootclass: NSObject {

    private override init() {}
    
    enum images : String  {
        case item = "http://ddragon.leagueoflegends.com/cdn/7.8.1/img/item/"
        case champion = "http://ddragon.leagueoflegends.com/cdn/7.8.1/img/champion/"
        case profileicon = "http://ddragon.leagueoflegends.com/cdn/7.8.1/img/profileicon/"
        case rune = "http://ddragon.leagueoflegends.com/cdn/7.8.1/img/rune/"
        case png = ".png"
    }
    
    struct champions {
        var id:Int
        var key:String
        var name:String
    }
    
    let championsa = [
        champions.init(id: 62,key: "MonkeyKing",name : "Wukong"),
        champions.init(id: 24,key: "Jax",name : "Jax"),
        champions.init(id: 35,key: "Shaco",name : "Shaco"),
        champions.init(id: 19,key: "Warwick",name : "Warwick"),
        champions.init(id: 76,key: "Nidalee",name : "Nidalee"),
        champions.init(id: 143,key: "Zyra",name : "Zyra"),
        champions.init(id: 240,key: "Kled",name : "Kled"),
        champions.init(id: 63,key: "Brand",name : "Brand"),
        champions.init(id: 33,key: "Rammus",name : "Rammus"),
        champions.init(id: 420,key: "Illaoi",name : "Illaoi"),
        champions.init(id: 42,key: "Corki",name : "Corki"),
        champions.init(id: 201,key: "Braum",name : "Braum"),
        champions.init(id: 122,key: "Darius",name : "Darius"),
        champions.init(id: 23,key: "Tryndamere",name : "Tryndamere"),
        champions.init(id: 21,key: "MissFortune",name : "Miss Fortune"),
        champions.init(id: 83,key: "Yorick",name : "Yorick"),
        champions.init(id: 101,key: "Xerath",name : "Xerath"),
        champions.init(id: 15,key: "Sivir",name : "Sivir"),
        champions.init(id: 92,key: "Riven",name : "Riven"),
        champions.init(id: 61,key: "Orianna",name : "Orianna"),
        champions.init(id: 41,key: "Gangplank",name : "Gangplank"),
        champions.init(id: 54,key: "Malphite",name : "Malphite"),
        champions.init(id: 78,key: "Poppy",name : "Poppy"),
        champions.init(id: 30,key: "Karthus",name : "Karthus"),
        champions.init(id: 126,key: "Jayce",name : "Jayce"),
        champions.init(id: 20,key: "Nunu",name : "Nunu"),
        champions.init(id: 48,key: "Trundle",name : "Trundle"),
        champions.init(id: 104,key: "Graves",name : "Graves"),
        champions.init(id: 25,key: "Morgana",name : "Morgana"),
        champions.init(id: 150,key: "Gnar",name : "Gnar"),
        champions.init(id: 99,key: "Lux",name : "Lux"),
        champions.init(id: 102,key: "Shyvana",name : "Shyvana"),
        champions.init(id: 58,key: "Renekton",name : "Renekton"),
        champions.init(id: 114,key: "Fiora",name : "Fiora"),
        champions.init(id: 222,key: "Jinx",name : "Jinx"),
        champions.init(id: 429,key: "Kalista",name : "Kalista"),
        champions.init(id: 105,key: "Fizz",name : "Fizz"),
        champions.init(id: 38,key: "Kassadin",name : "Kassadin"),
        champions.init(id: 37,key: "Sona",name : "Sona"),
        champions.init(id: 39,key: "Irelia",name : "Irelia"),
        champions.init(id: 112,key: "Viktor",name : "Viktor"),
        champions.init(id: 203,key: "Kindred",name : "Kindred"),
        champions.init(id: 69,key: "Cassiopeia",name : "Cassiopeia"),
        champions.init(id: 57,key: "Maokai",name : "Maokai"),
        champions.init(id: 412,key: "Thresh",name : "Thresh"),
        champions.init(id: 10,key: "Kayle",name : "Kayle"),
        champions.init(id: 120,key: "Hecarim",name : "Hecarim"),
        champions.init(id: 121,key: "Khazix",name : "Kha'Zix"),
        champions.init(id: 2,key: "Olaf",name : "Olaf"),
        champions.init(id: 115,key: "Ziggs",name : "Ziggs"),
        champions.init(id: 134,key: "Syndra",name : "Syndra"),
        champions.init(id: 36,key: "DrMundo",name : "Dr. Mundo"),
        champions.init(id: 43,key: "Karma",name : "Karma"),
        champions.init(id: 1,key: "Annie",name : "Annie"),
        champions.init(id: 84,key: "Akali",name : "Akali"),
        champions.init(id: 106,key: "Volibear",name : "Volibear"),
        champions.init(id: 157,key: "Yasuo",name : "Yasuo"),
        champions.init(id: 85,key: "Kennen",name : "Kennen"),
        champions.init(id: 107,key: "Rengar",name : "Rengar"),
        champions.init(id: 13,key: "Ryze",name : "Ryze"),
        champions.init(id: 98,key: "Shen",name : "Shen"),
        champions.init(id: 154,key: "Zac",name : "Zac"),
        champions.init(id: 91,key: "Talon",name : "Talon"),
        champions.init(id: 50,key: "Swain",name : "Swain"),
        champions.init(id: 432,key: "Bard",name : "Bardo"),
        champions.init(id: 14,key: "Sion",name : "Sion"),
        champions.init(id: 67,key: "Vayne",name : "Vayne"),
        champions.init(id: 75,key: "Nasus",name : "Nasus"),
        champions.init(id: 9,key: "Fiddlesticks",name : "Fiddlesticks"),
        champions.init(id: 4,key: "TwistedFate",name : "Twisted Fate"),
        champions.init(id: 31,key: "Chogath",name : "Cho'Gath"),
        champions.init(id: 77,key: "Udyr",name : "Udyr"),
        champions.init(id: 236,key: "Lucian",name : "Lucian"),
        champions.init(id: 427,key: "Ivern",name : "Ivern"),
        champions.init(id: 89,key: "Leona",name : "Leona"),
        champions.init(id: 51,key: "Caitlyn",name : "Caitlyn"),
        champions.init(id: 113,key: "Sejuani",name : "Sejuani"),
        champions.init(id: 56,key: "Nocturne",name : "Nocturne"),
        champions.init(id: 26,key: "Zilean",name : "Zilean"),
        champions.init(id: 268,key: "Azir",name : "Azir"),
        champions.init(id: 68,key: "Rumble",name : "Rumble"),
        champions.init(id: 163,key: "Taliyah",name : "Taliyah"),
        champions.init(id: 17,key: "Teemo",name : "Teemo"),
        champions.init(id: 6,key: "Urgot",name : "Urgot"),
        champions.init(id: 32,key: "Amumu",name : "Amumu"),
        champions.init(id: 3,key: "Galio",name : "Galio"),
        champions.init(id: 74,key: "Heimerdinger",name : "Heimerdinger"),
        champions.init(id: 34,key: "Anivia",name : "Anivia"),
        champions.init(id: 22,key: "Ashe",name : "Ashe"),
        champions.init(id: 161,key: "Velkoz",name : "Vel'Koz"),
        champions.init(id: 27,key: "Singed",name : "Singed"),
        champions.init(id: 72,key: "Skarner",name : "Skarner"),
        champions.init(id: 110,key: "Varus",name : "Varus"),
        champions.init(id: 29,key: "Twitch",name : "Twitch"),
        champions.init(id: 86,key: "Garen",name : "Garen"),
        champions.init(id: 53,key: "Blitzcrank",name : "Blitzcrank"),
        champions.init(id: 11,key: "MasterYi",name : "Master Yi"),
        champions.init(id: 60,key: "Elise",name : "Elise"),
        champions.init(id: 12,key: "Alistar",name : "Alistar"),
        champions.init(id: 55,key: "Katarina",name : "Katarina"),
        champions.init(id: 245,key: "Ekko",name : "Ekko"),
        champions.init(id: 82,key: "Mordekaiser",name : "Mordekaiser"),
        champions.init(id: 117,key: "Lulu",name : "Lulu"),
        champions.init(id: 164,key: "Camille",name : "Camille"),
        champions.init(id: 266,key: "Aatrox",name : "Aatrox"),
        champions.init(id: 119,key: "Draven",name : "Draven"),
        champions.init(id: 223,key: "TahmKench",name : "Tahm Kench"),
        champions.init(id: 80,key: "Pantheon",name : "Pantheon"),
        champions.init(id: 5,key: "XinZhao",name : "Xin Zhao"),
        champions.init(id: 136,key: "AurelionSol",name : "Aurelion Sol"),
        champions.init(id: 64,key: "LeeSin",name : "Lee Sin"),
        champions.init(id: 44,key: "Taric",name : "Taric"),
        champions.init(id: 90,key: "Malzahar",name : "Malzahar"),
        champions.init(id: 127,key: "Lissandra",name : "Lissandra"),
        champions.init(id: 131,key: "Diana",name : "Diana"),
        champions.init(id: 18,key: "Tristana",name : "Tristana"),
        champions.init(id: 421,key: "RekSai",name : "Rek'Sai"),
        champions.init(id: 8,key: "Vladimir",name : "Vladimir"),
        champions.init(id: 59,key: "JarvanIV",name : "Jarvan IV"),
        champions.init(id: 267,key: "Nami",name : "Nami"),
        champions.init(id: 202,key: "Jhin",name : "Jhin"),
        champions.init(id: 16,key: "Soraka",name : "Soraka"),
        champions.init(id: 45,key: "Veigar",name : "Veigar"),
        champions.init(id: 40,key: "Janna",name : "Janna"),
        champions.init(id: 111,key: "Nautilus",name : "Nautilus"),
        champions.init(id: 28,key: "Evelynn",name : "Evelynn"),
        champions.init(id: 79,key: "Gragas",name : "Gragas"),
        champions.init(id: 238,key: "Zed",name : "Zed"),
        champions.init(id: 254,key: "Vi",name : "Vi"),
        champions.init(id: 96,key: "KogMaw",name : "Kog'Maw"),
        champions.init(id: 103,key: "Ahri",name : "Ahri"),
        champions.init(id: 133,key: "Quinn",name : "Quinn"),
        champions.init(id: 7,key: "Leblanc",name : "LeBlanc"),
        champions.init(id: 81,key: "Ezreal",name : "Ezreal"),
        champions.init(id: 497,key: "Rakan",name : "Rakan"),
        champions.init(id: 498,key: "Xayah",name : "Xayah")
    ]
    
    static let sharedInstance: rootclass = rootclass()
    
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
        //static internal var server:Region
        static internal var name:String = ""
        static internal var summonerLevel:Int = 0
        static internal var profileIconId:Int = 0
        static internal var summonerID:Int = 0
        static internal var accountId:Int = 0
        static internal var api_key:String = "RGAPI-50a56712-a157-44cc-9760-0a4649629dff"
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
        var item1:Int = 0
        var item2:Int = 0
        var item3:Int = 0
        var item4:Int = 0
        var item5:Int = 0
        var item6:Int = 0
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
        var item1:Int = 0
        var item2:Int = 0
        var item3:Int = 0
        var item4:Int = 0
        var item5:Int = 0
        var item6:Int = 0
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
    
    class BEErro {
        var msg:String = ""
        var id:Int = 0
    }
    
    func secondsToHoursMinutesSeconds(seconds : Int) -> (Int, Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    
    func listarSummoner(summonername:String,error:@escaping (BEErro) -> ()) {
        
        let rtn = BEErro()
        
        let url = "https://\(Region.REGION_BR.rawValue.lowercased())1.api.riotgames.com/lol/summoner/v3/summoners/by-name/\(summonername)?api_key=\(Summoner.api_key)"
        
        Alamofire.request(url).responseJSON { response in
            
            switch response.result {
            case .success( _):
                let jsummoner = JSON(response.result.value!)
                
                if jsummoner != JSON.null {
                    if(!jsummoner.isEmpty){
                        if (jsummoner["profileIconId"].int != nil) {
                            
                            if let profile = jsummoner["profileIconId"].int {
                                Summoner.profileIconId = profile
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
        
        let url = "https://\(Region.REGION_BR.rawValue.lowercased()).api.riotgames.com/api/lol/\(Region.REGION_BR.rawValue.uppercased())/v1.3/stats/by-summoner/\(Summoner.summonerID)/ranked?season=SEASON2017&api_key=\(Summoner.api_key)"
        
        Alamofire.request(url).responseJSON { response in
            
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
        
        let url = "https://\(Region.REGION_BR.rawValue.lowercased()).api.riotgames.com/api/lol/\(Region.REGION_BR.rawValue.uppercased())/v1.3/stats/by-summoner/\(Summoner.summonerID)/ranked?season=SEASON2017&api_key=\(Summoner.api_key)"
        
        Alamofire.request(url).responseJSON { response in
            
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
        
        let url = "https://\(Region.REGION_BR.rawValue.lowercased()).api.riotgames.com/api/lol/\(Region.REGION_BR.rawValue.uppercased())/v2.5/league/by-summoner/\(Summoner.summonerID)/entry?api_key=\(Summoner.api_key)"
        
        Alamofire.request(url).responseJSON { response in
            
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
        
        let url = "https://\(Region.REGION_BR.rawValue.lowercased()).api.riotgames.com/api/lol/\(Region.REGION_BR.rawValue.uppercased())/v2.2/matchlist/by-summoner/\(Summoner.summonerID)?api_key=\(Summoner.api_key)"
        
        Alamofire.request(url).responseJSON { response in
            
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
        let url = "https://\(rootclass.Region.REGION_BR.rawValue.lowercased()).api.riotgames.com/api/lol/\(rootclass.Region.REGION_BR.rawValue.uppercased())/v2.2/match/\(matchid)?api_key=\(rootclass.Summoner.api_key)"

        Alamofire.request(url).responseJSON { response in
            
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
                let url = "https://\(rootclass.Region.REGION_BR.rawValue.lowercased()).api.riotgames.com/api/lol/\(rootclass.Region.REGION_BR.rawValue.uppercased())/v2.2/match/\(matchids[i])?api_key=\(rootclass.Summoner.api_key)"
                
                let queue = DispatchQueue.global(qos: .background)
                Alamofire.request(url).responseJSON(queue: queue) { response in
            
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
        
        let url = "https://\(Region.REGION_BR.rawValue.lowercased()).api.riotgames.com/api/lol/\(Region.REGION_BR.rawValue.uppercased())/v1.3/game/by-summoner/\(Summoner.summonerID)/recent?api_key=\(Summoner.api_key)"
        
        Alamofire.request(url).responseJSON { response in
            
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
                            }
                            
                            if let item1 = jgames["games"][i]["stats"]["item1"].int {
                                r.stats.item1 = item1
                            }
                            
                            if let item2 = jgames["games"][i]["stats"]["item2"].int {
                                r.stats.item2 = item2
                            }
                            
                            if let item3 = jgames["games"][i]["stats"]["item3"].int {
                                r.stats.item3 = item3
                            }
                            
                            if let item4 = jgames["games"][i]["stats"]["item4"].int {
                                r.stats.item4 = item4
                            }
                            
                            if let item5 = jgames["games"][i]["stats"]["item5"].int {
                                r.stats.item5 = item5
                            }
                            
                            if let item6 = jgames["games"][i]["stats"]["item6"].int {
                                r.stats.item6 = item6
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

    func listaChamp(id:Int) -> champions{
        var rtn = champions.init(id: 0, key: "", name: "")
        
        let champf = championsa.filter({ $0.id == id})
        if champf.count > 0 {
            rtn = champf[0]
        }
        
        return rtn
    }
}
