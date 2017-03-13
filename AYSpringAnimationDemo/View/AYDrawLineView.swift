//
//  AYDrawLineView.swift
//  AYSpringAnimationDemo
//
//  Created by wpsd on 2017/3/13.
//  Copyright © 2017年 wpsd. All rights reserved.
//

import UIKit

class AYDrawLineView: UIView {
    
    private var drawValues = [CGFloat]()
    
    override func draw(_ rect: CGRect) {
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        drawValues.append(CGFloat(arc4random_uniform(200)))
        context.setLineCap(.round)
        UIColor.clear.setStroke()
        UIColor.red.setFill()
        for (index, drawValue) in drawValues.enumerated() {
            if drawValue >= 100 {
                context.addRect(CGRect(x: CGFloat(index), y: 100, width: 1, height: drawValue - 100))
            }else {
                context.addRect(CGRect(x: CGFloat(index), y: drawValue, width: 1, height: 100 - drawValue))
            }
        }
        context.fillPath()
    }

}
