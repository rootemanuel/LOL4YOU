//
//  itensdetalheTVC.swift
//  LOL4YOU
//
//  Created by Emanuel Root on 14/02/2018.
//  Copyright © 2018 Emanuel Root. All rights reserved.
//

import UIKit
import GoogleMobileAds
import FirebaseAnalytics

class itensdetalheTVC: UITableViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITextViewDelegate, GADBannerViewDelegate {
    
    let rt = rootclass.sharedInstance
    var item = rootclass.staticitem()
    var sections = ["","Built by","Build"]
    
    @IBOutlet weak var itemDescLbl: UITextView!
    @IBOutlet weak var itemGoldLbl: UITextField!
    @IBOutlet weak var itemLbl: UITextField!
    @IBOutlet weak var itemImg: UIImageView!
    
    @IBOutlet weak var collectionItensPre: UICollectionView!
    @IBOutlet weak var collectionItensPos: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initAdMob()
        self.initView()
        self.initCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var count = 0
        
        if collectionView == collectionItensPre {
            count = self.item.into.count
        } else {
            count = self.item.from.count
        }
        
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: itensdetalheCVC = collectionView.dequeueReusableCell(withReuseIdentifier: "cellItensdetalhe", for: indexPath) as! itensdetalheCVC
        
        var item = ""
        
        if collectionView == collectionItensPre {
            item = self.item.into[indexPath.row]
        } else {
            item = self.item.from[indexPath.row]
        }
        
        if  !item.isEmpty {
            let item = rt.listaItem(id: Int(item)!)
            cell.lblItemNome.text = "\(item.gold.total)"
            cell.imgItem.sd_setImage(with: URL(string: "\(item.imagelink)"), placeholderImage: UIImage(named: "static_null_all"))
            cell.imgItem.layer.borderWidth = 1
            cell.imgItem.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_BRILHANTE.rawValue).cgColor
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
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
        
        self.collectionItensPre.delegate = self
        self.collectionItensPre.dataSource = self
        
        self.collectionItensPos.delegate = self
        self.collectionItensPos.dataSource = self
        
        self.itemDescLbl.delegate = self
        
        let nib = UINib(nibName: "headerTVH", bundle: nil)
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: "headerTVH")
        
        let principal = rt.listaItem(id: self.item.id)
        
        self.title = principal.name
        self.itemLbl.text = principal.name
        self.itemDescLbl.text = principal.description
        self.itemGoldLbl.text = "Buy: \(principal.gold.total) / Sell: \(principal.gold.sell)"
        
        self.itemImg.sd_setImage(with: URL(string: "\(item.imagelink)"), placeholderImage: UIImage(named: "static_null_all"))
        self.itemImg.layer.borderWidth = 1
        self.itemImg.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_BRILHANTE.rawValue).cgColor
        
    }
    
    func initAdMob() {
        Analytics.setScreenName(rootclass.screens.itensdetalhe, screenClass: String(describing: itensdetalheTVC.self))
        
        if rt.viewbanner {
            
            let adBannerView = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait)
            adBannerView.adUnitID = rootadmob.admob.admob_banner
            adBannerView.delegate = self
            adBannerView.rootViewController = self
            adBannerView.load(GADRequest())
            
            self.tableView.tableHeaderView = adBannerView
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let cell = self.tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerTVH")
        let cheader = cell as! headerTVH
        
        switch section {
        case 1:
            if self.item.from.count > 0 {
                cheader.header.text = sections[section]
                cheader.contentView.backgroundColor = UIColor(hex: rootclass.colors.TEXTO_VITORIA.rawValue)
                cheader.header.backgroundColor = UIColor(hex: rootclass.colors.TEXTO_VITORIA.rawValue)
                cheader.contentView.backgroundColor = UIColor(hex: rootclass.colors.TEXTO_VITORIA.rawValue)
                cell?.backgroundView?.backgroundColor = UIColor(hex: rootclass.colors.TEXTO_VITORIA.rawValue)
                cell?.backgroundColor = UIColor(hex: rootclass.colors.TEXTO_VITORIA.rawValue)
                
            } else {
                cheader.header.isHidden = true
            }
        case 2:
            if self.item.into.count > 0 {
                cheader.header.text = sections[section]
                cheader.contentView.backgroundColor = UIColor(hex: rootclass.colors.TEXTO_DERROTA.rawValue)
                cheader.header.backgroundColor = UIColor(hex: rootclass.colors.TEXTO_DERROTA.rawValue)
                cheader.contentView.backgroundColor = UIColor(hex: rootclass.colors.TEXTO_DERROTA.rawValue)
                cell?.backgroundView?.backgroundColor = UIColor(hex: rootclass.colors.TEXTO_DERROTA.rawValue)
                cell?.backgroundColor = UIColor(hex: rootclass.colors.TEXTO_DERROTA.rawValue)
            } else {
                cheader.header.isHidden = true
            }
        default:
            cheader.header.isHidden = true
        }
        return cheader
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            if self.itemDescLbl.frame.size.height < 43 {
                return 160
            }
            return 160 + (self.itemDescLbl.frame.size.height - 43)
        case 1:
            if self.item.from.count > 0 {
                return 100
            }
            return 0
        case 2:
            if self.item.into.count > 0 {
                return 100
            }
            return 0
        default:
            return 100
        }
    }
    
    func initCell() {
        let width = self.itemDescLbl.frame.size.width
        let newsize = self.itemDescLbl.sizeThatFits(CGSize(width: width, height: CGFloat(MAXFLOAT)))
        var newframe = self.itemDescLbl.frame
        
        newframe.size = CGSize(width: CGFloat(fmaxf(Float(newsize.width), Float(width))), height: newsize.height)
        self.itemDescLbl.frame = newframe
    }
    
    func spopViewController(){
        self.navigationController?.popViewController(animated: true)
    }
}

