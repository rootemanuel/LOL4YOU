//
//  champmasteryVC.swift
//  LOL4YOU
//
//  Created by Emanuel Root on 17/09/17.
//  Copyright © 2017 Emanuel Root. All rights reserved.
//

import UIKit
import SVProgressHUD
import SDWebImage
import GoogleMobileAds
import FirebaseAnalytics

class champmasteryVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let admob = rootadmob.sharedInstance
    let rt = rootclass.sharedInstance
    
    var listStaticChampMastery = Array<rootclass.staticchampmastery>()

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initAdMob()
        self.initView()
        self.loadingView()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listStaticChampMastery.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: championmasteryCVC = collectionView.dequeueReusableCell(withReuseIdentifier: "cellchampmastery", for: indexPath) as! championmasteryCVC
        
        let champaux = self.listStaticChampMastery[indexPath.row]
        let champ = rt.listaChamp(id: champaux.championId)
        
        cell.txtchampoints.text = "\(champaux.championPoints)"
        cell.imgchamp.sd_setImage(with: URL(string: "\(rootclass.images.champion)\(champ.imagefull)"), placeholderImage: UIImage(named: "static_null_all"))
        cell.imgchampmold.image = UIImage(named: "static_mastery_mold_\(champaux.championLevel)")
        
        return cell
    }
    
    func initView(){
        
        let attnav = [
            NSAttributedStringKey.foregroundColor: UIColor(hex:rootclass.colors.TEXTO_TOP_BAR.rawValue),
            NSAttributedStringKey.font: UIFont(name: "Friz Quadrata TT", size: 17)!
        ]
        
        let button = UIButton.init(type: .custom)
        button.setImage(UIImage(named:"static_button_back"), for: UIControlState.normal)
        button.addTarget(self, action:#selector(spopViewController), for: UIControlEvents.touchUpInside)
        button.frame = CGRect.init(x: 0, y: 0, width: 30, height: 30)
        let barButton = UIBarButtonItem.init(customView: button)
        self.navigationItem.leftBarButtonItem = barButton
        
        self.navigationController?.navigationBar.barTintColor = UIColor(hex: rootclass.colors.FUNDO.rawValue)
        self.navigationController?.navigationBar.titleTextAttributes = attnav
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 90, height: 125)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        self.automaticallyAdjustsScrollViewInsets = false
        self.collectionView.collectionViewLayout = layout
        
        self.listStaticChampMastery = rt.listStaticChampMastery
        
        self.title = "Champion Mastery"
    }
    
    func initAdMob() {
        Analytics.setScreenName(rootclass.screens.masteryschamp, screenClass: String(describing: champmasteryVC.self))
    }
    
    @objc func spopViewController(){
        self.navigationController?.popViewController(animated: true)
    }
    
    func loadingView(){
        if self.listStaticChampMastery.count == 0 {
            let emptytableview = Bundle.main.loadNibNamed("emptytableview", owner: self, options: nil)?.first as? emptytableview
            self.view = emptytableview
        }
    }
}
