//
//  runesTVC.swift
//  LOL4YOU
//
//  Created by Emanuel Root on 28/04/17.
//  Copyright © 2017 Emanuel Root. All rights reserved.
//

import UIKit
import SVProgressHUD
import GoogleMobileAds
import FirebaseAnalytics

class runesTVC: UITableViewController, GADBannerViewDelegate{
    
    let rt = rootclass.sharedInstance
    let admob = rootadmob.sharedInstance
    
    var emptytableview:emptytableview? = nil
    var runes = Array<rootclass.staticrune>()
    var sizesDesc = [Int](0...100);
    var langAtu = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initAdMob()
        self.initView()
        self.loadingView()
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//        admob.addCountAdMobInterstitial();
//        
//        if admob.showAdMobInterstitial() {
//            if let adMobInterstitial = admob.getAdInterstitial() {
//                adMobInterstitial.present(fromRootViewController: self)
//                return
//            }
//        }
//        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "runesdet") as! runesdetTVC
//        
//        let slots = self.runes[indexPath.row].slots
//        var runesvc = Array<rootclass.BERune>()
//        
//        var runeidant = 0
//        for i in 0 ..< slots.count {
//            if runeidant != slots[i].runeId {
//                let r = rootclass.BERune()
//                let runeaux = slots.filter{p in p.runeId == slots[i].runeId}
//                
//                if runeaux.count > 0 {
//                    r.runeId = slots[i].runeId
//                    r.rank = runeaux.count
//                    runesvc.append(r)
//                }
//                
//                runeidant = slots[i].runeId
//            }
//        }
//        
//        vc.title = runes[indexPath.row].name
//        vc.runesdet = runesvc
//        
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("runesTVCC", owner: self, options: nil)?.first as! runesTVCC
        let rune = runes[indexPath.row]
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        cell.name.text = rune.name
        cell.desc.text = rune.longDesc
        
        resizeCell(cell: cell, indexPath: indexPath)
        
        cell.imgrune.sd_setImage(with: URL(string: "\(rune.imagelink)"), placeholderImage: UIImage(named: "static_null_all"))
        cell.imgrune.layer.borderWidth = 1
        cell.imgrune.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_BRILHANTE.rawValue).cgColor
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numOfSections: Int = 0
        
        if runes.count > 0 {
            numOfSections = runes.count
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
        return CGFloat(self.sizesDesc[indexPath.row])
    }
    
    func loadingView() {
        SVProgressHUD.show()
        
        self.runes = rt.listStaticRunesReforged.sorted(by: { $0.name < $1.name })
        
        SVProgressHUD.dismiss()
    }
    
    func initemptytableview() {
        emptytableview = Bundle.main.loadNibNamed("emptytableview", owner: self, options: nil)?.first as? emptytableview
        self.tableView.backgroundView = emptytableview
    }
    
    func initAdMob() {
        Analytics.setScreenName(rootclass.screens.runes, screenClass: String(describing: runesTVC.self))
        
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
            NSAttributedStringKey.foregroundColor: UIColor(hex:rootclass.colors.TEXTO_TOP_BAR.rawValue),
            NSAttributedStringKey.font: UIFont(name: "Friz Quadrata TT", size: 17)!
        ]
        
        self.navigationController?.navigationBar.barTintColor = UIColor(hex: rootclass.colors.FUNDO.rawValue)
        self.navigationController?.navigationBar.titleTextAttributes = attnav
        self.title = "Runes"
    }
    
    func spopViewController(){
        self.navigationController?.popViewController(animated: true)
    }
    
    func resizeCell(cell:runesTVCC, indexPath: IndexPath){
        let width = cell.desc.frame.size.width
        let newsize = cell.desc.sizeThatFits(CGSize(width: width, height: CGFloat(MAXFLOAT)))
        var newframe = cell.desc.frame
        
        newframe.size = CGSize(width: CGFloat(fmaxf(Float(newsize.width), Float(width))), height: newsize.height)
        cell.desc.frame = newframe
        
        if cell.desc.frame.size.height < 47 {
            self.sizesDesc[indexPath.row] = Int(120)
        } else {
            self.sizesDesc[indexPath.row] = Int((120 + (cell.desc.frame.size.height - 47)))
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if langAtu != rootclass.lol.language {
            self.runes = rt.listStaticRunesReforged.sorted(by: { $0.name < $1.name })
            self.tableView.reloadData()
            langAtu = rootclass.lol.language
        }
    }
}
