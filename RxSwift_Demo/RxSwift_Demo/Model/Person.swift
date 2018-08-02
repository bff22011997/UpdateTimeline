//
//  Person.swift
//  RxSwift_Demo
//
//  Created by Trung Kiên on 7/30/18.
//  Copyright © 2018 Trung Kiên. All rights reserved.
//

import UIKit

class Person: NSObject {
    var name : String = ""
    var age : Int = 0
    init(age : Int, name : String) {
        self.age = age
        self.name = name
    }
}
