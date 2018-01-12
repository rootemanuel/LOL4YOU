//
//  championsTVC.swift
//  LOL4YOU
//
//  Created by Emanuel Root on 24/11/17.
//  Copyright © 2017 Emanuel Root. All rights reserved.
//

import UIKit
import GoogleMobileAds
import FirebaseAnalytics

class championsTVC: UITableViewController, GADBannerViewDelegate {
    
    @IBOutlet weak var segtables: UISegmentedControl!
    @IBOutlet weak var tableChamp: UITableView!
    
    let rt = rootclass.sharedInstance
    var champ = rootclass.staticchampions()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initAdMob()
        self.initView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = Bundle.main.loadNibNamed("championsimgTVCC", owner: self, options: nil)?.first as! championsimgTVCC
            
            cell.selectionStyle = UITableViewCellSelectionStyle.none

            let iskins = Int(arc4random_uniform(UInt32(champ.skins.count)))
            cell.lblName.text = champ.name
            cell.lblNameDesc.text = champ.title
            cell.lblTags.text = champ.tags.flatMap({$0}).joined(separator:", ")
            cell.imgChampSkin.sd_setImage(with: URL(string: champ.skins[iskins].link), placeholderImage: nil)
            
            cell.imgChamp.sd_setImage(with: URL(string: "\(rootclass.images.champion)\(champ.imagefull)"), placeholderImage: UIImage(named: "static_null_all"))
            cell.imgChamp.layer.borderWidth = 1
            cell.imgChamp.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_BRILHANTE.rawValue).cgColor
            
            return cell
        case 1:
            let cell = Bundle.main.loadNibNamed("championstableTVCC", owner: self, options: nil)?.first as! championstableTVCC
            
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            cell.champ = self.champ
            
            return cell
        default:
            let cell = Bundle.main.loadNibNamed("championsimgTVCC", owner: self, options: nil)?.first as! championsimgTVCC
            
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 200
        case 1:
            return 450
        default:
            return 0
        }
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
        self.title = self.champ.name
    }
    
    func initAdMob() {
        Analytics.setScreenName(rootclass.screens.champions, screenClass: String(describing: championsTVC.self))
        
        if rt.viewbanner {
            
            let adBannerView = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait)
            adBannerView.adUnitID = rootadmob.admob.admob_banner
            adBannerView.delegate = self
            adBannerView.rootViewController = self
            adBannerView.load(GADRequest())
            
            self.tableView.tableHeaderView = adBannerView
        }
    }
    
    func spopViewController(){
        self.navigationController?.popViewController(animated: true)
    }
}
