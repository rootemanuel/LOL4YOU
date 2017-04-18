//
//  matchesTVC.swift
//  LOL4YOU
//
//  Created by Emanuel Root on 18/04/17.
//  Copyright © 2017 Emanuel Root. All rights reserved.
//

import UIKit
import SVProgressHUD

class matchesTVC: UITableViewController {

    var rt = rootclass.sharedInstance
    
    var matchs = Array<rootclass.BEMatch>()
    var emptytableview:emptytableview? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initView()
        self.loadingView()
        
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "statsdet") as! statsdetTVC
//        
//        vc.statsdet = stats[indexPath.row]
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let lstats = tableView.dequeueReusableCell(withIdentifier: "statscell", for: indexPath as IndexPath) as! statsTVCC
        
        self.stats = matchs[indexPath.row].participants.filter { p in p.championID == $0. }
        
        lstats.win.text = stats[indexPath.row].win
        lstats.loss.text = stats[indexPath.row].loss
        lstats.kda.text = "\(stats[indexPath.row].kills)/\(stats[indexPath.row].deaths)/\(stats[indexPath.row].assists)"
        lstats.minion.text = stats[indexPath.row].creeps
        lstats.gold.text = stats[indexPath.row].gold
        
        let champ = rt.listaChamp(id: stats[indexPath.row].championID)
        lstats.lblChamp.text = champ.name
        lstats.imgChamp.image = UIImage(named: "champion_\(champ.key)")
        
        return lstats
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numOfSections: Int = 0
        
        if matchs.count > 0 {
            numOfSections = matchs.count
            tableView.separatorStyle = .singleLine
            tableView.backgroundView?.isHidden = true
        } else {
            tableView.separatorStyle = .none
            tableView.backgroundView?.isHidden = false
        }
        
        return numOfSections
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func loadingView() {
        
        SVProgressHUD.show()
        
        rt.listarMatchDet(matchid:1062956272) {(matchdet) in
            
            self.matchs = matchdet
            self.initemptytableview()
            self.tableView.reloadData()
            SVProgressHUD.dismiss()
        }
    }
    
    func initemptytableview() {
        emptytableview = Bundle.main.loadNibNamed("emptytableview", owner: self, options: nil)?.first as? emptytableview
        self.tableView.backgroundView = emptytableview
    }
    
    func initView(){
        self.title = "Matches"
    }
}
