//
//  AYImageContainerView.swift
//  AYSpringAnimationDemo
//
//  Created by wpsd on 2017/3/9.
//  Copyright © 2017年 wpsd. All rights reserved.
//

import UIKit

class AYImageContainerView : UIView {
    
    var imageView : UIImageView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 0.5
        clipsToBounds = true
        
        imageView = UIImageView(frame: CGRect(x: -50, y: 0, width: frame.width + 100, height: frame.height))
        imageView?.contentMode = .scaleAspectFill
        addSubview(imageView!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
