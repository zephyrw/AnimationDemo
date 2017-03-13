//
//  AYCommon.swift
//  AYSpringAnimationDemo
//
//  Created by wpsd on 2017/3/3.
//  Copyright © 2017年 wpsd. All rights reserved.
//

import UIKit

let SCREEN_WIDTH = UIScreen.main.bounds.width
let SCREEN_HEIGHT = UIScreen.main.bounds.height

let NAVIBAR_FRAME = CGRect(origin: CGPoint.zero, size: CGSize(width: SCREEN_WIDTH, height: 64))

let COUNT_DOWN_TIME_NOTIFICATION = "COUNT_DOWN_TIME_NOTIFICATION"

func randomColor() -> UIColor {
    return UIColor(red: CGFloat(arc4random_uniform(255)) / CGFloat(255.0), green: CGFloat(arc4random_uniform(255)) / CGFloat(255.0), blue: CGFloat(arc4random_uniform(255)) / CGFloat(255.0), alpha: 1)
}
