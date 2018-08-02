//
//  ClosureViewController.swift
//  MultiThread+Block+Closure
//
//  Created by Trung Kiên on 7/25/18.
//  Copyright © 2018 Trung Kiên. All rights reserved.
//

import UIKit

class ClosureViewController: UIViewController {
    var closure : (Double , Double) -> Bool = {$0 > $1}
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myFunction("Hello, world!", closureParameter: {(string) in
            print(string)
        })
        
        myFunction("Hello, world!") {(string) in
            print(string)
        }
        
        print(closure(3,4))
        let mapNumbers = [10, 20, 30, 40, 50]
        //let doubledMapNumbers = mapNumbers.map { $0 * 2 }
        //print(doubledMapNumbers)
        
        let sortNumber = [1,100,4,7,200]
        let sortedNumber = sortNumber.sorted{$0 < $1}
        print(sortedNumber)
        
        
        
        let doubledMapNumbers = mapNumbers.map( {(number) in
            return number * 2
        })
        print(doubledMapNumbers)
        
        
        let filterNumbers = [1, 2, 3, 4, 5]
        let filteredNumbers = filterNumbers.filter { $0 > 3 }
        print(filteredNumbers)
        
        
        let forEachNumbers = [1, 2, 3, 4, 5]
        forEachNumbers.forEach {_ in
            
        }
        print(forEachNumbers)
        
        
        let reduceNumbers = [1, 2, 3, 4 ,5]
        let reducedNumber = reduceNumbers.reduce(10) { $0 + $1 }
        print(reducedNumber)
        
        let flatMapNumbers = [1, nil, 2, nil, 3, nil, 4, nil, 5]
        let flatMappedNumbers = flatMapNumbers.compactMap { $0 }
        print(flatMappedNumbers)
    }
    func myFunction(_ stringParameter: String, closureParameter: (String) -> Void) {
        closureParameter(stringParameter)
    }



}
