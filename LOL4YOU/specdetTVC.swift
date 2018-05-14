//
//  specdetTVC.swift
//  LOL4YOU
//
//  Created by Emanuel Root on 11/10/17.
//  Copyright © 2017 Emanuel Root. All rights reserved.
//

import UIKit
import GoogleMobileAds
import FirebaseAnalytics

class specdetTVC: UITableViewController, GADBannerViewDelegate {

    //var sections = ["Runes","Masterys"]
    var sections = ["Runes"]
    var sizes = [0,0,0,0,0,0]
    
    let rt = rootclass.sharedInstance
    
    var participant = rootclass.BEParticipants()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initAdMob()
        self.initView()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            //Runes
            let cell = Bundle.main.loadNibNamed("runesTVCC", owner: self, options: nil)?.first as! runesTVCC
            
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            
            let rune = rt.listaRuneReforged(id: participant.runes[indexPath.row])
            cell.name.text = rune.name
            cell.desc.text = rune.longDesc
            
            resizeCell(cell: cell, indexPath: indexPath)
            cell.imgrune.sd_setImage(with: URL(string: "\(rune.imagelink)"), placeholderImage: UIImage(named: "static_null_all"))
            cell.imgrune.layer.borderWidth = 1
            cell.imgrune.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_BRILHANTE.rawValue).cgColor
            
            return cell
//        case 1:
//            //Masterys
//            let cell = Bundle.main.loadNibNamed("masteryTVCC", owner: self, options: nil)?.first as! masteryTVCC
//
//            cell.selectionStyle = UITableViewCellSelectionStyle.none
//
//            let mast = rt.listaMastery(id: participant.masterys[indexPath.row].masteryId)
//            let count = participant.masterys[indexPath.row].rank
//
//            cell.img.sd_setImage(with: URL(string: mast.imagelink), placeholderImage: UIImage(named: "static_null"))
//            cell.img.layer.borderWidth = 1
//            cell.img.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_BRILHANTE.rawValue).cgColor
//            cell.qtd.text = "x \(participant.masterys[indexPath.row].rank)"
//            cell.desc.text =  mast.description[ count - 1]
//            cell.name.text = mast.name
//
//            return cell
        default:
            let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
            
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            
            return cell
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return participant.runes.count
//        case 1:
//            return participant.masterys.count
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.backgroundColor = UIColor(hex: rootclass.colors.FUNDO_CLARO.rawValue)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let cell = self.tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerTVH")
        let cheader = cell as! headerTVH
        
        cheader.header.text = sections[section]
        cheader.header.backgroundColor = UIColor(hex: rootclass.colors.FUNDO_CLARO.rawValue)
        cheader.contentView.backgroundColor = UIColor(hex: rootclass.colors.FUNDO_CLARO.rawValue)
        cell?.backgroundView?.backgroundColor = UIColor(hex: rootclass.colors.FUNDO_CLARO.rawValue)
        cell?.backgroundColor = UIColor(hex: rootclass.colors.FUNDO_CLARO.rawValue)
        
        return cheader
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return CGFloat(self.sizes[indexPath.row])
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "."
    }
    
    func initAdMob() {
        Analytics.setScreenName(rootclass.screens.spectadordet, screenClass: String(describing: specdetTVC.self))
        
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
        
        let nib = UINib(nibName: "headerTVH", bundle: nil)
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: "headerTVH")
        
        self.navigationController?.navigationBar.barTintColor = UIColor(hex: rootclass.colors.FUNDO.rawValue)
        self.navigationController?.navigationBar.titleTextAttributes = attnav
    }
    
    func resizeCell(cell:runesTVCC, indexPath: IndexPath){
        let width = cell.desc.frame.size.width
        let newsize = cell.desc.sizeThatFits(CGSize(width: width, height: CGFloat(MAXFLOAT)))
        var newframe = cell.desc.frame
        
        newframe.size = CGSize(width: CGFloat(fmaxf(Float(newsize.width), Float(width))), height: newsize.height)
        cell.desc.frame = newframe
        
        if cell.desc.frame.size.height < 47 {
            self.sizes[indexPath.row] = Int(120)
        } else {
            self.sizes[indexPath.row] = Int((120 + (cell.desc.frame.size.height - 47)))
        }
    }
    
    func spopViewController(){
        self.navigationController?.popViewController(animated: true)
    }
}
