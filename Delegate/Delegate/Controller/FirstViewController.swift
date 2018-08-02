//
//  FirstViewController.swift
//  Delegate
//
//  Created by Trung Kiên on 7/25/18.
//  Copyright © 2018 Trung Kiên. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController , delegateStringFunc{
    @IBOutlet weak var txtText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func onNext(_ sender: Any) {
        let second =  SecondViewController()
        second.delegate = self
        navigationController?.pushViewController(second, animated: true)
    }
    func delegateString(str: String) -> Void {
        txtText.text = str
    }

}
