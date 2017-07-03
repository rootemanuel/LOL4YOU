//
//  masterysTVC.swift
//  LOL4YOU
//
//  Created by Emanuel Root on 02/05/17.
//  Copyright © 2017 Emanuel Root. All rights reserved.
//

import UIKit
import SVProgressHUD
import GoogleMobileAds
import FirebaseAnalytics

class masterysTVC: UITableViewController, GADRewardBasedVideoAdDelegate {

    var rewardBasedVideo: GADRewardBasedVideoAd?
    var emptytableview:emptytableview? = nil
    var masts = Array<rootclass.BEMasterys>()
    let rt = rootclass.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initAdVideo()
        self.initAdMob()
        self.initView()
        self.loadingView()
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        rt.addCountAdMob();
        
        if rewardBasedVideo?.isReady == true && rt.showAdMob() {
            rewardBasedVideo?.present(fromRootViewController: self)
            return
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "masterysdet") as! masterysdetTVC
        
        vc.title = masts[indexPath.row].name
        vc.masterysdet = self.masts[indexPath.row].masteries
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
        
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.item.text = masts[indexPath.row].name
        if masts[indexPath.row].current {
            cell.valor.text = "CURRENT"
            cell.valor.textColor = UIColor(hex: rootclass.colors.TEXTO_VITORIA.rawValue)
        } else {
            cell.valor.isHidden = true
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numOfSections: Int = 0
        
        if masts.count > 0 {
            numOfSections = masts.count
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
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func loadingView() {
        SVProgressHUD.show()
        
        rt.listarMasterys() {(masterys) in
            if masterys.count > 0 {
                self.masts = masterys
                self.tableView.reloadData()
                SVProgressHUD.dismiss()
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
    
    func initAdMob() {
        Analytics.setScreenName(rootclass.screens.masterys, screenClass: String(describing: masterysTVC.self))
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
        self.title = "Masterys"
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
    
    func spopViewController(){
        self.navigationController?.popViewController(animated: true)
    }
}
