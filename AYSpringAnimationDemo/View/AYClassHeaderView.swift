//
//  AYClassHeaderView.swift
//  AYSpringAnimationDemo
//
//  Created by wpsd on 2017/3/10.
//  Copyright © 2017年 wpsd. All rights reserved.
//

import UIKit

class AYClassHeaderView: UIView {
    
    var arrowView : UIImageView?
    var titleLabel : UILabel?
    
    var classModel : AYClassModel? {
        didSet{
            guard let classModel = classModel else { return }
            titleLabel?.text = classModel.className
        }
    }
    
    var headerViewClick : (() -> ())?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.white
        
        let btn = UIButton(frame: CGRect(x: -1, y: 4, width: SCREEN_WIDTH + 2, height: 26))
        btn.layer.borderColor = UIColor.gray.withAlphaComponent(0.25).cgColor
        btn.layer.borderWidth = 1
        btn.backgroundColor = UIColor.gray.withAlphaComponent(0.05)
        btn.addTarget(self, action: #selector(btnClick(sender:)), for: .touchUpInside)
        addSubview(btn)
        
        arrowView = UIImageView(image: #imageLiteral(resourceName: "arrows_next.png"))
        arrowView?.frame = CGRect(x: SCREEN_WIDTH - 25, y: 10, width: 10, height: 10)
        addSubview(arrowView!)
        
        titleLabel = UILabel(frame: CGRect(x: 10, y: 4, width: 100, height: 26))
        titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 12)
        addSubview(titleLabel!)
        
    }
    
    @objc private func btnClick(sender: UIButton) {
        guard let headerViewClick = headerViewClick else { return }
        headerViewClick()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
