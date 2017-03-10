//
//  AYNavigationController.swift
//  AYSpringAnimationDemo
//
//  Created by wpsd on 2017/3/3.
//  Copyright © 2017年 wpsd. All rights reserved.
//

import Foundation

class AYNavigationController: UINavigationController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        navigationBar.isHidden = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
