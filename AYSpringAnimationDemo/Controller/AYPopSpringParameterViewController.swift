//
//  AYPopSpringParameterViewController.swift
//  AYSpringAnimationDemo
//
//  Created by wpsd on 2017/3/9.
//  Copyright © 2017年 wpsd. All rights reserved.
//

import UIKit

class AYPopSpringParameterViewController: UIViewController {
    
    private var tensionSlider : AYParameterValueSliderView?
    private var frictionSlider : AYParameterValueSliderView?
    private var massSlider : AYParameterValueSliderView?
    private var bouncinessSlider : AYParameterValueSliderView?
    private var speedSlider : AYParameterValueSliderView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        setupUI()
        
        let naviBar = AYWhiteNaviBar(title: title ?? "", frame: NAVIBAR_FRAME)
        naviBar.backBtnBlock = {
            _ = self.navigationController?.popViewController(animated: true)
        }
        view.addSubview(naviBar)
        
    }
    
    private func setupUI() {
        
        view.addSubview(centerBtn)
        
        let timeLabel = UILabel(frame: CGRect(x: 10, y: 10 + 64, width: 100, height: 20))
        timeLabel.attributedText = timeString(value: 0)
        view.addSubview(timeLabel)
        
        tensionSlider = AYParameterValueSliderView(frame: CGRect(x: 10, y: SCREEN_HEIGHT - 60 - 40 * 4, width: SCREEN_WIDTH - 20, height: 25), title: "拉力  Tension", minValue: 1, maxValue: 1000, defaultValue: 300)
        view.addSubview(tensionSlider!)
        
        frictionSlider = AYParameterValueSliderView(frame: CGRect(x: 10, y: SCREEN_HEIGHT - 60 - 40 * 3, width: SCREEN_WIDTH - 20, height: 25), title: "摩擦  Friction", minValue: 1, maxValue: 50, defaultValue: 5)
        view.addSubview(frictionSlider!)
        
        massSlider = AYParameterValueSliderView(frame: CGRect(x: 10, y: SCREEN_HEIGHT - 60 - 40 * 2, width: SCREEN_WIDTH - 20, height: 25), title: "质量  Mass", minValue: 0.1, maxValue: 10, defaultValue: 1)
        view.addSubview(massSlider!)
        
        bouncinessSlider = AYParameterValueSliderView(frame: CGRect(x: 10, y: SCREEN_HEIGHT - 60 - 40, width: SCREEN_WIDTH - 20, height: 25), title: "弹力  Bounciness", minValue: 0, maxValue: 20, defaultValue: 4)
        view.addSubview(bouncinessSlider!)
        
        speedSlider = AYParameterValueSliderView(frame: CGRect(x: 10, y: SCREEN_HEIGHT - 60, width: SCREEN_WIDTH - 20, height: 25), title: "速度  Speed", minValue: 0, maxValue: 20, defaultValue: 1)
        view.addSubview(speedSlider!)
        
    }
    
    @objc private func startAnimation(sender: UIButton) {
        
//        centerBtn.layer.removeAllAnimations()
        
        let boundsAnimation = springAnimation(keyPath: "bounds", fromValue: CGRect(x: 0, y: 0, width: 100, height: 100), toValue: CGRect(x: 0, y: 0, width: 200, height: 200))
        let cornerRadiusAnimation = springAnimation(keyPath: "cornerRadius", fromValue: 50, toValue: 100)
        
        centerBtn.layer.add(boundsAnimation, forKey: nil)
        centerBtn.layer.add(cornerRadiusAnimation, forKey: nil)
    }
    
    private func springAnimation(keyPath: String, fromValue: Any, toValue: Any) -> CASpringAnimation {
        
        let springAnimation = CASpringAnimation(keyPath: keyPath)
        springAnimation.stiffness = (tensionSlider?.currentValue)!
//        springAnimation.initialVelocity = (bouncinessSlider?.currentValue)!
        springAnimation.mass = (massSlider?.currentValue)!
        springAnimation.damping = (frictionSlider?.currentValue)!
        springAnimation.speed = Float((speedSlider?.currentValue)!)
        springAnimation.duration = 0.5
        springAnimation.fillMode = kCAFillModeForwards
        springAnimation.isRemovedOnCompletion = false
        springAnimation.fromValue = fromValue
        springAnimation.toValue = toValue
        return springAnimation
        
    }
    
    private func timeString(value: Float) -> NSMutableAttributedString {
        
        let timeStr = String(format: "%.2f seconds", value)
        guard let firstPart = timeStr.components(separatedBy: " ").first else { return NSMutableAttributedString() }
        let firstLength = firstPart.lengthOfBytes(using: .utf8)
        let secondLength = timeStr.lengthOfBytes(using: .utf8) - firstLength
        let attrStr = NSMutableAttributedString(string: timeStr)
        attrStr.addAttributes([NSFontAttributeName : UIFont(name: "Avenir-Light", size: 20) ?? UIFont.systemFont(ofSize: 20), NSForegroundColorAttributeName : UIColor.black], range: NSRange(location: 0, length: firstLength))
        attrStr.addAttributes([NSFontAttributeName : UIFont(name: "Avenirt", size: 12) ?? UIFont.systemFont(ofSize: 12), NSForegroundColorAttributeName : UIColor.gray], range: NSRange(location: firstLength, length: secondLength))
        
        return attrStr
    }
    
    private lazy var centerBtn : UIButton = {
        
        let cap = SCREEN_HEIGHT - 64 - 40 * 4 - 60
        let width : CGFloat = 100
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: width, height: width))
        btn.center = CGPoint(x: SCREEN_WIDTH / 2, y: cap / 2 + 64)
        btn.backgroundColor = UIColor.cyan
        btn.layer.cornerRadius = width / 2
        btn.clipsToBounds = true
        btn.addTarget(self, action: #selector(startAnimation(sender:)), for: .touchUpInside)
        
        return btn
    }()

}
