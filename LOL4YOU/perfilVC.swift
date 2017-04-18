//
//  perfilVC.swift
//  LOL4YOU
//
//  Created by Emanuel Root on 17/04/17.
//  Copyright © 2017 Emanuel Root. All rights reserved.
//

import UIKit

class perfilVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    
    @IBOutlet weak var pControl: UIPageControl!
    @IBOutlet weak var slideScrollView: UIScrollView!
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
        
        self.slideScrollView.isPagingEnabled = true
        self.slideScrollView.showsVerticalScrollIndicator = false
        self.slideScrollView.showsHorizontalScrollIndicator = true
        self.slideScrollView.delegate = self
        
        let perfils:[perfilV] = self.createPerfil()
        self.setupPerfil(slides: perfils)
        
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
    
    func createPerfil() -> [perfilV] {
        var rtn = Array<perfilV>()
        
        let perfil1:perfilV = Bundle.main.loadNibNamed("perfil", owner: self, options: nil)?.first as! perfilV
        
        let perfil2:perfilV = Bundle.main.loadNibNamed("perfil", owner: self, options: nil)?.first as! perfilV
        
        let perfil3:perfilV = Bundle.main.loadNibNamed("perfil", owner: self, options: nil)?.first as! perfilV
        
        perfil1.imgPerfil.image = UIImage(named: "tier_goldI")
        perfil1.lblPerfil.text = "Gold I"
        
        perfil2.imgPerfil.image = UIImage(named: "tier_goldII")
        perfil2.lblPerfil.text = "Gold II"
        
        perfil3.imgPerfil.image = UIImage(named: "tier_masterI")
        perfil3.lblPerfil.text = "Master"
        
        rtn.append(perfil1)
        rtn.append(perfil2)
        rtn.append(perfil3)
        
        self.pControl.numberOfPages = rtn.count
        
        return rtn
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / scrollView.frame.size.width
        
        self.pControl.currentPage = Int(page)
    }
    
    func setupPerfil(slides:[perfilV]){
        self.slideScrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 170)
        self.slideScrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: 170)
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: 170)
            slideScrollView.addSubview(slides[i])
        }
    }

}
