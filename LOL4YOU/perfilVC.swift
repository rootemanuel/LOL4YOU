//
//  perfilVC.swift
//  LOL4YOU
//
//  Created by Emanuel Root on 17/04/17.
//  Copyright © 2017 Emanuel Root. All rights reserved.
//

import UIKit

class perfilVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    
    @IBOutlet weak var queue: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var imgTier: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    struct menu {
        var title:String
        var image:String
    }
    
    let menus = [
        menu.init(title: "Stats", image: "static_menu_stats")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
                if indexPath.item == 0 {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "stats") as! statsTVC
                    
                    self.navigationController?.pushViewController(vc, animated: true)
                } //else if indexPath.item == 1 {
        //            let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //            let vc = storyboard.instantiateViewControllerWithIdentifier("listacriancas") as! criancasTVC
        //
        //            self.navigationController?.pushViewController(vc, animated: true)
        //        } else if indexPath.item == 2 {
        //            let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //            let vc = storyboard.instantiateViewControllerWithIdentifier("listamensagens") as! mensagensTVC
        //
        //            self.navigationController?.pushViewController(vc, animated: true)
        //        } else if indexPath.item == 3 {
        //            let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //            let vc = storyboard.instantiateViewControllerWithIdentifier("listacondutores") as! condutoresTVC
        //
        //            self.navigationController?.pushViewController(vc, animated: true)
        //            /*}else if indexPath.item == 4 {
        //             let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //             let vc = storyboard.instantiateViewControllerWithIdentifier("menubairro") as! menubairroTVC
        //
        //             self.navigationController?.pushViewController(vc, animated: true)*/
        //        }else if indexPath.item == 4 {
        //            let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //            let vc = storyboard.instantiateViewControllerWithIdentifier("minhaconta") as! minhacontaTVC
        //
        //            self.navigationController?.pushViewController(vc, animated: true)
        //        }else if indexPath.item == 5 {
        //            let activityImg = UIImage(named: "marca_transkids_logo")
        //            let activityItem = "Conectando pais de alunos ao transporte escolar de formar fácil e rápida. Baixe já: http://bit.ly/1RswM82 ou acesse: www.transkidsapp.com.br"
        //
        //            var activityItems: [AnyObject]?
        //            let image = UIImage(named: "facebook")
        //
        //            activityItems = [activityItem, image!]
        //
        //            let activityController = UIActivityViewController(activityItems:
        //                activityItems!, applicationActivities: nil)
        //            self.presentViewController(activityController, animated: true,
        //                                       completion: nil)
        //        }else if indexPath.item == 6 {
        //            let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //            let vc = storyboard.instantiateViewControllerWithIdentifier("listaajuda") as! ajudaTVC
        //
        //            self.navigationController?.pushViewController(vc, animated: true)
        //        }
    }
}
