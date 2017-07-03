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
import GoogleMobileAds
import FirebaseAnalytics

class matchesTVC: UITableViewController, GADRewardBasedVideoAdDelegate {

    var rt = rootclass.sharedInstance
    
    var matchs = Array<rootclass.BEMatchSmall>()
    var emptytableview:emptytableview? = nil
    var rewardBasedVideo: GADRewardBasedVideoAd?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initAdMob()
        self.initAdVideo()
        self.initView()
        self.loadingView()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        SVProgressHUD.show()
        
        rt.listarMatchDetUni(matchid: matchs[indexPath.row].gameId) {(matchdet) in
            if matchdet != nil  {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "matchesdet") as! matchesdetTVC
                
                vc.matchdet = matchdet!
                
                self.navigationController?.pushViewController(vc, animated: true)
            } else {
                print("errasdasd")
            }
            SVProgressHUD.dismiss()
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let lmatches = tableView.dequeueReusableCell(withIdentifier: "matchescell", for: indexPath as IndexPath) as! matchesTVCC
        
        lmatches.selectionStyle = UITableViewCellSelectionStyle.none
        
        let tmatchs = matchs[indexPath.row]
        
        lmatches.queue.text = tmatchs.subType.replacingOccurrences(of: "_", with: " ")
        lmatches.kda.text = "\(tmatchs.stats.championsKilled)/\(tmatchs.stats.numDeaths)/\(tmatchs.stats.assists)"
        lmatches.minions.text = "\(tmatchs.stats.minionsKilled)"
        
        if tmatchs.stats.goldEarned >= 1000 {
            lmatches.gold.text = String(format:"%.1f K", Double(tmatchs.stats.goldEarned) / Double(1000))
        } else {
            lmatches.gold.text = String(format:"%.1f K", Double(tmatchs.stats.goldEarned))
        }

        if tmatchs.stats.timePlayed > 0 {
            let (h,m,s) = rt.secondsToHoursMinutesSeconds(seconds: tmatchs.stats.timePlayed)
            if h > 0 {
                lmatches.minutes.text = "\(String(format: "%.2d",h)):\(String(format: "%.2d",m)):\(String(format: "%.2d",s))"
            } else {
                lmatches.minutes.text = "\(String(format: "%.2d",m)):\(String(format: "%.2d",s))"
            }
        }
            
        if tmatchs.createDate != 0 {
            let date = Date(timeIntervalSince1970: TimeInterval(tmatchs.createDate / 1000))
            let formatter  = DateFormatter()
            formatter.dateFormat = "MM/dd/yyyy"
            
            lmatches.day.text = formatter.string(from: date)
        }
            
        if tmatchs.stats.win {
            lmatches.winloss.text = "VICTORY"
            lmatches.winloss.textColor = UIColor(hex: rootclass.colors.TEXTO_VITORIA.rawValue)
        } else {
            lmatches.winloss.text = "DEFEAT"
            lmatches.winloss.textColor = UIColor(hex: rootclass.colors.TEXTO_DERROTA.rawValue)
        }
        
        if tmatchs.stats.level > 0 {
            lmatches.lvl.text = "\(tmatchs.stats.level)"
            lmatches.imglvl.backgroundColor = UIColor(hex: rootclass.colors.FUNDO.rawValue)
            lmatches.imglvl.layer.borderWidth = 1
            lmatches.imglvl.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
        } else {
            lmatches.imglvl.isHidden = true
            lmatches.lvl.isHidden = true
        }
        
