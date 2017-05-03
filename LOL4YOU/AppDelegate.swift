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

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        SVProgressHUD.setBackgroundColor(UIColor(hex: rootclass.colors.FUNDO_CLARO.rawValue))
        SVProgressHUD.setForegroundColor(UIColor(hex: rootclass.colors.BORDA_BRILHANTE.rawValue))
        
        SwiftyPlistManager.shared.start(plistNames: ["root"], logging: true)
        
        SwiftyPlistManager.shared.addNew("helloNewValue", key: "newKey", toPlistWithName: "root") { (err) in
            if err == nil {
                print("Value successfully added into plist.")
            }
        }
        
//        SwiftyPlistManager.shared.save("helloNewValue", forKey: "newKey", toPlistWithName: "root") { (err) in
//            if err == nil {
//                print("Value successfully saved into plist.")
//            }
//        }
//        SwiftyPlistManager.shared.fetchValue(for: "newKey", fromPlistWithName: "root")
        
        SwiftyPlistManager.shared.getValue(for: "newKey", fromPlistWithName: "root") { (result, err) in
            if err == nil {
                print("The Value is: '\(result ?? "No Value Fetched")'")
            }
            print(result)
        }
        
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


}

