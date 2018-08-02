//
//  ViewController.swift
//  Localizable_Xib
//
//  Created by Trung Kiên on 7/26/18.
//  Copyright © 2018 Trung Kiên. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblAge: UILabel!
    var checkLanguage : Double = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLanguage = UserDefaults.standard.double(forKey: "checkLanguage")
        if checkLanguage == 1 {
            let path = Bundle.main.path(forResource: "en", ofType: "lproj")
            let bul = Bundle.init(path : path!)! as Bundle
            lblName.text = bul.localizedString(forKey: "txtName", value: nil, table: nil)
            lblAge.text = bul.localizedString(forKey: "txtAge", value: nil, table: nil)
        }
        else  if checkLanguage == 2 {
            let path = Bundle.main.path(forResource: "vi", ofType: "lproj")
            let bul = Bundle.init(path : path!)! as Bundle
            lblName.text = bul.localizedString(forKey: "txtName", value: nil, table: nil)
            lblAge.text = bul.localizedString(forKey: "txtAge", value: nil, table: nil)
        }
        else {
            lblName.text = "Lable"
            lblAge.text = "Lable"
        }
        
    }
    @IBAction func onEngish(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "checkLanguage")
        UserDefaults.standard.set(1, forKey: "checkLanguage")
        let path = Bundle.main.path(forResource: "en", ofType: "lproj")
        let bul = Bundle.init(path : path!)! as Bundle
        lblName.text = bul.localizedString(forKey: "txtName", value: nil, table: nil)
        lblAge.text = bul.localizedString(forKey: "txtAge", value: nil, table: nil)
    }
    @IBAction func onVietname(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "checkLanguage")
        UserDefaults.standard.set(2, forKey: "checkLanguage")
        let path = Bundle.main.path(forResource: "vi", ofType: "lproj")
        let bul = Bundle.init(path : path!)! as Bundle
        lblName.text = bul.localizedString(forKey: "txtName", value: nil, table: nil)
        lblAge.text = bul.localizedString(forKey: "txtAge", value: nil, table: nil)
    }
    


}
