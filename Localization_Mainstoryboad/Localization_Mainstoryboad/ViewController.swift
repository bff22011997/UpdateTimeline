//
//  ViewController.swift
//  Localization_Mainstoryboad
//
//  Created by Trung Kiên on 7/26/18.
//  Copyright © 2018 Trung Kiên. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblName.text = NSLocalizedString("txtName", comment: "Tên")
        lblAge.text = NSLocalizedString("txtAge", comment: "Tuổi")
    }

    @IBAction func onEnglish(_ sender: Any) {
        let path = Bundle.main.path(forResource: "en", ofType: "lproj")
        let bul = Bundle.init(path : path!)! as Bundle
        lblName.text = bul.localizedString(forKey: "txtName", value: nil, table: nil)
        lblAge.text = bul.localizedString(forKey: "txtAge", value: nil, table: nil)
    }
    
    @IBAction func onVietnam(_ sender: Any) {
        let path = Bundle.main.path(forResource: "vi", ofType: "lproj")
        let bul = Bundle.init(path : path!)! as Bundle
        lblName.text = bul.localizedString(forKey: "txtName", value: nil, table: nil)
        lblAge.text = bul.localizedString(forKey: "txtAge", value: nil, table: nil)
    }
    

}

