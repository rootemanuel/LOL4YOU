//
//  runesTVC.swift
//  LOL4YOU
//
//  Created by Emanuel Root on 28/04/17.
//  Copyright © 2017 Emanuel Root. All rights reserved.
//

import UIKit
import SVProgressHUD

class runesTVC: UITableViewController {
    
    var emptytableview:emptytableview? = nil
    var runes = Array<rootclass.BERunes>()
    let rt = rootclass.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()

        self.initView()
        self.loadingView()
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "runesdet") as! runesdetTVC
        
        let slots = self.runes[indexPath.row].slots
        var runesvc = Array<rootclass.BERune>()
        
        var runeidant = 0
        for i in 0 ..< slots.count {
            if runeidant != slots[i].runeId {
                let r = rootclass.BERune()
                let runeaux = slots.filter{p in p.runeId == slots[i].runeId}
                
                if runeaux.count > 0 {
                    r.runeId = slots[i].runeId
                    r.rank = runeaux.count
                    runesvc.append(r)
                }
                
                runeidant = slots[i].runeId
            }
        }
        
        vc.title = runes[indexPath.row].name
        vc.runesdet = runesvc
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("infoTVCC", owner: self, options: nil)?.first as! infoTVCC
        
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.item.text = runes[indexPath.row].name
        if runes[indexPath.row].current {
            cell.valor.text = "CURRENT"
            cell.valor.textColor = UIColor(hex: rootclass.colors.TEXTO_VITORIA.rawValue)
        } else {
            cell.valor.isHidden = true
        }
        
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
        return 44
    }
    
    func loadingView() {
        SVProgressHUD.show()
        
        rt.listarRunes() {(runes) in
            if runes.count > 0 {
                self.runes = runes
                self.tableView.reloadData()
                SVProgressHUD.dismiss()
            } else {
                self.initemptytableview()
                SVProgressHUD.dismiss()
            }
        }
    }
    
    func initemptytableview() {
        emptytableview = Bundle.main.loadNibNamed("emptytableview", owner: self, options: nil)?.first as? emptytableview
        self.tableView.backgroundView = emptytableview
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
        self.title = "Runes"
    }
    
    func spopViewController(){
        self.navigationController?.popViewController(animated: true)
    }
}
