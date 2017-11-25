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

class rootadmob: NSObject, GADRewardBasedVideoAdDelegate, GADInterstitialDelegate {
    
    static let sharedInstance: rootadmob = rootadmob()
    
    private override init() {
        super.init()
        self.initAdInterstitial()
    }
    
    struct admob {
        static internal var admob_app:String = "ca-app-pub-8175152842112808~9569832570"
        static internal var admob_banner:String = "ca-app-pub-8175152842112808/2046565779"
        static internal var admob_banner_video:String = "ca-app-pub-8175152842112808/4851172240"
        static internal var admob_banner_interstitial:String = "ca-app-pub-8175152842112808/5672725908"
        
        static internal var analytcs_admob_video:String = "ANALYTICS_ADMOB_VIDEO"
        static internal var analytcs_video:String = "VIDEO"
        
        static internal var analytcs_view_video:String = "VIEW_VIDEO"
        static internal var analytcs_failed_load_video:String = "FAILED_LOAD_VIDEO"
        static internal var analytcs_received_video:String = "RECEIVED_VIDEO"
        static internal var analytcs_open_video:String = "OPEN_VIDEO"
        static internal var analytcs_close_video:String = "CLOSE_VIDEO"
        static internal var analytcs_open_close_video:String = "OPEN_CLOSE_VIDEO"
    }
    

    let const_admobcount = 9999
    var adMobCountVideo = 0
    var adMobCountInterstitial = 0
    
    var adVideo: GADRewardBasedVideoAd?
    var adInterstitial:GADInterstitial? = nil
    
    func addCountAdMobVideo() {
        self.adMobCountVideo += 1;
        
        if let adMobVideo = self.adVideo {
            if !adMobVideo.isReady {
                self.initAdVideo()
            }
        }
    }
    
    func addCountAdMobInterstitial() {
        self.adMobCountInterstitial += 1;
        
        if let adMobInterstitial = self.adInterstitial {
            if !adMobInterstitial.isReady {
                self.initAdInterstitial()
            }
        } else {
            self.initAdInterstitial()
        }
    }
    
    func getAdVideo() -> GADRewardBasedVideoAd? {
        return self.adVideo;
    }
    
    func getAdInterstitial() -> GADInterstitial? {
        return self.adInterstitial;
    }
    
    func showAdMobVideo() -> Bool {
        if let adMobVideo = self.adVideo {
            if adMobVideo.isReady && self.adMobCountVideo > const_admobcount {
                self.adMobCountVideo = 0;
                return true
            }
        }
        return false
    }
    
    func showAdMobInterstitial() -> Bool {
        if let adMobInterstitial = self.adInterstitial {
            if adMobInterstitial.isReady && self.adMobCountInterstitial > const_admobcount {
                self.adMobCountInterstitial = 0;
                return true
            }
        }
        return false
    }
    
    func initAdVideo() {
        self.adVideo = GADRewardBasedVideoAd.sharedInstance()
        self.adVideo?.delegate = self
        self.adVideo?.load(GADRequest(),
                                    withAdUnitID: admob.admob_banner_video)
    }
    
    func initAdInterstitial() {
        self.adInterstitial = GADInterstitial(adUnitID: admob.admob_banner_interstitial)
        self.adInterstitial?.delegate = self
        self.adInterstitial?.load(GADRequest())
    }
    
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd,
                            didFailToLoadWithError error: Error) {
        print("#ADMOB - ERROR - \(error.localizedDescription)")
        Analytics.logEvent(rootadmob.admob.analytcs_admob_video, parameters: [rootadmob.admob.analytcs_video: admob.analytcs_failed_load_video])
    }
    
    func rewardBasedVideoAdDidReceive(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        Analytics.logEvent(rootadmob.admob.analytcs_admob_video, parameters: [rootadmob.admob.analytcs_video: admob.analytcs_received_video])
    }
    
    func rewardBasedVideoAdDidOpen(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        Analytics.logEvent(rootadmob.admob.analytcs_admob_video, parameters: [rootadmob.admob.analytcs_video: admob.analytcs_open_video])
    }
    
    func rewardBasedVideoAdDidStartPlaying(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        Analytics.logEvent(rootadmob.admob.analytcs_admob_video, parameters: [rootadmob.admob.analytcs_video: admob.analytcs_open_close_video])
    }
    
    func rewardBasedVideoAdDidClose(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        Analytics.logEvent(rootadmob.admob.analytcs_admob_video, parameters: [rootadmob.admob.analytcs_video: admob.analytcs_close_video])
    }
    
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd,
                            didRewardUserWith reward: GADAdReward) {
        Analytics.logEvent(rootadmob.admob.analytcs_admob_video, parameters: [rootadmob.admob.analytcs_video: admob.analytcs_view_video])
    }
}
