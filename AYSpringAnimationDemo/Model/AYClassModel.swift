//
//  AYClass.swift
//  AYSpringAnimationDemo
//
//  Created by wpsd on 2017/3/10.
//  Copyright © 2017年 wpsd. All rights reserved.
//

import UIKit

class AYClassModel: NSObject {
    
    var className : String?
    var isExpand  : Bool?
    var students  : [Any]? {
        didSet{
            guard let students = students else {
                return
            }
            var tmpArr = [AYStudentModel]()
            for dict in students {
                let student = AYStudentModel(dict: dict as! [String : Any])
                tmpArr.append(student)
            }
            self.students? = tmpArr
        }
    }
    
    init(dict: [String : Any]) {
        super.init()
        setValuesForKeys(dict)
        isExpand = false
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
    override var description: String {
        return String(format: "className: %@, students: %@", className ?? "", students ?? "")
    }
    
}
