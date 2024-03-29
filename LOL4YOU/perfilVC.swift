//
//  perfilVC.swift
//  LOL4YOU
//
//  Created by Emanuel Root on 17/04/17.
//  Copyright © 2017 Emanuel Root. All rights reserved.
//

import UIKit
import SVProgressHUD
import SDWebImage
import GoogleMobileAds
import FirebaseAnalytics

class perfilVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var imgperfil: UIImageView!
    @IBOutlet weak var imglvl: UIImageView!
    @IBOutlet weak var lvl: UILabel!
    
    let admob = rootadmob.sharedInstance
    let rt = rootclass.sharedInstance
    
    struct menu {
        var title:String
        var image:String
    }
    
    let menus = [
        menu.init(title: "Profile", image: "static_menu_profile"),
//        menu.init(title: "Stats", image: "static_menu_stats"),
        menu.init(title: "Matches", image: "static_menu_matches"),
//        menu.init(title: "Runes", image: "static_menu_runes"),
//        menu.init(title: "Masteries", image: "static_menu_masterys"),
        menu.init(title: "Champion Mastery", image: "static_menu_masteries")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initAdMob()
        self.initView()
        self.initSession()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menus.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: perfilCVC = collectionView.dequeueReusableCell(withReuseIdentifier: "cellperfil", for: indexPath) as! perfilCVC
        
        cell.imgPerfil.image = UIImage(named: menus[indexPath.row].image)
        cell.lblPerfil.text = menus[indexPath.row].title
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        var tiers = Array<perfilstatusV>()
        
        admob.addCountAdMobInterstitial();
        
        if admob.showAdMobInterstitial() {
            if let adMobInterstitial = admob.getAdInterstitial() {
                adMobInterstitial.present(fromRootViewController: self)
                return
            }
        }
        
        if indexPath.item == 0 {
            
            SVProgressHUD.show()
            
            rt.listarLeague() {(league) in
                
                for i in 0 ..< league.count {
                    
                    let r = Bundle.main.loadNibNamed("perfilstatusV", owner: self, options: nil)?.first as! perfilstatusV
                    
                    r.imgtier.image = UIImage(named: "tier_\(league[i].tier.lowercased())\(league[i].division)")
                    r.tier.text = "\(league[i].tier) \(league[i].division)"
                    r.nameleague.text = league[i].name
                    r.queue.text = league[i].queue.replacingOccurrences(of: "_", with: " ")
                    r.leaguepoints.text = "\(league[i].leaguePoints)"
                    
                    tiers.append(r)
                }
                
                if tiers.count == 0 {
                    let r = Bundle.main.loadNibNamed("perfilstatusV", owner: self, options: nil)?.first as! perfilstatusV
                    
                    r.imgtier.image = UIImage(named: "tier_unranked")
                    r.tier.text = "Unranked"
                    
                    tiers.append(r)
                }
                
                self.rt.listarStatsProfile() {(stats) in

                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "perfilstats") as! perfilstatsTVC
                    
                    vc.tiers = tiers
                    vc.stats = stats
                    
                    SVProgressHUD.dismiss()
                    
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
//        } else if indexPath.item == 1 {
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let vc = storyboard.instantiateViewController(withIdentifier: "stats") as! statsTVC
//                    
//            self.navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.item == 1 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "matches") as! matchesTVC
            
            self.navigationController?.pushViewController(vc, animated: true)
//        }else if indexPath.item == 2 {
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let vc = storyboard.instantiateViewController(withIdentifier: "runes") as! runesTVC
//
//            self.navigationController?.pushViewController(vc, animated: true)
//        }else if indexPath.item == 3 {
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let vc = storyboard.instantiateViewController(withIdentifier: "masterys") as! masterysTVC
//
//            self.navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.item == 2 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "champmastery") as! champmasteryVC
    
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

    func initView(){
        let attnav = [
            NSAttributedStringKey.foregroundColor: UIColor(hex:rootclass.colors.TEXTO_TOP_BAR.rawValue),
            NSAttributedStringKey.font: UIFont(name: "Friz Quadrata TT", size: 17)!
        ]
        
        self.title = rootclass.Summoner.name
 
        let button = UIButton.init(type: .custom)
        button.setImage(UIImage(named:"static_button_back"), for: UIControlState.normal)
        button.addTarget(self, action:#selector(spopViewController), for: UIControlEvents.touchUpInside)
        button.frame = CGRect.init(x: 0, y: 0, width: 30, height: 30)
        let barButton = UIBarButtonItem.init(customView: button)
        self.navigationItem.leftBarButtonItem = barButton
        
        self.navigationController?.navigationBar.barTintColor = UIColor(hex: rootclass.colors.FUNDO.rawValue)
        self.navigationController?.navigationBar.titleTextAttributes = attnav
    
        self.imgperfil.sd_setImage(with: URL(string: rootclass.Summoner.imagelink), placeholderImage: UIImage(named: "static_null_all"))
        self.imgperfil.layer.borderWidth = 4
        self.imgperfil.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_BRILHANTE.rawValue).cgColor
        
        self.lvl.text = ("\(rootclass.Summoner.summonerLevel)")
        self.imglvl.layer.borderWidth = 2
        self.imglvl.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
        
    }
    
    func initSession() {
        
         SVProgressHUD.show()
        
        self.rt.listarStaticChampMastery()
        
        self.rt.listarMatchesSession() {(matchesid) in
            if matchesid.count > 0 {
                for i in 0 ..< matchesid.count {
                    self.rt.listarMatchUni(matchid: matchesid[i])
                }
            }
            
             SVProgressHUD.dismiss()
        }
    }
    
    func initAdMob() {
        Analytics.setScreenName(rootclass.screens.menu, screenClass: String(describing: perfilVC.self))
    }
    
    @objc func spopViewController(){
        self.navigationController?.popViewController(animated: true)
    }
}
