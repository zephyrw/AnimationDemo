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

let SCREEN_MAX_LENGTH = max(SCREEN_WIDTH, SCREEN_HEIGHT)
let SCREEN_MIN_LENGTH = min(SCREEN_WIDTH, SCREEN_HEIGHT)

let IS_IPHONE = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone
let IS_IPHONE_X = IS_IPHONE && SCREEN_MAX_LENGTH == 812.0

let STATUSBAR_HEIGHT : CGFloat = IS_IPHONE_X ? 44.0 : 20.0
let NAVIBAR_FRAME = CGRect(origin: CGPoint.zero, size: CGSize(width: SCREEN_WIDTH, height: STATUSBAR_HEIGHT + 44.0))

let COUNT_DOWN_TIME_NOTIFICATION = "COUNT_DOWN_TIME_NOTIFICATION"

func randomColor() -> UIColor {
    return UIColor(red: CGFloat(arc4random_uniform(255)) / CGFloat(255.0), green: CGFloat(arc4random_uniform(255)) / CGFloat(255.0), blue: CGFloat(arc4random_uniform(255)) / CGFloat(255.0), alpha: 1)
}
