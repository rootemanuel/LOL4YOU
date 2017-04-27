//
//  statsdetTVC.swift
//  LOL4YOU
//
//  Created by Emanuel Root on 12/04/17.
//  Copyright © 2017 Emanuel Root. All rights reserved.
//

import UIKit
import SVProgressHUD

class statsdetTVC: UITableViewController {
    
    var rt = rootclass.sharedInstance
    
    var statsdet = rootclass.BEStats()
    
    @IBOutlet weak var champ: UIImageView!
    
    @IBOutlet weak var wins: UILabel!
    @IBOutlet weak var losses: UILabel!
    @IBOutlet weak var kda: UILabel!
    @IBOutlet weak var gold: UILabel!
    @IBOutlet weak var minion: UILabel!

    @IBOutlet weak var dkill: UILabel!
    @IBOutlet weak var tkill: UILabel!
    @IBOutlet weak var qkill: UILabel!
    @IBOutlet weak var pkill: UILabel!
    @IBOutlet weak var turretsk: UILabel!
    @IBOutlet weak var firstblood: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        self.initView()
        self.loadingView()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 5
        } else {
            return 6
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func loadingView() {
        
        SVProgressHUD.show()
        
        let champ = rt.listaChamp(id: statsdet.championID)
        self.champ.image = UIImage(named: champ.imagefull)
        self.champ.layer.borderWidth = 2
        self.champ.layer.borderColor = UIColor(hex: rootclass.colors.BORDA_BRILHANTE.rawValue).cgColor

        
        self.wins.text = statsdet.win
        self.losses.text = statsdet.loss
        self.kda.text = "\(statsdet.kills)/\(statsdet.deaths)/\(statsdet.assists)"
        self.minion.text = statsdet.creeps
        
        if statsdet.gold >= 1000 {
            self.gold.text = String(format:"%.1f K", Double(statsdet.gold) / Double(1000))
        } else {
            self.gold.text = String(format:"%.1f K", Double(statsdet.gold))
        }
        
        
        self.dkill.text = statsdet.doublekill
        self.tkill.text = statsdet.triplekill
        self.qkill.text = statsdet.quadrakill
        self.pkill.text = statsdet.pentakill
        self.turretsk.text = statsdet.turretskilled
        self.firstblood.text = statsdet.firstblood
        
        SVProgressHUD.dismiss()
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
        
        let champ = rt.listaChamp(id: statsdet.championID)
        self.title = champ.name
    }
    
    func spopViewController(){
        self.navigationController?.popViewController(animated: true)
    }
}
