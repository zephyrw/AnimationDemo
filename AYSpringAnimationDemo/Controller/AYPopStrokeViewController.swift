//
//  AYPopStrokeViewController.swift
//  AYSpringAnimationDemo
//
//  Created by wpsd on 2017/3/6.
//  Copyright © 2017年 wpsd. All rights reserved.
//

import UIKit

class AYPopStrokeViewController: UIViewController {
    
    var preStartToValue : CGFloat = 0
    var preEndToValue : CGFloat = 0
    var preColorValue : CGColor = UIColor.clear.cgColor

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        view.layer.addSublayer(circleShapeLayer)
        RunLoop.current.add(Timer(timeInterval: 2, target: self, selector: #selector(startAnimation), userInfo: nil, repeats: true), forMode: RunLoopMode.commonModes)
        let naviBar = AYWhiteNaviBar(title: title ?? "", frame: NAVIBAR_FRAME)
        naviBar.backBtnBlock = {
            _ = self.navigationController?.popViewController(animated: true)
        }
        view.addSubview(naviBar)
    }
    
    @objc private func startAnimation() {
        
        let value1 = CGFloat(arc4random_uniform(10)) / 10.0
        var value2 = CGFloat(arc4random_uniform(10)) / 10.0
        if value1 == value2 {
            value2 += 0.0000001
        }
        let startValue = value1 <= value2 ? value1 : value2
        let endValue = value1 > value2 ? value1 : value2
        let color = randomColor().cgColor
        
        circleShapeLayer.add(springAnimation(keyPath: "strokeStart", toValue: startValue, fromValue: preStartToValue), forKey: "ani1")
        circleShapeLayer.add(springAnimation(keyPath: "strokeEnd", toValue: endValue, fromValue: preEndToValue), forKey: "ani2")
        circleShapeLayer.strokeColor = color
        
        preStartToValue = startValue
        preEndToValue = endValue
        preColorValue = color
    }
    
    private func springAnimation(keyPath : String, toValue : Any, fromValue: Any) -> CASpringAnimation {
        let springAnimation = CASpringAnimation()
        springAnimation.damping = 10
        springAnimation.initialVelocity = 100
        springAnimation.duration = 2
        springAnimation.mass = 1
        springAnimation.keyPath = keyPath
        springAnimation.fromValue = fromValue
        springAnimation.toValue = toValue
        springAnimation.fillMode = kCAFillModeForwards
        springAnimation.isRemovedOnCompletion = false
        return springAnimation
    }
    
    private lazy var circleShapeLayer : CAShapeLayer = {
        let circle = CAShapeLayer()
        circle.strokeColor = UIColor(red: CGFloat(arc4random_uniform(255)) / CGFloat(255.0), green: CGFloat(arc4random_uniform(255)) / CGFloat(255.0), blue: CGFloat(arc4random_uniform(255)) / CGFloat(255.0), alpha: 1).cgColor
        circle.fillColor = UIColor.clear.cgColor
        circle.strokeStart = 0
        circle.strokeEnd = 0
        circle.lineCap = kCALineCapRound
        circle.lineWidth = 5
        circle.path = UIBezierPath(arcCenter: self.view.center, radius: 50, startAngle: 0, endAngle: CGFloat(M_PI) * 2, clockwise: true).cgPath
        return circle
    }()

}
