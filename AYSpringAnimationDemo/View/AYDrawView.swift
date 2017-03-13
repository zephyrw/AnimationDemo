//
//  AYDrawView.swift
//  AYSpringAnimationDemo
//
//  Created by wpsd on 2017/3/13.
//  Copyright © 2017年 wpsd. All rights reserved.
//

import UIKit

class AYDrawView: UIView {
    
    private var drawValues = [CGFloat]()
    
    override func draw(_ rect: CGRect) {
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        drawValues.append(CGFloat(arc4random_uniform(200)))
        context.setLineWidth(0.5)
        context.setLineCap(.round)
        UIColor.gray.setStroke()
        UIColor.clear.setFill()
        for (index, drawValue) in drawValues.enumerated() {
            if index == 0 {
                context.move(to: CGPoint(x: CGFloat(index), y: drawValue))
            }else {
                context.addLine(to: CGPoint(x: CGFloat(index), y: drawValue))
            }
        }
        context.strokePath()
    }

}
