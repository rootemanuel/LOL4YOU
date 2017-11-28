//
//  championsVC.swift
//  LOL4YOU
//
//  Created by Emanuel Root on 25/11/17.
//  Copyright © 2017 Emanuel Root. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class championsVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let admob = rootadmob.sharedInstance
    let rt = rootclass.sharedInstance
    var champions = Array<rootclass.staticchampions>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initView()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.champions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let champ = self.champions[indexPath.row]
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "champions") as! championsTVC
        
        vc.champ = champ
        
        self.navigationController?.pushViewController(vc, animated: true) 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: championsCVC = collectionView.dequeueReusableCell(withReuseIdentifier: "cellChampions", for: indexPath) as! championsCVC
        
        let champ = champions[indexPath.row]
        
        cell.lblChamNome.text = champ.name
        cell.imgChamp.sd_setImage(with: URL(string: "\(rootclass.images.champion)\(champ.imagefull)"), placeholderImage: UIImage(named: "static_null_all"))
        cell.imgChamp.layer.borderWidth = 1
        cell.imgChamp.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_BRILHANTE.rawValue).cgColor
        
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
        self.title = "Champions"

        self.champions = rt.listStaticChamp.sorted(by: { $0.name < $1.name })
        
        let videoURL = URL(string: "https://d28xe8vt774jo5.cloudfront.net/champion-abilities/0024/ability_0024_P1.webm")
    }
}
