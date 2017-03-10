//
//  AYCAShapeLayerPathViewController.swift
//  AYSpringAnimationDemo
//
//  Created by wpsd on 2017/3/7.
//  Copyright © 2017年 wpsd. All rights reserved.
//

import UIKit

class AYCAShapeLayerPathViewController: UIViewController {
    
    private let containerWH : CGFloat = 200
    private var randomPointTop : CGPoint = CGPoint.zero
    private var prePath : CGPath = UIBezierPath().cgPath
    private var preColor : CGColor = UIColor.clear.cgColor
    private var prePostion : CGPoint = CGPoint.zero

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        setupUI()
        RunLoop.current.add(Timer.init(timeInterval: 1, target: self, selector: #selector(animatePath), userInfo: nil, repeats: true), forMode: RunLoopMode.commonModes)
        let naviBar = AYWhiteNaviBar(title: title ?? "", frame: NAVIBAR_FRAME)
        naviBar.backBtnBlock = {
            _ = self.navigationController?.popViewController(animated: true)
        }
        view.addSubview(naviBar)
    }

    private func setupUI() {
        
        let containerView = UIView(frame: CGRect(x: view.center.x - containerWH / 2, y: view.center.y - containerWH / 2, width: containerWH, height: containerWH))
        containerView.layer.borderColor = UIColor.cyan.withAlphaComponent(0.5).cgColor
        containerView.layer.borderWidth = 0.5
        view.addSubview(containerView)
        
        containerView.layer.addSublayer(shapeLayer)
        containerView.layer.addSublayer(topPointLayer)
        
        topPointLayer.position = randomPointTop
        prePath = shapeLayer.path!
        preColor = shapeLayer.fillColor!
        prePostion = randomPointTop
    }
    
    @objc private func animatePath() {
        
        shapeLayer.removeAllAnimations()
        topPointLayer.removeAllAnimations()
        
        let newPath = randomPath()
        let newColor = randomColor().cgColor
        
        shapeLayer.add(basicAnimation(keyPath: "path", toValue: newPath, fromValue: prePath), forKey: "ani1")
        shapeLayer.add(basicAnimation(keyPath: "fillColor", toValue: newColor, fromValue: preColor), forKey: "ani2")
        topPointLayer.add(basicAnimation(keyPath: "position", toValue: randomPointTop, fromValue: prePostion), forKey: "ani3")
        
        prePath = newPath
        preColor = newColor
        prePostion = randomPointTop
    }
    
    private func basicAnimation(keyPath : String, toValue : Any, fromValue: Any) -> CABasicAnimation {
        let basicAnimation = CABasicAnimation()
        basicAnimation.duration = 0.5
        basicAnimation.keyPath = keyPath
        basicAnimation.fromValue = fromValue
        basicAnimation.toValue = toValue
        basicAnimation.fillMode = kCAFillModeForwards
        basicAnimation.isRemovedOnCompletion = false
        return basicAnimation
    }
    
    private func randomPath() -> CGPath {
        randomPointTop = CGPoint(x: randomCap(), y: 0)
        let randomPointRight = CGPoint(x: containerWH, y: randomCap())
        let randomPointBottom = CGPoint(x: randomCap(), y: containerWH)
        let randomPointLeft = CGPoint(x: 0, y: randomCap())
        let path = UIBezierPath()
        path.move(to: randomPointTop)
        path.addLine(to: randomPointRight)
        path.addLine(to: randomPointBottom)
        path.addLine(to: randomPointLeft)
        path.close()
        return path.cgPath
    }
    
    private func randomCap() -> CGFloat {
        return CGFloat(arc4random_uniform(UInt32(containerWH)))
    }
    
    lazy var topPointLayer : CALayer = {
       let layer = CALayer()
        layer.backgroundColor = UIColor.black.withAlphaComponent(0.5).cgColor
        layer.frame = CGRect(x: 0, y: 0, width: 5, height: 5)
        layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        return layer
    }()
    
    lazy var shapeLayer : CAShapeLayer = {
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.fillColor = randomColor().cgColor
        shapeLayer.lineDashPattern = [2, 3]
        shapeLayer.path = self.randomPath()
        return shapeLayer
    }()
    
}
