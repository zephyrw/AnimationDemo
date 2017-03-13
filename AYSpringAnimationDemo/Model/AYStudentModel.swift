//
//  AYStudent.swift
//  AYSpringAnimationDemo
//
//  Created by wpsd on 2017/3/10.
//  Copyright © 2017年 wpsd. All rights reserved.
//

import UIKit

class AYStudentModel: NSObject {
    
    var name : String?
    var age  : Int?
    
    init(dict: [String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        if key == "age" {
            age = value as? Int
        }
    }
    
    override var description: String {
        return String(format: "name: %@, age: %d", name ?? "", age ?? 0)
    }
    
}
