//
//  AYListModel.swift
//  AYSpringAnimationDemo
//
//  Created by wpsd on 2017/3/6.
//  Copyright © 2017年 wpsd. All rights reserved.
//

import UIKit

class AYListModel: NSObject {

    var title : String
    var viewController : UIViewController
    var vcName : String
    
    init(title: String, viewController : UIViewController, vcName : String) {
        self.title = title
        self.viewController = viewController
        self.vcName = vcName.components(separatedBy: ".").first!
    }
    
}
