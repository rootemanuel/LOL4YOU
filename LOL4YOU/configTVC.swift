//
//  configTVC.swift
//  LOL4YOU
//
//  Created by Emanuel Root on 07/01/2018.
//  Copyright © 2018 Emanuel Root. All rights reserved.
//

import UIKit
import SVProgressHUD
import ActionSheetPicker_3_0
import GoogleMobileAds
import FirebaseAnalytics

class configTVC: UITableViewController, GADBannerViewDelegate {

    @IBOutlet weak var btnLanguage: UIButton!
    
    let rt = rootclass.sharedInstance
    var champ = rootclass.staticchampions()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initView()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    @IBAction func btnLanguageSelect(_ sender: Any) {
        
        let servers = ["Czech (Czech Republic)",
                       "Italian (Italy)",
                       "German (Germany)",
                       "Japanese (Japan)",
                       "Greek (Greece)",
                       "Korean (Korea)",
                       "English (Australia)",
                       "Malay (Malaysia)",
                       "English (United Kingdom)",
                       "Polish (Poland)",
                       "English (Republic of the Philippines)",
                       "Portuguese (Brazil)",
                       "English (Poland)",
                       "Romanian (Romania)",
                       "English (Singapore)",
                       "Russian (Russia)",
                       "English (United States)",
                       "Thai (Thailand)",
                       "Spanish (Argentina)",
                       "Turkish (Turkey)",
                       "Spanish (Spain)",
                       "Vietnamese (Viet Nam)",
                       "Spanish (Mexico)",
                       "Chinese (China)",
                       "French (France)",
                       "Chinese (Malaysia)",
                       "Hungarian (Hungary)",
                       "Chinese (Taiwan)",
                       "Indonesian (Indonesia)"]
        
        let acp = ActionSheetStringPicker(title: "Server", rows: servers, initialSelection: 0, doneBlock: {
            picker, value, index in
            
            switch value {
            case 0:
                rootclass.lol.language = "cs_CZ"
                rootclass.lol.language_description = "Czech (Czech Republic)"
            case 1:
                rootclass.lol.language = "it_IT"
                rootclass.lol.language_description = "Italian (Italy)"
            case 2:
                rootclass.lol.language = "de_DE"
                rootclass.lol.language_description = "German (Germany)"
            case 3:
                rootclass.lol.language = "ja_JP"
                rootclass.lol.language_description = "Japanese (Japan)"
            case 4:
                rootclass.lol.language = "el_GR"
                rootclass.lol.language_description = "Greek (Greece)"
            case 5:
                rootclass.lol.language = "ko_KR"
                rootclass.lol.language_description = "Korean (Korea)"
            case 6:
                rootclass.lol.language = "en_AU"
                rootclass.lol.language_description = "English (Australia)"
            case 7:
                rootclass.lol.language = "ms_MY"
                rootclass.lol.language_description = "Malay (Malaysia)"
            case 8:
                rootclass.lol.language = "en_GB"
                rootclass.lol.language_description = "English (United Kingdom)"
            case 9:
                rootclass.lol.language = "pl_PL"
                rootclass.lol.language_description = "Polish (Poland)"
            case 10:
                rootclass.lol.language = "en_PH"
                rootclass.lol.language_description = "English (Republic of the Philippines)"
            case 11:
                rootclass.lol.language = "pt_BR"
                rootclass.lol.language_description = "Portuguese (Brazil)"
            case 12:
                rootclass.lol.language = "en_PL"
                rootclass.lol.language_description = "English (Poland)"
            case 13:
                rootclass.lol.language = "ro_RO"
                rootclass.lol.language_description = "Romanian (Romania)"
            case 14:
                rootclass.lol.language = "en_SG"
                rootclass.lol.language_description = "English (Singapore)"
            case 15:
                rootclass.lol.language = "ru_RU"
                rootclass.lol.language_description = "Russian (Russia)"
            case 16:
                rootclass.lol.language = "en_US"
                rootclass.lol.language_description = "English (United States)"
            case 17:
                rootclass.lol.language = "th_TH"
                rootclass.lol.language_description = "Thai (Thailand)"
            case 18:
                rootclass.lol.language = "es_AR"
                rootclass.lol.language_description = "Spanish (Argentina)"
            case 19:
                rootclass.lol.language = "tr_TR"
                rootclass.lol.language_description = "Turkish (Turkey)"
            case 20:
                rootclass.lol.language = "es_ES"
                rootclass.lol.language_description = "Spanish (Spain)"
            case 21:
                rootclass.lol.language = "vn_VN"
                rootclass.lol.language_description = "Vietnamese (Viet Nam)"
            case 22:
                rootclass.lol.language = "es_MX"
                rootclass.lol.language_description = "Spanish (Mexico)"
            case 23:
                rootclass.lol.language = "zh_CN"
                rootclass.lol.language_description = "Chinese (China)"
            case 24:
                rootclass.lol.language = "fr_FR"
                rootclass.lol.language_description = "French (France)"
            case 25:
                rootclass.lol.language = "zh_MY"
                rootclass.lol.language_description = "Chinese (Malaysia)"
            case 26:
                rootclass.lol.language = "hu_HU"
                rootclass.lol.language_description = "Hungarian (Hungary)"
            case 27:
                rootclass.lol.language = "zh_TW"
                rootclass.lol.language_description = "Chinese (Taiwan)"
            case 28:
                rootclass.lol.language = "id_ID"
                rootclass.lol.language_description = "Indonesian (Indonesia)"
            default:
                rootclass.lol.language = "en_US"
                rootclass.lol.language_description = "English (United States)"
            }
            
            SVProgressHUD.show()
            
            let defaults:UserDefaults = UserDefaults.standard
            defaults.set(rootclass.lol.language, forKey: "language")
            defaults.set(rootclass.lol.language_description, forKey: "language_description")
            
            self.rt.carregarChampionsLocal()
            self.rt.carregarSpellsLocal()
            
            SVProgressHUD.dismiss()
            
            self.btnLanguage.setTitle(rootclass.lol.language_description as! String?, for: .normal)
            self.view.endEditing(true)
            
            return
            
        }, cancel: {
            ActionStringCancelBlock in return
            self.view.endEditing(true)
        }, origin: sender)
        
        let textTitleAtributes = [
            NSForegroundColorAttributeName: UIColor(hex:rootclass.colors.TEXTO_TOP_BAR.rawValue),
            NSFontAttributeName: UIFont(name: "Friz Quadrata TT", size: 17)!
        ]
        
        let pickerTextAttributes:NSMutableDictionary = [NSForegroundColorAttributeName:UIColor(hex:rootclass.colors.FUNDO.rawValue),
                                                        NSFontAttributeName: UIFont(name: "Friz Quadrata TT", size: 15)!]
        
        let btDone = UIButton.init(type: .custom)
        btDone.setTitle("Done", for: .normal)
        btDone.setTitleColor(UIColor(hex:rootclass.colors.TEXTO_VITORIA.rawValue), for: .normal)
        btDone.frame = CGRect(x: 0, y: 0, width: 60, height: 30)
        btDone.titleLabel!.font = UIFont(name: "Friz Quadrata TT", size: 15)!
        let btBarDone = UIBarButtonItem(customView: btDone)
        
        let btCancel = UIButton.init(type: .custom)
        btCancel.setTitle("Cancel", for: .normal)
        btCancel.setTitleColor(UIColor(hex:rootclass.colors.TEXTO_DERROTA.rawValue), for: .normal)
        btCancel.frame = CGRect(x: 0, y: 0, width: 60, height: 30)
        btCancel.titleLabel!.font = UIFont(name: "Friz Quadrata TT", size: 15)!
        let btBarCancel = UIBarButtonItem(customView: btCancel)
        
        acp!.titleTextAttributes = textTitleAtributes
        acp!.pickerTextAttributes = pickerTextAttributes
        acp!.toolbarBackgroundColor = UIColor(hex:rootclass.colors.FUNDO.rawValue)
        acp!.toolbarButtonsColor = UIColor(hex:rootclass.colors.FUNDO_CLARO.rawValue)
        
        acp!.setDoneButton(btBarDone)
        acp!.setCancelButton(btBarCancel)
        
        acp!.show()
        
    }
    
    func initView(){
        let attnav = [
            NSForegroundColorAttributeName: UIColor(hex:rootclass.colors.TEXTO_TOP_BAR.rawValue),
            NSFontAttributeName: UIFont(name: "Friz Quadrata TT", size: 17)!
        ]
        
        self.navigationController?.navigationBar.barTintColor = UIColor(hex: rootclass.colors.FUNDO.rawValue)
        self.navigationController?.navigationBar.titleTextAttributes = attnav
        self.title = "Config"
        
        if let language_description:String = rootclass.lol.language_description {
            self.btnLanguage.setTitle(language_description as! String?, for: .normal)
        }
    }
    
    override func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        self.view.endEditing(true)
    }
    
    func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
}
