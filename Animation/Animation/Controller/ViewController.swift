//
//  ViewController.swift
//  Animation
//
//  Created by Trung Kiên on 8/2/18.
//  Copyright © 2018 Trung Kiên. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblTitle: UILabel!
    var a : Int = 4
    var b : Int = 5
    var c : Int = 0
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtUsername: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        lblTitle.center.x -= view.bounds.width
        txtUsername.center.x -= view.bounds.width
        txtPassword.center.x -= view.bounds.width
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillDisappear(true)
//        UIView.animate(withDuration: 0.5) {
//            self.lblTitle.center.x += self.view.bounds.width
//        }
//        UIView.animate(withDuration: 0.5, delay: 0.3, options: [],
//                       animations: {
//                        self.txtUsername.center.x += self.view.bounds.width
//        },
//                       completion: nil
//        )
//        UIView.animate(withDuration: 0.5, delay: 0.4, options: [],
//                       animations: {
//                        self.txtPassword.center.x += self.view.bounds.width
//        },
//                       completion: nil
//        )
//        UIView.animate(withDuration: 0.5, delay: 0.4,
//                       options: .repeat,
//                       animations: {
//                        self.txtPassword.center.x += self.view.bounds.width
//        },
//                       completion: nil
//        )
        
//        UIView.animate(withDuration: 0.5, delay: 0.3,
//                       options: [.repeat, .autoreverse],
//                       animations: {
//                        self.txtPassword.center.x += self.view.bounds.width
//        },
//                       completion: nil
//        )
        
        UIView.animate(withDuration: 0.5, delay: 0.4,
                       options: [.repeat, .autoreverse, .curveEaseOut],
                       animations: {
                        self.txtPassword.center.x += self.view.bounds.width
        },
                       completion: nil
        )
//        UIView.animate(withDuration: 0.5, delay: 0.4, options: [],
//                       animations: {
//                        self.txtPassword.center.x += self.view.bounds.width
//        },
//                       completion: nil
//        )
    }
    @IBAction func onLogin(_ sender: Any) {
       
    }
    
}
