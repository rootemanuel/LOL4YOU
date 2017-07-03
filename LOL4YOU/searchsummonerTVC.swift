//
//  searchsummonerTVC.swift
//  LOL4YOU
//
//  Created by Emanuel Root on 16/04/17.
//  Copyright © 2017 Emanuel Root. All rights reserved.
//

import UIKit
import SVProgressHUD
import ActionSheetPicker_3_0
import GoogleMobileAds
import FirebaseAnalytics

class searchsummonerTVC: UITableViewController, UITextFieldDelegate, GADBannerViewDelegate, GADRewardBasedVideoAdDelegate {

    @IBOutlet weak var bannerView: GADBannerView!
    
    @IBOutlet weak var srchsummoner: UIButton!
    @IBOutlet weak var summonernick: UITextField!
    @IBOutlet weak var summonerserver: UIButton!
    
    var rt = rootclass.sharedInstance
    
     var rewardBasedVideo: GADRewardBasedVideoAd?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.testeVideo()
        self.initAdMob()
        self.initView()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    @IBAction func btnsrchsummoner(_ sender: AnyObject) {
        
        if rewardBasedVideo?.isReady == true {
            rewardBasedVideo?.present(fromRootViewController: self)
        } else {
            SVProgressHUD.show()
            
            if summonernick.text != nil && (summonernick.text?.isEmpty)! {
                return
            }
            
            rt.listarSummoner(summonername: summonernick.text!.replacingOccurrences(of: " ", with: "")) {(error) in
                
                if error.id == 1 {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "perfil") as! perfilVC
                    
                    self.navigationController?.pushViewController(vc, animated: true)
                }
                SVProgressHUD.dismiss()
            }
        }
    }
    
    func validadados(_ textField: UITextField) {
        
        if (self.summonernick.text?.isEmpty)! {
            self.srchsummoner.isEnabled = false
            self.srchsummoner.alpha = 0.5
            return
        }
        
        if (self.summonerserver.title(for: .normal)?.lowercased() == "server") {
            self.srchsummoner.isEnabled = false
            self.srchsummoner.alpha = 0.5
            return
        }
        
        self.srchsummoner.isEnabled = true
        self.srchsummoner.alpha = 1
        
    }
    
    func initAdMob() {
        let request = GADRequest()
        request.testDevices = [kGADSimulatorID]
        
        Analytics.setScreenName(rootclass.screens.search, screenClass: String(describing: searchsummonerTVC.self))
        
        bannerView.adUnitID = rootclass.lol4you.admob_banner
        bannerView.delegate = self
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        
    }
    
    func initView(){
        let attnav = [
            NSForegroundColorAttributeName: UIColor(hex:rootclass.colors.TEXTO_TOP_BAR.rawValue),
            NSFontAttributeName: UIFont(name: "Friz Quadrata TT", size: 17)!
        ]
        
        self.summonernick.delegate = self
        
        self.title = "Search Summoner"
        self.summonernick.addTarget(self, action: #selector(validadados(_:)), for: .editingChanged)
        
        self.navigationController?.navigationBar.barTintColor = UIColor(hex: rootclass.colors.FUNDO.rawValue)
        self.navigationController?.navigationBar.titleTextAttributes = attnav
    }
    
    @IBAction func btnServerPicker(_ sender: AnyObject) {
        
        let servers = ["Brazil",
                       "EU Nordic & East",
                       "EU West",
                       "Latin America North",
                       "Latin America South",
                       "North America",
                       "Oceania",
                       "Russia",
                       "Turkey",
                       "Japan",
                       "Korea"]
        
        let acp = ActionSheetStringPicker(title: "Server", rows: servers, initialSelection: 0, doneBlock: {
            picker, value, index in
            
            switch value {
            case 0:
                rootclass.lol.server = "BR"
            case 1:
                rootclass.lol.server = "EUNE"
            case 2:
                rootclass.lol.server = "EUW"
            case 3:
                rootclass.lol.server = "LAN"
            case 4:
                rootclass.lol.server = "LAS"
            case 5:
                rootclass.lol.server = "NA"
            case 6:
                rootclass.lol.server = "OCE"
            case 7:
                rootclass.lol.server = "RU"
            case 8:
                rootclass.lol.server = "TR"
            case 9:
                rootclass.lol.server = "JP"
            case 10:
                rootclass.lol.server = "KR"
            default:
                rootclass.lol.server = "BR"
            }
            
            self.summonerserver.setTitle(index as! String?, for: .normal)
            self.validadados(UITextField())
            
            return
            }, cancel: { ActionStringCancelBlock in return }, origin: sender)
        
        let textTitleAtributes = [
            NSForegroundColorAttributeName: UIColor(hex:rootclass.colors.TEXTO_TOP_BAR.rawValue),
            NSFontAttributeName: UIFont(name: "Friz Quadrata TT", size: 17)!
        ]
        
        let pickerTextAttributes:NSMutableDictionary = [NSForegroundColorAttributeName:UIColor(hex:rootclass.colors.FUNDO.rawValue),
                                    NSFontAttributeName: UIFont(name: "Friz Quadrata TT", size: 15)!]
        
        let btDone = UIButton.init(type: .custom)
        btDone.setTitle("Done", for: .normal)
        btDone.setTitleColor(UIColor(hex:rootclass.colors.TEXTO_VITORIA.rawValue), for: .normal)
        btDone.frame = CGRect(x: 0, y: 0, width: 60, height: 30)
        btDone.titleLabel!.font = UIFont(name: "Friz Quadrata TT", size: 15)!
        let btBarDone = UIBarButtonItem(customView: btDone)
        
        let btCancel = UIButton.init(type: .custom)
        btCancel.setTitle("Cancel", for: .normal)
        btCancel.setTitleColor(UIColor(hex:rootclass.colors.TEXTO_DERROTA.rawValue), for: .normal)
        btCancel.frame = CGRect(x: 0, y: 0, width: 60, height: 30)
        btCancel.titleLabel!.font = UIFont(name: "Friz Quadrata TT", size: 15)!
        let btBarCancel = UIBarButtonItem(customView: btCancel)
        
        acp!.titleTextAttributes = textTitleAtributes
        acp!.pickerTextAttributes = pickerTextAttributes
        acp!.toolbarBackgroundColor = UIColor(hex:rootclass.colors.FUNDO.rawValue)
        acp!.toolbarButtonsColor = UIColor(hex:rootclass.colors.FUNDO_CLARO.rawValue)
        
        acp!.setDoneButton(btBarDone)
        acp!.setCancelButton(btBarCancel)
        
        acp!.show()
    }
    
    func testeVideo() {
        
        rewardBasedVideo = GADRewardBasedVideoAd.sharedInstance()
        rewardBasedVideo?.delegate = self
        
        rewardBasedVideo?.load(GADRequest(),
                               withAdUnitID: rootclass.lol4you.admob_banner_video)
        
    }
    
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd,
                            didFailToLoadWithError error: Error) {
        print("Reward based video ad failed to load: \(error.localizedDescription)")
    }
    
    func rewardBasedVideoAdDidReceive(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("Reward based video ad is received.")
    }
    
    func rewardBasedVideoAdDidOpen(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("Opened reward based video ad.")
    }
    
    func rewardBasedVideoAdDidStartPlaying(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("Reward based video ad started playing.")
    }
    
    func rewardBasedVideoAdDidClose(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("Reward based video ad is closed.")
    }
    
    func rewardBasedVideoAdWillLeaveApplication(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("Reward based video ad will leave application.")
    }
    
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd,
                            didRewardUserWith reward: GADAdReward) {
        print("Reward received with currency: \(reward.type), amount \(reward.amount).")
    }
}
