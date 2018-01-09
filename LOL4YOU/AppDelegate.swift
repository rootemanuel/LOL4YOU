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
        
        rt.listarStaticQueue()
        rt.listarStaticMaestryOrder()
        
        rt.carregarLanguage()
        rt.carregarChampionsLocal();
        rt.carregarSpellsLocal();
    }
}

