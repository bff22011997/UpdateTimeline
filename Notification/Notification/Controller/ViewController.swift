//
//  ViewController.swift
//  Notification
//
//  Created by Trung Kiên on 7/27/18.
//  Copyright © 2018 Trung Kiên. All rights reserved.
//

import UIKit
import UserNotifications
class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func onChoseDate(_ sender: Any) {
        let date = datePicker.date
        let delegate = UIApplication.shared.delegate as? AppDelegate
        delegate?.scheduleNotification(at: date)
    }
    @IBAction func onPresent(_ sender: Any) {
        let second =  SecondViewController()
        present(second, animated: true, completion: nil)
    }
    
}
