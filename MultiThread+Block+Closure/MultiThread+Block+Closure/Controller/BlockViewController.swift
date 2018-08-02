//
//  BlockViewController.swift
//  MultiThread+Block+Closure
//
//  Created by Trung Kiên on 7/25/18.
//  Copyright © 2018 Trung Kiên. All rights reserved.
//

import UIKit

class BlockViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

 
    }

    @IBAction func onClosure(_ sender: Any) {
        let closure  = ClosureViewController()
        navigationController?.pushViewController(closure, animated: true)
    }
    

}
