//
//  matchesdetTVC.swift
//  LOL4YOU
//
//  Created by Emanuel Root on 23/04/17.
//  Copyright © 2017 Emanuel Root. All rights reserved.
//

import UIKit
import SVProgressHUD

class matchesdetTVC: UITableViewController {

    @IBOutlet weak var tableWinningTeam: UITableView!
    @IBOutlet weak var tableLosingTeam: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initView()
        self.loadingView()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        } else {
            return 2
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let lmatchesdet = tableView.dequeueReusableCell(withIdentifier: "matchesdetcell", for: indexPath as IndexPath) as! matchesdetTVCC
        
        if tableView == self.tableLosingTeam {
            lmatchesdet.summonername.text = "TESTE"
        } else {
            lmatchesdet.summonername.text = "TESTE"
        }
        
        return lmatchesdet
    }
    
    func loadingView() {
        
        SVProgressHUD.show()
        
        
        
        SVProgressHUD.dismiss()
    }
    
    func initView(){
        let attnav = [
            NSForegroundColorAttributeName: UIColor(hex:rootclass.colors.TEXTO_TOP_BAR.rawValue),
            NSFontAttributeName: UIFont(name: "Friz Quadrata TT", size: 15)!
        ]
        
        let button = UIButton.init(type: .custom)
        button.setImage(UIImage(named:"static_button_back"), for: UIControlState.normal)
        button.addTarget(self, action:#selector(spopViewController), for: UIControlEvents.touchUpInside)
        button.frame = CGRect.init(x: 0, y: 0, width: 30, height: 30)
        let barButton = UIBarButtonItem.init(customView: button)
        self.navigationItem.leftBarButtonItem = barButton
        
        self.navigationController?.navigationBar.barTintColor = UIColor(hex: rootclass.colors.FUNDO.rawValue)
        self.navigationController?.navigationBar.titleTextAttributes = attnav
    }
    
    func spopViewController(){
        self.navigationController?.popViewController(animated: true)
    }
}
