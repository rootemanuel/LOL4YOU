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

        let champ = rt.listaChamp(id: statsdet.championID)
        
        self.title = champ.name
        
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
        self.champ.image = UIImage(named: "champion_\(champ.key)")
        
        self.wins.text = statsdet.win
        self.losses.text = statsdet.loss
        self.kda.text = "\(statsdet.kills)/\(statsdet.deaths)/\(statsdet.assists)"
        self.gold.text = statsdet.gold
        self.minion.text = statsdet.creeps
        
        self.dkill.text = statsdet.doublekill
        self.tkill.text = statsdet.triplekill
        self.qkill.text = statsdet.quadrakill
        self.pkill.text = statsdet.pentakill
        self.turretsk.text = statsdet.turretskilled
        self.firstblood.text = statsdet.firstblood
        
        SVProgressHUD.dismiss()
    }
}
