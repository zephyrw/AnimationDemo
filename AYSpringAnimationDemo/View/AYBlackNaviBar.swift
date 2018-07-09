//
//  AYBlackNaviBar.swift
//  AYSpringAnimationDemo
//
//  Created by wpsd on 2017/3/13.
//  Copyright © 2017年 wpsd. All rights reserved.
//

import UIKit

class AYBlackNaviBar: UIView {

    var backBtnBlock : (() -> ())?
    
    init(title: String, frame: CGRect) {
        super.init(frame: frame)
        
        let backBtnW : CGFloat = 40.0
        let titleLabel = UILabel(frame: CGRect(x: backBtnW, y: STATUSBAR_HEIGHT, width: SCREEN_WIDTH - backBtnW * 2, height: 44))
        titleLabel.backgroundColor = UIColor.black
        titleLabel.textColor = UIColor.white
        titleLabel.textAlignment = NSTextAlignment.center
        titleLabel.text = title
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        addSubview(titleLabel)
        
        let backBtn = UIButton(frame: CGRect(x: 0, y: STATUSBAR_HEIGHT, width: backBtnW, height: 44))
        backBtn.setImage(#imageLiteral(resourceName: "back_white.png"), for: UIControlState.normal)
        backBtn.addTarget(self, action: #selector(backBtnClick(sender:)), for: UIControlEvents.touchUpInside)
        addSubview(backBtn)
        
        let lineView = UIView(frame: CGRect(x: 0, y: NAVIBAR_FRAME.height, width: SCREEN_WIDTH, height: 1))
        lineView.backgroundColor = UIColor(white: 0.2, alpha: 1)
        addSubview(lineView)
        
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
