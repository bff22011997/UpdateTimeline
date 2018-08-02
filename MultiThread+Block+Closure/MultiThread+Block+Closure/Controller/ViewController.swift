//
//  ViewController.swift
//  MultiThread+Block+Closure
//
//  Created by Trung Kiên on 7/25/18.
//  Copyright © 2018 Trung Kiên. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var thread = Thread()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Serial Queue
//        let  queue = DispatchQueue(label: "Serial Queue")
//        queue.async {
//            for _ in 0...5 {
//                self.smile()
//            }
//        }
//        queue.async {
//            for _ in 0...5 {
//                self.love()
//            }
//        }
        
        // Concurrent Queue
//        let queue = DispatchQueue(label: "Concurrent Queus", qos: .default, attributes: .concurrent, autoreleaseFrequency: .inherit, target: nil)
//        queue.async {
//            for _ in 0...5 {
//                self.smile()
//            }
//        }
//        queue.async {
//            for _ in 0...5 {
//                self.love()
//            }
//        }
        
        // Synchronous
        
//        print("Test 1")
//        sync()
//        sleep(10)
//        print("Test 2")
//        print("Test 3")
         thread = Thread(target: self, selector: #selector(self.smile), object: nil)
        thread.start()
        
        
    }
  
    @IBAction func onBlock(_ sender: Any) {
        let block = BlockViewController()
        navigationController?.pushViewController(block, animated: true)
    }
    @objc func smile() -> Void {
        for i in 0...5 {
            if i == 3 {
                thread.cancel()
                //thread.main()
               // thread.isFinished(true)
            }
            else {
                print("😉")
            }
        }
        
    }
    func love() ->  Void{
        print("♥️")
    }

}
