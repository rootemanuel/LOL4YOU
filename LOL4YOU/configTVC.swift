//
//  configTVC.swift
//  LOL4YOU
//
//  Created by Emanuel Root on 07/01/2018.
//  Copyright © 2018 Emanuel Root. All rights reserved.
//

import UIKit
import SVProgressHUD
import ActionSheetPicker_3_0
import GoogleMobileAds
import FirebaseAnalytics

protocol languageDelegate: class {
    func setLanguage(_ language: rootclass.BELanguage?)
}

class configTVC: UITableViewController, languageDelegate, GADBannerViewDelegate {
    
    @IBOutlet weak var btnLanguage: UIButton!
    
    let rt = rootclass.sharedInstance
    let admob = rootadmob.sharedInstance
    var champ = rootclass.staticchampions()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initAdMob()
        self.initView()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    @IBAction func btnLanguageSelect(_ sender: Any) {
        
        admob.addCountAdMobInterstitial();
        
        if admob.showAdMobInterstitial() {
            if let adMobInterstitial = admob.getAdInterstitial() {
                adMobInterstitial.present(fromRootViewController: self)
                return
            }
        }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "language") as! languageTVC
        let navcustom = UINavigationController(rootViewController: vc)
        
        vc.delegate = self
        vc.navigation = navcustom
        
        self.navigationController?.present(navcustom, animated: true, completion: nil)
    }
    
    func initView(){
        let attnav = [
            NSForegroundColorAttributeName: UIColor(hex:rootclass.colors.TEXTO_TOP_BAR.rawValue),
            NSFontAttributeName: UIFont(name: "Friz Quadrata TT", size: 17)!
        ]
        
        self.navigationController?.navigationBar.barTintColor = UIColor(hex: rootclass.colors.FUNDO.rawValue)
        self.navigationController?.navigationBar.titleTextAttributes = attnav
        self.title = "Config"
        
        if let language_description:String = rootclass.lol.language_description {
            self.btnLanguage.setTitle(language_description as! String?, for: .normal)
        }
    }
    
    override func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        self.view.endEditing(true)
    }
    
    func setLanguage(_ language: rootclass.BELanguage?) {
        DispatchQueue.global(qos: .userInitiated).async {
            SVProgressHUD.show()
            
            let defaults:UserDefaults = UserDefaults.standard
            defaults.set(language?.language, forKey: "language")
            defaults.set(language?.description, forKey: "language_description")
            
            self.rt.carregarLanguage();
            self.rt.carregarChampionsLocal()
            self.rt.carregarSpellsLocal()
            self.rt.carregarItensLocal();
            self.rt.carregarRunesLocal();
            
            DispatchQueue.main.async {
                
                self.btnLanguage.setTitle(language?.description as! String?, for: .normal)
                self.navigationController?.dismiss(animated: true)
                
                SVProgressHUD.dismiss()
            }
        }
    }
    
    func initAdMob() {
        Analytics.setScreenName(rootclass.screens.config, screenClass: String(describing: configTVC.self))
        
        if rt.viewbanner {
            
            let adBannerView = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait)
            adBannerView.adUnitID = rootadmob.admob.admob_banner
            adBannerView.delegate = self
            adBannerView.rootViewController = self
            adBannerView.load(GADRequest())
            
            self.tableView.tableHeaderView = adBannerView
        }
    }
    
    @IBAction func touchDonate(_ sender: Any) {
        UIApplication.shared.openURL(URL(string: "https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=T9PWX4PMY2N24&lc=BR&item_name=LOL4YOU&currency_code=USD&bn=PP%2dDonationsBF%3abtn_donate_SM%2egif%3aNonHosted")!)
    }
    
    func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
}
