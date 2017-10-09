//
//  rootadmob.swift
//  LOL4YOU
//
//  Created by Emanuel Root on 05/07/17.
//  Copyright © 2017 Emanuel Root. All rights reserved.
//

import UIKit
import GoogleMobileAds
import FirebaseAnalytics

class rootadmob: NSObject, GADRewardBasedVideoAdDelegate {
    
    static let sharedInstance: rootadmob = rootadmob()
    
    private override init() {
        super.init()
        self.initAdVideo()
    }
    
    struct admob {
        static internal var admob_app:String = "ca-app-pub-8175152842112808~9569832570"
        static internal var admob_banner:String = "ca-app-pub-8175152842112808/2046565779"
        static internal var admob_banner_video:String = "ca-app-pub-8175152842112808/4851172240"
        
        static internal var analytcs_admob_video:String = "ANALYTICS_ADMOB_VIDEO"
        static internal var analytcs_video:String = "VIDEO"
        
        static internal var analytcs_view_video:String = "VIEW_VIDEO"
        static internal var analytcs_failed_load_video:String = "FAILED_LOAD_VIDEO"
        static internal var analytcs_received_video:String = "RECEIVED_VIDEO"
        static internal var analytcs_open_video:String = "OPEN_VIDEO"
        static internal var analytcs_close_video:String = "CLOSE_VIDEO"
        static internal var analytcs_open_close_video:String = "OPEN_CLOSE_VIDEO"
    }
    

    let const_admobcount = 5
    var adMobCount = 0
    var rewardBasedVideo: GADRewardBasedVideoAd?
    
    func addCountAdMob() {
        self.adMobCount += 1;
        
        if let adMobVideo = self.rewardBasedVideo {
            if !adMobVideo.isReady {
                self.initAdVideo()
            }
        }
    }
    
    func getRewardBasedVideo() -> GADRewardBasedVideoAd? {
        return self.rewardBasedVideo;
    }
    
    func showAdMob() -> Bool {
        if let adMobVideo = self.rewardBasedVideo {
            if adMobVideo.isReady && self.adMobCount > const_admobcount {
                self.adMobCount = 0;
                return true
            }
        }
        return false
    }
    
    func initAdVideo() {
        self.rewardBasedVideo = GADRewardBasedVideoAd.sharedInstance()
        self.rewardBasedVideo?.delegate = self
        self.rewardBasedVideo?.load(GADRequest(),
                                    withAdUnitID: rootadmob.admob.admob_banner_video)
    }
    
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd,
                            didFailToLoadWithError error: Error) {
        NSLog(error.localizedDescription)
        Analytics.logEvent(rootadmob.admob.analytcs_admob_video, parameters: [rootadmob.admob.analytcs_video: rootadmob.admob.analytcs_failed_load_video])
    }
    
    func rewardBasedVideoAdDidReceive(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        Analytics.logEvent(rootadmob.admob.analytcs_admob_video, parameters: [rootadmob.admob.analytcs_video: rootadmob.admob.analytcs_received_video])
    }
    
    func rewardBasedVideoAdDidOpen(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        Analytics.logEvent(rootadmob.admob.analytcs_admob_video, parameters: [rootadmob.admob.analytcs_video: rootadmob.admob.analytcs_open_video])
    }
    
    func rewardBasedVideoAdDidStartPlaying(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        Analytics.logEvent(rootadmob.admob.analytcs_admob_video, parameters: [rootadmob.admob.analytcs_video: rootadmob.admob.analytcs_open_close_video])
    }
    
    func rewardBasedVideoAdDidClose(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        Analytics.logEvent(rootadmob.admob.analytcs_admob_video, parameters: [rootadmob.admob.analytcs_video: rootadmob.admob.analytcs_close_video])
    }
    
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd,
                            didRewardUserWith reward: GADAdReward) {
        Analytics.logEvent(rootadmob.admob.analytcs_admob_video, parameters: [rootadmob.admob.analytcs_video: rootadmob.admob.analytcs_view_video])
    }
}
