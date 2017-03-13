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
        
        let titleLabel = UILabel(frame: NAVIBAR_FRAME)
        titleLabel.backgroundColor = UIColor.black
        titleLabel.textColor = UIColor.white
        titleLabel.textAlignment = NSTextAlignment.center
        titleLabel.text = title
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        addSubview(titleLabel)
        
        let backBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 64))
        backBtn.setImage(#imageLiteral(resourceName: "back_white.png"), for: UIControlState.normal)
        backBtn.addTarget(self, action: #selector(backBtnClick(sender:)), for: UIControlEvents.touchUpInside)
        addSubview(backBtn)
        
        let lineView = UIView(frame: CGRect(x: 0, y: 64, width: SCREEN_WIDTH, height: 1))
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
