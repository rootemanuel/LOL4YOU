//
//  masterysdetTVC.swift
//  LOL4YOU
//
//  Created by Emanuel Root on 02/05/17.
//  Copyright © 2017 Emanuel Root. All rights reserved.
//

import UIKit
import SDWebImage
import GoogleMobileAds
import FirebaseAnalytics

class masterysdetTVC: UITableViewController, GADBannerViewDelegate{

    var emptytableview:emptytableview? = nil
    let rt = rootclass.sharedInstance
    var masterysdet = Array<rootclass.BEMastery>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initAdMob()
        self.initView()
        self.loadingView()
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("masteryTVCC", owner: self, options: nil)?.first as! masteryTVCC
        
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        let mast = rt.listaMastery(id: masterysdet[indexPath.row].masteryId)
        cell.img.sd_setImage(with: URL(string: mast.imagelink), placeholderImage: UIImage(named: "static_null"))
        cell.img.layer.borderWidth = 1
        cell.img.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_OFUSCADA.rawValue).cgColor
        
        cell.qtd.text = "x \(masterysdet[indexPath.row].rank)"
        cell.desc.text = mast.description[masterysdet[indexPath.row].rank - 1]
        cell.name.text = mast.name
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numOfSections: Int = 0
        
        if masterysdet.count > 0 {
            numOfSections = masterysdet.count
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
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func initemptytableview() {
        emptytableview = Bundle.main.loadNibNamed("emptytableview", owner: self, options: nil)?.first as? emptytableview
        self.tableView.backgroundView = emptytableview
    }
    
    func initAdMob() {
        Analytics.setScreenName(rootclass.screens.masterysdet, screenClass: String(describing: masterysdet.self))
        
        if rt.viewbanner {
            
            let adBannerView = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait)
            adBannerView.adUnitID = rootadmob.admob.admob_banner
            adBannerView.delegate = self
            adBannerView.rootViewController = self
            adBannerView.load(GADRequest())
            
            self.tableView.tableHeaderView = adBannerView
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
    }
    
    func loadingView() {
        
        if masterysdet.count > 0 {
            self.tableView.reloadData()
        } else {
            self.initemptytableview()
        }
    }
    
    func spopViewController(){
        self.navigationController?.popViewController(animated: true)
    }
}
