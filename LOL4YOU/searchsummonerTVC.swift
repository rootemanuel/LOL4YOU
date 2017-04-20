//
//  searchsummonerTVC.swift
//  LOL4YOU
//
//  Created by Emanuel Root on 16/04/17.
//  Copyright © 2017 Emanuel Root. All rights reserved.
//

import UIKit
import SVProgressHUD

class searchsummonerTVC: UITableViewController, UITextFieldDelegate  {

    @IBOutlet weak var srchsummoner: UIButton!
    @IBOutlet weak var summonernick: UITextField!
    @IBOutlet weak var summonerserver: UITextField!
    
    var rt = rootclass.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initView()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    @IBAction func btnsrchsummoner(_ sender: AnyObject) {
        SVProgressHUD.show()
        
        if summonernick.text != nil && (summonernick.text?.isEmpty)! {
            return
        }
        
        rt.listarSummoner(summonername: summonernick.text!.replacingOccurrences(of: " ", with: "")) {(error) in
            
            if error.id == 1 {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "perfil") as! perfilVC
                
                self.navigationController?.pushViewController(vc, animated: true)
            }
            SVProgressHUD.dismiss()
        }
    }
    
    func validadados(_ textField: UITextField) {
        
        if (self.summonernick.text?.isEmpty)! {
            self.srchsummoner.isEnabled = false
            self.srchsummoner.alpha = 0.5
            return
        }
//#R00T - RETIRAR
//        if (self.summonernick.text?.isEmpty)! {
//            self.btnsearch.isEnabled = false
//            self.btnsearch.alpha = 0.5
//            return
//        }
        
        self.srchsummoner.isEnabled = true
        self.srchsummoner.alpha = 1
        
    }
    
    func initView(){
        let attnav = [
            NSForegroundColorAttributeName: UIColor(hex:rootclass.colors.TEXTO_TOP_BAR.rawValue),
            NSFontAttributeName: UIFont(name: "Friz Quadrata TT", size: 15)!
        ]
        
        self.summonernick.delegate = self
        self.summonerserver.delegate = self
        
        self.title = "Search Summoner"
        self.summonernick.addTarget(self, action: #selector(validadados(_:)), for: .editingChanged)
        
        self.navigationController?.navigationBar.barTintColor = UIColor(hex: rootclass.colors.FUNDO.rawValue)
        self.navigationController?.navigationBar.titleTextAttributes = attnav
    }

}
