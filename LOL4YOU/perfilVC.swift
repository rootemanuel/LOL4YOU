//
//  perfilVC.swift
//  LOL4YOU
//
//  Created by Emanuel Root on 17/04/17.
//  Copyright © 2017 Emanuel Root. All rights reserved.
//

import UIKit

class perfilVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,UIScrollViewDelegate {
    
    @IBOutlet weak var queue: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var imgTier: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var rt = rootclass.sharedInstance
    
    struct menu {
        var title:String
        var image:String
    }
    
    let menus = [
        menu.init(title: "Stats", image: "static_menu_stats")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = rootclass.Summoner.name
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
        
        if indexPath.item == 0 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "stats") as! statsTVC
                    
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
