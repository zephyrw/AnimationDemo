//
//  AYScaleLabel.swift
//  AYSpringAnimationDemo
//
//  Created by wpsd on 2017/3/13.
//  Copyright © 2017年 wpsd. All rights reserved.
//

import UIKit

class AYScaleLabel: UIView {

    var text : String?
    var startScale : CGFloat?
    var endScale : CGFloat?
    var backLabelColor : UIColor?
    var colorLabelColor : UIColor?
    var font : UIFont?
    
    private var backLabel: UILabel?
    private var colorLabel: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backLabel = UILabel(frame: bounds)
        colorLabel = UILabel(frame: bounds)
        
        backLabel?.alpha = 0
        colorLabel?.alpha = 0
        
        backLabel?.textAlignment = .center
        colorLabel?.textAlignment = .center
        
        addSubview(backLabel!)
        addSubview(colorLabel!)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
