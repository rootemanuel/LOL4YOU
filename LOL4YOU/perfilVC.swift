//
//  perfilVC.swift
//  LOL4YOU
//
//  Created by Emanuel Root on 17/04/17.
//  Copyright © 2017 Emanuel Root. All rights reserved.
//

import UIKit
import SVProgressHUD

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
        menu.init(title: "Stats", image: "static_menu_stats"),
        menu.init(title: "Matches", image: "static_menu_stats")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initView()
        self.loadingView()
        
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
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "matches") as! matchesTVC
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func loadingView(){
        var slides = Array<perfilV>()
        
        SVProgressHUD.show()
  
        rt.listarLeague() {(league) in
            
            for i in 0 ..< league.count {
                
                let r = Bundle.main.loadNibNamed("perfil", owner: self, options: nil)?.first as! perfilV
                
                r.imgPerfil.image = UIImage(named: "tier_\(league[i].tier.lowercased())\(league[i].division)")
                r.lblPerfil.text = "\(league[i].tier) \(league[i].division)"
                
                slides.append(r)
            }
            
            self.slideScrollView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.slideScrollView.frame.height)
            self.slideScrollView.contentSize = CGSize(width: self.view.frame.width * CGFloat(slides.count), height: self.slideScrollView.frame.height)
            
            if slides.count == 0 {
                let r = Bundle.main.loadNibNamed("perfil", owner: self, options: nil)?.first as! perfilV
                
                r.imgPerfil.image = UIImage(named: "tier_unranked")
                r.lblPerfil.text = "Unranked"
                
                slides.append(r)
            }
            
            self.pControl.numberOfPages = slides.count
            
            for i in 0 ..< slides.count {
                slides[i].frame = CGRect(x: self.view.frame.width * CGFloat(i), y: 0, width: self.view.frame.width, height: self.slideScrollView.frame.height)
                self.slideScrollView.addSubview(slides[i])
            }
            
            SVProgressHUD.dismiss()
        }
    }
    
    func initView(){
        
        self.title = rootclass.Summoner.name
        
        self.slideScrollView.isPagingEnabled = true
        self.slideScrollView.showsVerticalScrollIndicator = false
        self.slideScrollView.showsHorizontalScrollIndicator = false
        self.slideScrollView.delegate = self
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / scrollView.frame.size.width
        self.pControl.currentPage = Int(page)
    }
}