        let champ = rt.listaChamp(id: tmatchs.championId)
        
        
        lmatches.imgchamp.sd_setImage(with: URL(string: champ.imagelink), placeholderImage: UIImage(named: "static_null_all"))
        lmatches.imgchamp.layer.borderWidth = 2
        lmatches.imgchamp.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_BRILHANTE.rawValue).cgColor
        
        lmatches.imgitem0.sd_setImage(with: URL(string: tmatchs.stats.item0imagelink), placeholderImage: UIImage(named: "static_null"))
        lmatches.imgitem0.layer.borderWidth = 1
        lmatches.imgitem0.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
        
        lmatches.imgitem1.sd_setImage(with: URL(string: tmatchs.stats.item1imagelink), placeholderImage: UIImage(named: "static_null"))
        lmatches.imgitem1.layer.borderWidth = 1
        lmatches.imgitem1.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
        
        lmatches.imgitem2.sd_setImage(with: URL(string: tmatchs.stats.item2imagelink), placeholderImage: UIImage(named: "static_null"))
        lmatches.imgitem2.layer.borderWidth = 1
        lmatches.imgitem2.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
    
        lmatches.imgitem3.sd_setImage(with: URL(string: tmatchs.stats.item3imagelink), placeholderImage: UIImage(named: "static_null"))
        lmatches.imgitem3.layer.borderWidth = 1
        lmatches.imgitem3.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor

        lmatches.imgitem4.sd_setImage(with: URL(string: tmatchs.stats.item4imagelink), placeholderImage: UIImage(named: "static_null"))
        lmatches.imgitem4.layer.borderWidth = 1
        lmatches.imgitem4.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor

        lmatches.imgitem5.sd_setImage(with: URL(string: tmatchs.stats.item5imagelink), placeholderImage: UIImage(named: "static_null"))
        lmatches.imgitem5.layer.borderWidth = 1
        lmatches.imgitem5.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor

        lmatches.imgtrinket.sd_setImage(with: URL(string: tmatchs.stats.item6imagelink), placeholderImage: UIImage(named: "static_null"))
        lmatches.imgtrinket.layer.borderWidth = 1
        lmatches.imgtrinket.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor

        let aspell1 = rt.listaSpeel(id: tmatchs.spell1)
        lmatches.imgtlt0.sd_setImage(with: URL(string: aspell1.imagelink), placeholderImage: UIImage(named: "static_null"))
        lmatches.imgtlt0.layer.borderWidth = 1
        lmatches.imgtlt0.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
        
        let aspell2 = rt.listaSpeel(id: tmatchs.spell2)
        lmatches.imgtlt1.sd_setImage(with: URL(string: aspell2.imagelink), placeholderImage: UIImage(named: "static_null"))
        lmatches.imgtlt1.layer.borderWidth = 1
        lmatches.imgtlt1.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor

        return lmatches
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numOfSections: Int = 0
        
        if matchs.count > 0 {
            numOfSections = matchs.count
            tableView.separatorStyle = .singleLine
            tableView.backgroundView?.isHidden = true
            tableView.backgroundColor = UIColor(hex: rootclass.colors.FUNDO.rawValue)
        } else {
            tableView.separatorStyle = .none
            tableView.backgroundView?.isHidden = false
            tableView.backgroundColor = UIColor(hex: rootclass.colors.FUNDO_EMPTY_TABLEVIEW.rawValue)
        }
        
        return numOfSections
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func loadingView() {
        SVProgressHUD.show()
    
        rt.listarGame() {(match) in
            if match.count > 0 {
                    DispatchQueue.main.async {
                        self.matchs = match
                        self.tableView.reloadData()
                        SVProgressHUD.dismiss()
                    }
            } else {
                 self.initemptytableview()
                 SVProgressHUD.dismiss()
            }
        }
    }
    
    func initemptytableview() {
        emptytableview = Bundle.main.loadNibNamed("emptytableview", owner: self, options: nil)?.first as? emptytableview
        self.tableView.backgroundView = emptytableview
    }
    
    func initView(){
        let attnav = [
            NSForegroundColorAttributeName: UIColor(hex:rootclass.colors.TEXTO_TOP_BAR.rawValue),
            NSFontAttributeName: UIFont(name: "Friz Quadrata TT", size: 17)!
        ]
        
        let button = UIButton.init(type: .custom)
        button.setImage(UIImage(named:"static_button_back"), for: UIControlState.normal)
        button.addTarget(self, action:#selector(spopViewController), for: UIControlEvents.touchUpInside)
        button.frame = CGRect.init(x: 0, y: 0, width: 30, height: 30)
        let barButton = UIBarButtonItem.init(customView: button)
        self.navigationItem.leftBarButtonItem = barButton
        
        self.navigationController?.navigationBar.barTintColor = UIColor(hex: rootclass.colors.FUNDO.rawValue)
        self.navigationController?.navigationBar.titleTextAttributes = attnav
        self.title = "Matches"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.initAdVideo()
    }
    
    func initAdMob() {
        Analytics.setScreenName(rootclass.screens.matches, screenClass: String(describing: matchesTVC.self))
    }
    
    func initAdVideo() {
        rewardBasedVideo = GADRewardBasedVideoAd.sharedInstance()
        rewardBasedVideo?.delegate = self
        rewardBasedVideo?.load(GADRequest(),
                               withAdUnitID: rootclass.lol4you.admob_banner_video)
    }
    
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd,
                            didFailToLoadWithError error: Error) {
        Analytics.logEvent(rootclass.lol4you.analytcs_admob_video, parameters: [rootclass.lol4you.analytcs_video: rootclass.lol4you.analytcs_failed_load_video])
    }
    
    func rewardBasedVideoAdDidReceive(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        Analytics.logEvent(rootclass.lol4you.analytcs_admob_video, parameters: [rootclass.lol4you.analytcs_video: rootclass.lol4you.analytcs_received_video])
    }
    
    func rewardBasedVideoAdDidOpen(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        Analytics.logEvent(rootclass.lol4you.analytcs_admob_video, parameters: [rootclass.lol4you.analytcs_video: rootclass.lol4you.analytcs_open_video])
    }
    
    func rewardBasedVideoAdDidStartPlaying(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        Analytics.logEvent(rootclass.lol4you.analytcs_admob_video, parameters: [rootclass.lol4you.analytcs_video: rootclass.lol4you.analytcs_open_close_video])
    }
    
    func rewardBasedVideoAdDidClose(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        Analytics.logEvent(rootclass.lol4you.analytcs_admob_video, parameters: [rootclass.lol4you.analytcs_video: rootclass.lol4you.analytcs_close_video])
    }
    
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd,
                            didRewardUserWith reward: GADAdReward) {
        Analytics.logEvent(rootclass.lol4you.analytcs_admob_video, parameters: [rootclass.lol4you.analytcs_video: rootclass.lol4you.analytcs_view_video])
    }
    
    func spopViewController(){
        self.navigationController?.popViewController(animated: true)
    }
}
