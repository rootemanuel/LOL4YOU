//
//  AppDelegate.swift
//  LOL4YOU
//
//  Created by Emanuel Root on 11/04/17.
//  Copyright © 2017 Emanuel Root. All rights reserved.
//

import UIKit
import SVProgressHUD
import SwiftyPlistManager
import SDWebImage
import SwiftyJSON
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let rt = rootclass.sharedInstance
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        SVProgressHUD.setBackgroundColor(UIColor(hex: rootclass.colors.FUNDO_CLARO.rawValue))
        SVProgressHUD.setForegroundColor(UIColor(hex: rootclass.colors.BORDA_BRILHANTE.rawValue))
        
        self.initializeApplicationRoot()
    
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func initializeApplicationRoot() {
        
        //Google Initialization
        FirebaseApp.configure()
        GADMobileAds.configure(withApplicationID: rootadmob.admob.admob_app)
        
        SwiftyPlistManager.shared.start(plistNames: [rootclass.shared.root], logging: true)
        
        print("#R00T - ANTES listaKeyLOL - \(NSDate())")
//        rt.listaKeyLOL()
        print("#R00T - ANTES listarVersion - \(NSDate())")
        rt.listarVersion()
        print("#R00T - ANTES listarStaticQueue - \(NSDate())")
        rt.listarStaticQueue()
        rt.listarStaticMaestryOrder()
        
        print("#R00T - ANTES shared.getValue - \(NSDate())")
        SwiftyPlistManager.shared.getValue(for: rootclass.shared.version, fromPlistWithName: rootclass.shared.root) { (result, err) in
            if result != nil {
                if let vplist =  result as? String {
                    let vsaved = Int(vplist.replacingOccurrences(of: ".", with: "")) ?? 0
                    let vlol = Int(rootclass.lol.version.replacingOccurrences(of: ".", with: "")) ?? 0
                    
                    if vlol > vsaved {
                        
                        SDImageCache.shared().clearMemory()
                        SDImageCache.shared().clearDisk()
                        
                        print("#R00T - ANTES - SALVOU VERSAO VALOR - \(NSDate())")
                        SwiftyPlistManager.shared.save(rootclass.lol.version, forKey: rootclass.shared.version, toPlistWithName: rootclass.shared.root) { (err) in
                            if err == nil {
                                NSLog("R00T - SALVOU VERSAO VALOR - \(rootclass.lol.version)")
                            }
                        }
                        print("#R00T - ANTES - SALVOU SPELL - \(NSDate())")
                        self.rt.listarStaticSpell{(spells) in
                            do {
                                try  self.rt.writeJsonLocal(file: rootclass.shared.spells, data: spells.rawData())
                            } catch {
                                NSLog("R00T - WRITE JSON LOCAL - ERROR: \(error)")
                            }
                        }
                        print("#R00T - ANTES - SALVOU RUNES - \(NSDate())")
                        self.rt.listarStaticRunes{(runes) in
                            do {
                                try  self.rt.writeJsonLocal(file: rootclass.shared.runes, data: runes.rawData())
                            } catch {
                                NSLog("R00T - WRITE JSON LOCAL - ERROR: \(error)")
                            }
                        }
                        print("#R00T - ANTES - SALVOU CHAMPIONS - \(NSDate())")
                        self.rt.listarStaticChampions{(champions) in
                            do {
                                try  self.rt.writeJsonLocal(file: rootclass.shared.champions, data: champions.rawData())
                            } catch {
                                NSLog("R00T - WRITE JSON LOCAL - ERROR: \(error)")
                            }
                        }
                        print("#R00T - ANTES - SALVOU MASTERY - \(NSDate())")
                        self.rt.listarStaticMastery{(masterys) in
                            do {
                                try  self.rt.writeJsonLocal(file: rootclass.shared.masterys, data: masterys.rawData())
                            } catch {
                                NSLog("R00T - WRITE JSON LOCAL - ERROR: \(error)")
                            }
                        }
                    } else {
                        do {
                            print("#R00T - ANTES - SALVOU SPELL CACHE - \(NSDate())")
                            let spellsd = try self.rt.readJsonLocal(file: rootclass.shared.spells)
                            if !spellsd.isEmpty {
                                let spellsj = try JSON(data: spellsd)
                                DispatchQueue.main.async {
                                    self.rt.listarStaticSpell(jspell: spellsj)
                                }
                                NSLog("R00T - CARREGOU SPELLS CACHE - \(spellsd)")
                            }
                        } catch {
                            NSLog("R00T - SPELLS CACHE - ERROR: \(error)")
                        }
                        
                        do {
                            print("#R00T - ANTES - SALVOU CHAMPION CACHE - \(NSDate())")
                            let championsd = try self.rt.readJsonLocal(file: rootclass.shared.champions)
                            if !championsd.isEmpty {
                                let championsj = try JSON(data:championsd)
                                self.rt.listarStaticChampionsList(jchampions: championsj)
                                NSLog("R00T - CARREGOU CHAMPIONS CACHE - \(championsd)")
                            }
                        } catch {
                            NSLog("R00T - CHAMPIONS CACHE - ERROR: \(error)")
                        }
                        
                        do {
                            print("#R00T - ANTES - SALVOU RUNES CACHE - \(NSDate())")
                            let runesd = try self.rt.readJsonLocal(file: rootclass.shared.runes)
                            if !runesd.isEmpty {
                                let runesj = try JSON(data:runesd)
                                self.rt.listarStaticRunes(jrunes: runesj)
                                NSLog("R00T - CARREGOU RUNES CACHE - \(runesd)")
                            }
                        } catch {
                            NSLog("R00T - RUNES CACHE - ERROR: \(error)")
                        }
                        
                        do {
                            print("#R00T - ANTES - SALVOU MASTERY CACHE - \(NSDate())")
                            let masterysd = try self.rt.readJsonLocal(file: rootclass.shared.masterys)
                            if !masterysd.isEmpty {
                                let masterysj = try JSON(data:masterysd)
                                self.rt.listarStaticMastery(jmastery: masterysj)
                                NSLog("R00T - CARREGOU MASTERYS CACHE - \(masterysd)")
                            }
                        } catch {
                            NSLog("R00T - MASTERYS CACHE - ERROR:  \(error)")
                        }
                    }
                }
            } else {
                DispatchQueue.main.async {
                SwiftyPlistManager.shared.addNew(rootclass.lol.version, key: rootclass.shared.version, toPlistWithName: rootclass.shared.root) { (err) in
                    if err == nil {
                        NSLog("R00T - CRIOU VERSAO VALOR - \(rootclass.lol.version)")
                    }
                }
                self.rt.listarStaticSpell{(spells) in
                    do {
                        try  self.rt.writeJsonLocal(file: rootclass.shared.spells, data: spells.rawData())
                    } catch {
                        NSLog("R00T - WRITE JSON LOCAL - ERROR: \(error)")
                    }
                }
                self.rt.listarStaticRunes{(runes) in
                    do {
                        try  self.rt.writeJsonLocal(file: rootclass.shared.runes, data: runes.rawData())
                    } catch {
                        NSLog("R00T - WRITE JSON LOCAL - ERROR: \(error)")
                    }
                }
                self.rt.listarStaticChampions{(champions) in
                    do {
                        try  self.rt.writeJsonLocal(file: rootclass.shared.champions, data: champions.rawData())
                    } catch {
                        NSLog("R00T - WRITE JSON LOCAL - ERROR: \(error)")
                    }
                }
                self.rt.listarStaticMastery{(masterys) in
                    do {
                        try  self.rt.writeJsonLocal(file: rootclass.shared.masterys, data: masterys.rawData())
                    } catch {
                        NSLog("R00T - WRITE JSON LOCAL - ERROR: \(error)")
                    }
                }
                }
            }
        }
    }
}

