//
//  statsTVC.swift
//  LOL4YOU
//
//  Created by Emanuel Root on 11/04/17.
//  Copyright © 2017 Emanuel Root. All rights reserved.
//

import UIKit
import SVProgressHUD
import GoogleMobileAds
import FirebaseAnalytics

class statsTVC: UITableViewController , GADRewardBasedVideoAdDelegate {
    
    var rt = rootclass.sharedInstance
    
    var stats = Array<rootclass.BEStats>()
    var emptytableview:emptytableview? = nil
    var rewardBasedVideo: GADRewardBasedVideoAd?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initView()
        self.loadingView()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        rt.addCountAdMob();
        
        if rewardBasedVideo?.isReady == true && rt.showAdMob() {
            rewardBasedVideo?.present(fromRootViewController: self)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "statsdet") as! statsdetTVC
        
            vc.statsdet = stats[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let lstats = tableView.dequeueReusableCell(withIdentifier: "statscell", for: indexPath as IndexPath) as! statsTVCC
        
        lstats.selectionStyle = UITableViewCellSelectionStyle.none
        
        lstats.win.text = stats[indexPath.row].win
        lstats.loss.text = stats[indexPath.row].loss
        lstats.kda.text = "\(stats[indexPath.row].kills)/\(stats[indexPath.row].deaths)/\(stats[indexPath.row].assists)"
        lstats.minion.text = stats[indexPath.row].creeps
        
        if stats[indexPath.row].gold >= 1000 {
            lstats.gold.text = String(format:"%.1f K", Double(stats[indexPath.row].gold) / Double(1000))
        } else {
            lstats.gold.text = String(format:"%.1f K", Double(stats[indexPath.row].gold))
        }
        
        let champ = rt.listaChamp(id: stats[indexPath.row].championID)
        lstats.lblChamp.text = champ.name
        lstats.imgChamp.sd_setImage(with: URL(string: champ.imagelink), placeholderImage: UIImage(named: "static_null_all"))
        lstats.imgChamp.layer.borderWidth = 2
        lstats.imgChamp.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_BRILHANTE.rawValue).cgColor
        
        return lstats
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numOfSections: Int = 0
        
        if stats.count > 0 {
            numOfSections = stats.count
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
        
        rt.listarStats() {(stats) in
            
            self.stats = stats.filter { n in n.championID != 0 }
            self.initemptytableview()
            self.tableView.reloadData()
            SVProgressHUD.dismiss()
        }
    }
    
    func initemptytableview() {
        emptytableview = Bundle.main.loadNibNamed("emptytableview", owner: self, options: nil)?.first as? emptytableview
            self.tableView.backgroundView = emptytableview
    }
    
    func initAdMob() {
        Analytics.setScreenName(rootclass.screens.stats, screenClass: String(describing: statsTVC.self))
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
        self.title = "Stats"
    }
    
    func spopViewController(){
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.initAdVideo()
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
}
