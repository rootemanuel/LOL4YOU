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
    
    private override init() { }
    static let sharedInstance: rootclass = rootclass()
    
    enum CONST : String  {
        case ZEROS = "0"
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
        champions.init(id: 81,key: "Ezreal",name : "Ezreal")
    ]
    
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
        static internal var api_key:String = "b09887a4-ee19-431e-8bd6-cbe721358e62"
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
        var gold:String = ""
        var doublekill:String = ""
        var triplekill:String = ""
        var quadrakill:String = ""
        var pentakill:String = ""
        var turretskilled:String = ""
        var firstblood:String = ""
    }
    
    class BEErro {
        var msg:String = ""
        var id:Int = 0
    }

    
    func listarSummoner(summonername:String,error:@escaping (BEErro) -> ()) {
        
        var rtn = BEErro()
        
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
                                    r.kills = CONST.ZEROS.rawValue
                                }
                                
                                if let death = jstats["champions"][i]["stats"]["maxNumDeaths"].int {
                                    r.deaths = "\(death / totsp)"
                                } else {
                                    r.deaths = CONST.ZEROS.rawValue
                                }
                                
                                if let assist = jstats["champions"][i]["stats"]["totalAssists"].int {
                                    r.assists = "\(assist / totsp)"
                                } else {
                                    r.assists = CONST.ZEROS.rawValue
                                }
                                
                                if let creep = jstats["champions"][i]["stats"]["totalMinionKills"].int {
                                    r.creeps = "\(creep / totsp)"
                                } else {
                                    r.creeps = CONST.ZEROS.rawValue
                                }
                            } else {
                                if let kill = jstats["champions"][i]["stats"]["totalChampionKills"].int {
                                    r.kills = "\(kill)"
                                } else {
                                    r.kills = CONST.ZEROS.rawValue
                                }
                                
                                if let death = jstats["champions"][i]["stats"]["maxNumDeaths"].int {
                                    r.deaths = "\(death)"
                                } else {
                                    r.deaths = CONST.ZEROS.rawValue
                                }
                                
                                if let assist = jstats["champions"][i]["stats"]["totalAssists"].int {
                                    r.assists = "\(assist)"
                                } else {
                                    r.assists = CONST.ZEROS.rawValue
                                }
                                
                                if let creep = jstats["champions"][i]["stats"]["totalMinionKills"].int {
                                    r.creeps = "\(creep)"
                                } else {
                                    r.creeps = CONST.ZEROS.rawValue
                                }
                            }
                            
                            if let gold = jstats["champions"][i]["stats"]["totalGoldEarned"].int {
                                r.gold = "\(gold / 100) K"
                            } else {
                                r.gold = CONST.ZEROS.rawValue
                            }
                            
                            if let wins = jstats["champions"][i]["stats"]["totalSessionsWon"].int {
                                r.win = "\(wins)"
                            } else {
                                r.win = CONST.ZEROS.rawValue
                            }
                            
                            if let loss = jstats["champions"][i]["stats"]["totalSessionsLost"].int {
                                r.loss = "\(loss)"
                            } else {
                                r.win = CONST.ZEROS.rawValue
                            }
                            
                            if let dkill = jstats["champions"][i]["stats"]["totalDoubleKills"].int {
                                r.doublekill = "\(dkill)"
                            } else {
                                r.doublekill = CONST.ZEROS.rawValue
                            }
                            
                            if let tkill = jstats["champions"][i]["stats"]["totalTripleKills"].int {
                                r.triplekill = "\(tkill)"
                            } else {
                                r.triplekill = CONST.ZEROS.rawValue
                            }
                            
                            if let qkill = jstats["champions"][i]["stats"]["totalQuadraKills"].int {
                                r.quadrakill = "\(qkill)"
                            } else {
                                r.quadrakill = CONST.ZEROS.rawValue
                            }
                            
                            if let pkill = jstats["champions"][i]["stats"]["totalPentaKills"].int {
                                r.pentakill = "\(pkill)"
                            } else {
                                r.pentakill = CONST.ZEROS.rawValue
                            }
                            
                            if let turrets = jstats["champions"][i]["stats"]["totalTurretsKilled"].int {
                                r.turretskilled = "\(turrets)"
                            } else {
                                r.turretskilled = CONST.ZEROS.rawValue
                            }
                            
                            if let firstblood = jstats["champions"][i]["stats"]["totalFirstBlood"].int {
                                r.firstblood = "\(firstblood)"
                            } else {
                                r.firstblood = CONST.ZEROS.rawValue
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
    
    func listaChamp(id:Int) -> champions{
        var rtn = champions.init(id: 0, key: "", name: "")
        
        let champf = championsa.filter({ $0.id == id})
        if champf.count > 0 {
            rtn = champf[0]
        }
        
        return rtn
    }
}
