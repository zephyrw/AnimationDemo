//
//  AYCircleAnimationViewController.swift
//  AYSpringAnimationDemo
//
//  Created by wpsd on 2017/3/8.
//  Copyright © 2017年 wpsd. All rights reserved.
//

import UIKit

class AYCircleAnimationViewController: UIViewController {
    
    private let topMargin : CGFloat = 100
    
    private var preValue : CGFloat = 0
    private var preLength : CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        RunLoop.current.add(Timer.init(timeInterval: 2, target: self, selector: #selector(animation), userInfo: nil, repeats: true), forMode: RunLoopMode.commonModes)
        setupUI()
        let naviBar = AYWhiteNaviBar(title: title ?? "", frame: NAVIBAR_FRAME)
        naviBar.backBtnBlock = {
            _ = self.navigationController?.popViewController(animated: true)
        }
        view.addSubview(naviBar)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animation()
    }
    
    private func setupUI() {
        view.layer.addSublayer(firstShapeLayer)
        view.layer.addSublayer(secondShapeLayer)
        view.layer.addSublayer(thirdShapeLayer)
        
        let containerView = UIView(frame: CGRect(x: SCREEN_WIDTH / 2, y: topMargin + SCREEN_WIDTH / 2, width: SCREEN_WIDTH / 2, height: SCREEN_WIDTH / 2))
        view.addSubview(containerView)
        
        let imageView = UIImageView(image: UIImage(named: "colors"))
        imageView.frame = containerView.bounds
        containerView.addSubview(imageView)
        
        let maskView = UIView(frame: view.bounds)
        maskView.layer.addSublayer(fourthShapeLayer)
        containerView.mask = maskView
    }

    @objc private func animation() {
        
        let randomValue = CGFloat(arc4random_uniform(10)) * 0.1
        let randomLength = CGFloat(arc4random_uniform(10)) * 0.01
        addBasicAnimation(shapeLayer: firstShapeLayer, randomValue: randomValue, fromValue: preValue)
        addBasicAnimation(shapeLayer: secondShapeLayer, randomValue: randomValue, fromValue: preValue)
        addStrokeStartAnimation(shapeLayer: thirdShapeLayer, toValue: randomValue - randomLength, fromValue: preValue - preLength)
        addBasicAnimation(shapeLayer: thirdShapeLayer, randomValue: randomValue + randomLength, fromValue: preValue + preLength)
        addBasicAnimation(shapeLayer: fourthShapeLayer, randomValue: randomValue, fromValue: preValue)
        preValue = randomValue
        preLength = randomLength
    }
    
    private func addBasicAnimation(shapeLayer: CAShapeLayer, randomValue: CGFloat, fromValue: CGFloat) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = fromValue
        animation.toValue = randomValue
        animation.duration = 0.5
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        shapeLayer.add(animation, forKey: nil)
    }
    
    private func addStrokeStartAnimation(shapeLayer: CAShapeLayer, toValue: CGFloat, fromValue: CGFloat) {
        let animation = CABasicAnimation(keyPath: "strokeStart")
        animation.fromValue = fromValue
        animation.toValue = toValue
        animation.duration = 0.5
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        shapeLayer.add(animation, forKey: nil)
    }
    
    private func shapeLayer(strokeColor: UIColor, frame: CGRect, lineWidth: CGFloat , radius: CGFloat) -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = strokeColor.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.frame = frame
        shapeLayer.strokeStart = 0
        shapeLayer.strokeEnd = 0
        shapeLayer.lineCap = kCALineCapButt
        shapeLayer.lineWidth = lineWidth
        let arcCenter = CGPoint(x: SCREEN_WIDTH / 4, y: SCREEN_WIDTH / 4)
        shapeLayer.path = UIBezierPath(arcCenter: arcCenter, radius: radius, startAngle: CGFloat(-M_PI), endAngle: CGFloat(M_PI), clockwise: true).cgPath
        return shapeLayer
        
    }
    
    private lazy var firstShapeLayer : CAShapeLayer = {
        let shapeSize = CGSize(width: SCREEN_WIDTH / 2, height: SCREEN_WIDTH / 2)
        let shapeFrame = CGRect(origin: CGPoint(x: 0, y: self.topMargin), size: shapeSize)
        let shapeLayer = self.shapeLayer(strokeColor: UIColor.black, frame: shapeFrame, lineWidth: 2, radius: SCREEN_WIDTH / 4 - 10)
        return shapeLayer
    }()
    
    private lazy var secondShapeLayer : CAShapeLayer = {
        let shapeSize = CGSize(width: SCREEN_WIDTH / 2, height: SCREEN_WIDTH / 2)
        let shapeFrame = CGRect(origin: CGPoint(x: SCREEN_WIDTH / 2, y: self.topMargin), size: shapeSize)
        let shapeLayer = self.shapeLayer(strokeColor: UIColor.black, frame: shapeFrame, lineWidth: SCREEN_WIDTH / 4 - 10, radius: SCREEN_WIDTH / 8 - 5)
        return shapeLayer
    }()
    
    private lazy var thirdShapeLayer : CAShapeLayer = {
        let shapeSize = CGSize(width: SCREEN_WIDTH / 2, height: SCREEN_WIDTH / 2)
        let shapeFrame = CGRect(origin: CGPoint(x: 0, y: self.topMargin + SCREEN_WIDTH / 2), size: shapeSize)
        let shapeLayer = self.shapeLayer(strokeColor: UIColor.gray, frame: shapeFrame, lineWidth: 2, radius: SCREEN_WIDTH / 4 - 10)
        return shapeLayer
    }()
    
    private lazy var fourthShapeLayer : CAShapeLayer = {
        let shapeSize = CGSize(width: SCREEN_WIDTH / 2, height: SCREEN_WIDTH / 2)
        let shapeFrame = CGRect(origin: CGPoint.zero, size: shapeSize)
        let shapeLayer = self.shapeLayer(strokeColor: UIColor.black, frame: shapeFrame, lineWidth: SCREEN_WIDTH / 4 - 10, radius: SCREEN_WIDTH / 8 - 5)
        
        return shapeLayer
    }()
    
}
