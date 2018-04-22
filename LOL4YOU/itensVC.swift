//
//  itensVC.swift
//  LOL4YOU
//
//  Created by Emanuel Root on 13/02/2018.
//  Copyright © 2018 Emanuel Root. All rights reserved.
//
import UIKit
import AVKit
import AVFoundation
import GoogleMobileAds
import FirebaseAnalytics

import UIKit

class itensVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, GADBannerViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let admob = rootadmob.sharedInstance
    let rt = rootclass.sharedInstance
    var itens = Array<rootclass.staticitem>()
    var langAtu = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initAdMob()
        self.initView()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.itens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = self.itens[indexPath.row]
        
        admob.addCountAdMobInterstitial();
        
        if admob.showAdMobInterstitial() {
            if let adMobInterstitial = admob.getAdInterstitial() {
                adMobInterstitial.present(fromRootViewController: self)
                return
            }
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "itensdetalhe") as! itensdetalheTVC

        vc.item = item

        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: itensCVC = collectionView.dequeueReusableCell(withReuseIdentifier: "cellItens", for: indexPath) as! itensCVC
        
        let item = itens[indexPath.row]
        
        cell.lblItemNome.text = item.name
        cell.imgItem.sd_setImage(with: URL(string: "\(item.imagelink)"), placeholderImage: UIImage(named: "static_null_all"))
        cell.imgItem.layer.borderWidth = 1
        cell.imgItem.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_BRILHANTE.rawValue).cgColor
        
        return cell
    }
    
    func initView(){
        let attnav = [
            NSForegroundColorAttributeName: UIColor(hex:rootclass.colors.TEXTO_TOP_BAR.rawValue),
            NSFontAttributeName: UIFont(name: "Friz Quadrata TT", size: 17)!
        ]
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.navigationController?.navigationBar.barTintColor = UIColor(hex: rootclass.colors.FUNDO.rawValue)
        self.navigationController?.navigationBar.titleTextAttributes = attnav
        self.title = "Items"
        
        self.carregarItens()
    }
    
    func carregarItens(){
        self.itens = Array<rootclass.staticitem>()
        self.itens = rt.listStaticItem.sorted(by: { $0.id < $1.id })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if langAtu != rootclass.lol.language {
            self.carregarItens()
            self.collectionView.reloadData()
            langAtu = rootclass.lol.language
        }
    }
    
    func initAdMob() {
        Analytics.setScreenName(rootclass.screens.itens, screenClass: String(describing: itensVC.self))
    }
}
