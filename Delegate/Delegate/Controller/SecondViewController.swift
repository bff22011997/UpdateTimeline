//
//  SecondViewController.swift
//  Delegate
//
//  Created by Trung Kiên on 7/25/18.
//  Copyright © 2018 Trung Kiên. All rights reserved.
//

import UIKit
protocol delegateStringFunc : class {
    func delegateString(str : String) -> Void ;
}
class SecondViewController: UIViewController {
    @IBOutlet weak var txtText: UITextField!
    weak var delegate : delegateStringFunc?
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onDelegate(_ sender: Any) {
        if txtText.text == "" {
           delegate?.delegateString(str: "Nhap so")
        } else {
            delegate?.delegateString(str: txtText.text!)
        }
        navigationController?.popViewController(animated: true)
    }
    

}
