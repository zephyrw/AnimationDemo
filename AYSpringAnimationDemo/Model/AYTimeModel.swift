//
//  AYTimeModel.swift
//  AYSpringAnimationDemo
//
//  Created by wpsd on 2017/3/13.
//  Copyright © 2017年 wpsd. All rights reserved.
//

import UIKit

class AYTimeModel: NSObject {

    var title : String?
    var timeStr : String?
    var countDownTime : Int? {
        didSet{
            guard let countDownTime = countDownTime else { return }
            if countDownTime <= 0 {
                timeStr =  "00:00:00"
            }else {
                timeStr = String(format: "%02d:%02d:%02d", countDownTime / 3600, countDownTime % 3600 / 60, countDownTime % 60)
            }
        }
    }
    
}
