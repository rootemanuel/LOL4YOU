//
//  runesdetTVC.swift
//  LOL4YOU
//
//  Created by Emanuel Root on 28/04/17.
//  Copyright © 2017 Emanuel Root. All rights reserved.
//

import UIKit
import GoogleMobileAds
import FirebaseAnalytics

class runesdetTVC: UITableViewController, GADBannerViewDelegate {
    var emptytableview:emptytableview? = nil
    let rt = rootclass.sharedInstance
    var runesdet = Array<rootclass.BERune>()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.initAdMob()
        self.initView()
        self.loadingView()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("runesTVCC", owner: self, options: nil)?.first as! runesTVCC
        
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        let rune = rt.listaRune(id: runesdet[indexPath.row].runeId)
        cell.imgrune.sd_setImage(with: URL(string: rune.imagelink), placeholderImage: UIImage(named: "static_null"))
        cell.qtd.text = "x \(runesdet[indexPath.row].rank)"
        cell.desc.text = rune.description
        
        return cell

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numOfSections: Int = 0
        
        if runesdet.count > 0 {
            numOfSections = runesdet.count
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
    
        if runesdet.count > 0 {
            self.tableView.reloadData()
        } else {
            self.initemptytableview()
        }
    }
    
    func initAdMob() {
        Analytics.setScreenName(rootclass.screens.runesdet, screenClass: String(describing: runesdetTVC.self))
        
        let adBannerView = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait)
        adBannerView.adUnitID = rootadmob.admob.admob_banner
        adBannerView.delegate = self
        adBannerView.rootViewController = self
        adBannerView.load(GADRequest())
        
        self.tableView.tableHeaderView = adBannerView
    }
    
    func spopViewController(){
        self.navigationController?.popViewController(animated: true)
    }
    
}
