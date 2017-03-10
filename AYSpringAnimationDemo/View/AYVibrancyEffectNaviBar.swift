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
        
        let titleLabel = UILabel(frame: visualEffectView.bounds)
        titleLabel.textAlignment = NSTextAlignment.center
        titleLabel.text = title
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        visualEffectView.contentView.addSubview(titleLabel)
        
        let backBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 64))
        backBtn.setImage(#imageLiteral(resourceName: "back_black.png"), for: UIControlState.normal)
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
