//
//  AYVibrancyEffectNaviBar.swift
//  AYSpringAnimationDemo
//
//  Created by wpsd on 2017/3/7.
//  Copyright © 2017年 wpsd. All rights reserved.
//

import UIKit

class AYVibrancyEffectNaviBar: UIView {
    
    var backBtnBlock : (() -> ())?
    
    init(title: String, frame: CGRect) {
        super.init(frame: frame)
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = NAVIBAR_FRAME
        addSubview(blurView)
        
        let visualEffectView = UIVisualEffectView(effect: UIVibrancyEffect(blurEffect: blurEffect))
        visualEffectView.frame = blurView.bounds
        blurView.contentView.addSubview(visualEffectView)
        
        let backBtnW : CGFloat = 40.0
        let titleLabel = UILabel(frame: CGRect(x: backBtnW, y: STATUSBAR_HEIGHT, width: SCREEN_WIDTH - backBtnW * 2, height: 44))
        titleLabel.textAlignment = NSTextAlignment.center
        titleLabel.text = title
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        visualEffectView.contentView.addSubview(titleLabel)
        
        let backBtn = UIButton(frame: CGRect(x: 0, y: STATUSBAR_HEIGHT, width: backBtnW, height: 44))
        backBtn.setImage(#imageLiteral(resourceName: "back_gray.png"), for: UIControlState.normal)
        backBtn.addTarget(self, action: #selector(backBtnClick(sender:)), for: UIControlEvents.touchUpInside)
        addSubview(backBtn)
    }
    
    @objc private func backBtnClick(sender: UIButton) {
        if let backBtnBlock = backBtnBlock {
            backBtnBlock()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
