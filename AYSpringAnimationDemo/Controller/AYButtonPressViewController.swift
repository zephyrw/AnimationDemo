//
//  AYButtonPressViewController.swift
//  AYSpringAnimationDemo
//
//  Created by wpsd on 2017/3/6.
//  Copyright © 2017年 wpsd. All rights reserved.
//

import UIKit

class AYButtonPressViewController: UIViewController {
    
    private let btnWH : CGFloat = 100.0
    
    private var normalImageView : UIImageView?
    private var blurImageView: UIImageView?
    
    private var percent : Int = 0
    private var timer : Timer?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        setupUI()
        let naviBar = AYVibrancyEffectNaviBar(title: title ?? "", frame: NAVIBAR_FRAME)
        naviBar.backBtnBlock = {
            _ = self.navigationController?.popViewController(animated: true)
        }
        view.addSubview(naviBar)
    }
    
    private func setupUI() {
        
        let normalImage = UIImage(named: "1.jpg")
        normalImageView = UIImageView(image: normalImage)
        normalImageView?.frame = view.bounds
        view.addSubview(normalImageView!)
        
        blurImageView = UIImageView(image: normalImage?.blur())
        blurImageView?.frame = view.bounds
        view.addSubview(blurImageView!)
        
        let contentView = UIView(frame: view.bounds)
        view.addSubview(contentView)
        
        contentView.layer.addSublayer(circleShapeLayer1)
        contentView.layer.addSublayer(circleShapeLayer2)
        
        view.addSubview(centerBtn)
        
    }
    
    @objc private func centerBtnTouchDown() {
        timer?.invalidate()
        timer = Timer(timeInterval: 0.00005, target: self, selector: #selector(percentChangeBigger), userInfo: nil, repeats: true)
        RunLoop.current.add(timer!, forMode: RunLoopMode.commonModes)
        UIView.animate(withDuration: 0.5) {
            self.blurImageView?.alpha = 0
            self.circleShapeLayer1.strokeEnd = 1
            self.circleShapeLayer2.strokeEnd = 1
        }
    }
    
    @objc private func centerBtnTouchUp() {
        timer?.invalidate()
        timer = Timer(timeInterval: 0.00005, target: self, selector: #selector(percentChangeSmaller), userInfo: nil, repeats: true)
        RunLoop.current.add(timer!, forMode: RunLoopMode.commonModes)
        UIView.animate(withDuration: 0.5) {
            self.blurImageView?.alpha = 1
            self.circleShapeLayer1.strokeEnd = 0
            self.circleShapeLayer2.strokeEnd = 0
        }
    }
    
    @objc private func percentChangeBigger() {
        if percent > 98 {
            return
        }
        percent += 2
        centerBtn.setTitle(String(format: "%02d%%", percent), for: UIControlState.normal)
    }
    
    @objc private func percentChangeSmaller() {
        if percent < 2 {
            return
        }
        percent -= 2
        centerBtn.setTitle(String(format: "%02d%%", percent), for: UIControlState.normal)
    }
    
    private lazy var circleShapeLayer1 : CAShapeLayer = {
        let circle = CAShapeLayer()
        let radius : CGFloat = 52
        circle.strokeStart = 0
        circle.strokeEnd = 0
        circle.lineWidth = 1
        circle.lineCap = kCALineCapRound
        circle.strokeColor = UIColor.white.cgColor
        circle.fillColor = UIColor.clear.cgColor
        circle.backgroundColor = UIColor.white.cgColor
        circle.path = UIBezierPath(arcCenter: self.view.center, radius: radius, startAngle: -CGFloat(M_PI_2), endAngle: CGFloat(M_PI_2) * 3.0, clockwise: true).cgPath
        var circleWidth : CGFloat = (radius + circle.lineWidth) * 2
        return circle
    }()
    
    private lazy var circleShapeLayer2 : CAShapeLayer = {
        let circle = CAShapeLayer()
        let radius : CGFloat = 54
        circle.strokeStart = 0
        circle.strokeEnd = 0
        circle.lineWidth = 1
        circle.lineCap = kCALineCapRound
        circle.strokeColor = UIColor.white.cgColor
        circle.fillColor = UIColor.clear.cgColor
        circle.backgroundColor = UIColor.white.cgColor
        circle.path = UIBezierPath(arcCenter: self.view.center, radius: radius, startAngle: -CGFloat(M_PI_2) * 3, endAngle: CGFloat(M_PI_2), clockwise: true).cgPath
        var circleWidth : CGFloat = (radius + circle.lineWidth) * 2
        return circle
    }()
    
    private lazy var centerBtn : UIButton = {
        let centerBtn = UIButton()
        centerBtn.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        centerBtn.center = self.view.center
        centerBtn.backgroundColor = UIColor.white
        centerBtn.setTitleColor(UIColor.black, for: UIControlState.normal)
        centerBtn.titleLabel?.font = UIFont(name: "HYQiHei-BEJF", size: 48)
        centerBtn.setTitle("00%", for: UIControlState.normal)
        centerBtn.layer.cornerRadius = centerBtn.frame.width / 2
        centerBtn.clipsToBounds = true
        centerBtn.addTarget(self, action: #selector(centerBtnTouchDown), for: UIControlEvents.touchDown)
        centerBtn.addTarget(self, action: #selector(centerBtnTouchUp), for: UIControlEvents.touchCancel)
        centerBtn.addTarget(self, action: #selector(centerBtnTouchUp), for: UIControlEvents.touchUpInside)
        centerBtn.addTarget(self, action: #selector(centerBtnTouchUp), for: UIControlEvents.touchUpOutside)
        return centerBtn
    }()
    
}
