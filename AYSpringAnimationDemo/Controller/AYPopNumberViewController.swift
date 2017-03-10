//
//  AYPopNumberViewController.swift
//  AYSpringAnimationDemo
//
//  Created by wpsd on 2017/3/8.
//  Copyright © 2017年 wpsd. All rights reserved.
//

import UIKit

class AYPopNumberViewController: UIViewController {
    
    private var currentNumber : Float = 0.0
    
    private var numTimer : Timer?
    
    private var delta : Float = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        view.addSubview(centerLabel)
        RunLoop.current.add(Timer.init(timeInterval: 7, target: self, selector: #selector(startAnimate), userInfo: nil, repeats: true), forMode: RunLoopMode.commonModes)
        let naviBar = AYWhiteNaviBar(title: title ?? "", frame: NAVIBAR_FRAME)
        naviBar.backBtnBlock = {
            _ = self.navigationController?.popViewController(animated: true)
        }
        view.addSubview(naviBar)
    }

    @objc private func startAnimate() {
        
        let newNum = Float(arc4random_uniform(1000)) * 0.1
        delta = newNum - currentNumber
        numTimer = Timer(timeInterval: 0.01, target: self, selector: #selector(animateNumber), userInfo: nil, repeats: true)
        RunLoop.current.add(numTimer!, forMode: .commonModes)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { 
            self.numTimer?.invalidate()
            self.numTimer = nil
        }
    }
    
    @objc private func animateNumber() {
        let cap = delta / 500.0
        currentNumber += cap
        if currentNumber < 0 || currentNumber > 100 { return }
        let str = String(format: "%.1f mps", currentNumber)
        let attrStr = NSMutableAttributedString(string: str)
        let part1 = str.components(separatedBy: " ").first! as String
        let firstPartLength = part1.lengthOfBytes(using: .utf8)
        let secondPartLength = str.lengthOfBytes(using: .utf8) - firstPartLength
        attrStr.addAttributes([NSFontAttributeName : UIFont(name: "HYQiHei-BEJF", size: 60) ?? UIFont.systemFont(ofSize: 60),
            NSForegroundColorAttributeName : numColor()], range: NSRange(location: 0, length: firstPartLength))
        attrStr.addAttributes([NSFontAttributeName : UIFont(name: "HYQiHei-BEJF", size: 32) ?? UIFont.systemFont(ofSize: 32),NSForegroundColorAttributeName : npsColor()], range: NSRange(location: firstPartLength, length: secondPartLength))
        centerLabel.attributedText = attrStr
    }
    
    private func numColor() -> UIColor {
        return UIColor(red: CGFloat(currentNumber / 100.0), green: 0, blue: 0, alpha: 1)
    }
    
    private func npsColor() -> UIColor {
        return UIColor(red: 0, green: CGFloat(currentNumber / 100.0), blue: CGFloat(currentNumber / 100.0), alpha: CGFloat(currentNumber / 100.0))
    }
    
    private lazy var centerLabel : UILabel = {
       let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        label.textAlignment = .center
        label.center = self.view.center
        return label
    }()
    
}
