//
//  AYClockViewController.swift
//  AYSpringAnimationDemo
//
//  Created by wpsd on 2017/3/13.
//  Copyright © 2017年 wpsd. All rights reserved.
//

import UIKit

class AYClockViewController: UIViewController {
    
    var hourView : UIImageView?
    var minuteView : UIImageView?
    var secondView : UIImageView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white

        setupUI()
        
        RunLoop.current.add(Timer.init(timeInterval: 1, target: self, selector: #selector(timerEvent), userInfo: nil, repeats: true), forMode: .commonModes)
        
        let naviBar = AYWhiteNaviBar(title: title ?? "", frame: NAVIBAR_FRAME)
        naviBar.backBtnBlock = {
            _ = self.navigationController?.popViewController(animated: true)
        }
        view.addSubview(naviBar)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshTimeView()
    }
    
    @objc private func timerEvent() {
        refreshTimeView()
    }
    
    private func setupUI() {
        
        let dialView = UIView(frame: CGRect(x: 0, y: 0, width: 250, height: 250))
        dialView.center = view.center
        dialView.layer.cornerRadius = dialView.frame.width / 2
        dialView.layer.borderColor = UIColor.black.cgColor
        dialView.layer.borderWidth = 2
        view.addSubview(dialView)
        
        let hourHandSize = CGSize(width: 200, height: 200)
        hourView = UIImageView(image: #imageLiteral(resourceName: "hour.png"))
        hourView?.frame = CGRect(origin: CGPoint.zero, size: hourHandSize)
        hourView?.center = dialView.center
        view.addSubview(hourView!)
        
        hourView?.glowRadius            = 2
        hourView?.glowOpacity           = 0.75;
        hourView?.glowColor             = UIColor.red
        hourView?.glowDuration          = 1
        hourView?.hideDuration          = 1
        hourView?.glowAnimationDuration = 1
        hourView?.createGlowLayer()
        hourView?.insertGlowLayer()
        hourView?.startGlowLoop()
        
        minuteView = UIImageView(image: #imageLiteral(resourceName: "min.png"))
        minuteView?.frame = CGRect(origin: CGPoint.zero, size: hourHandSize)
        minuteView?.center = dialView.center
        view.addSubview(minuteView!)
        
        secondView = UIImageView(image: #imageLiteral(resourceName: "sec.png"))
        secondView?.frame = CGRect(origin: CGPoint.zero, size: hourHandSize)
        secondView?.center = dialView.center
        view.addSubview(secondView!)
        
        secondView?.glowRadius            = 2
        secondView?.glowOpacity           = 0.75;
        secondView?.glowColor             = UIColor.cyan
        secondView?.glowDuration          = 1
        secondView?.hideDuration          = 1
        secondView?.glowAnimationDuration = 1
        secondView?.createGlowLayer()
        secondView?.insertGlowLayer()
        secondView?.startGlowLoop()
        
        let redCenterPointView = UIView(frame: CGRect(x: 0, y: 0, width: 6, height: 6))
        redCenterPointView.center = dialView.center
        redCenterPointView.backgroundColor = UIColor.red
        redCenterPointView.layer.cornerRadius = redCenterPointView.frame.width / 2
        view.addSubview(redCenterPointView)
        
    }
    
    private func refreshTimeView() {
        let timeArr = currentTimeArr()
        if timeArr.count == 3 {
            var hour = timeArr[0]
            if hour >= 12 {
                hour -= 12
            }
            hourView?.transform = CGAffineTransform(rotationAngle: CGFloat(hour) / 12 * CGFloat(M_PI) * 2)
            minuteView?.transform = CGAffineTransform(rotationAngle: CGFloat(CGFloat(timeArr[1]) / 60) * CGFloat(M_PI) * 2)
            secondView?.transform = CGAffineTransform(rotationAngle: CGFloat(CGFloat(timeArr[2]) / 60) * CGFloat(M_PI) * 2)
        }
    }
    
    private func currentTimeArr() -> [Int] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        let dateStr = dateFormatter.string(from: Date())
        let dateStrArr = dateStr.components(separatedBy: ":")
        var dateIntArr = [Int]()
        for dateStr in dateStrArr {
            if let dateInt = Int(dateStr) {
                dateIntArr.append(dateInt)
            }
        }
        return dateIntArr
    }
    
}
