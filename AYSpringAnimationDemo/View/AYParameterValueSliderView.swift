//
//  AYParameterValueSliderView.swift
//  AYSpringAnimationDemo
//
//  Created by wpsd on 2017/3/9.
//  Copyright © 2017年 wpsd. All rights reserved.
//

import UIKit

class AYParameterValueSliderView: UIView {
    
    var currentValue : CGFloat?
    
    private var currentValueLabel : UILabel?

    init(frame: CGRect, title: String, minValue: Float, maxValue: Float, defaultValue: CGFloat) {
        super.init(frame: frame)
        
        currentValue = defaultValue
        
        let titleLabel = UILabel(frame: CGRect(x: 3, y: 0, width: 100, height: 20))
        titleLabel.font = UIFont(name: "Heiti SC", size: 10)
        titleLabel.text = title
        addSubview(titleLabel)
        
        currentValueLabel = UILabel(frame: CGRect(x: frame.width - 103, y: 0, width: 100, height: 20))
        currentValueLabel?.font = titleLabel.font
        currentValueLabel?.textAlignment = .right
        currentValueLabel?.text = String(format: "%.2f", defaultValue)
        addSubview(currentValueLabel!)
        
        let slideView = UISlider(frame: CGRect(x: 2, y: 15, width: frame.width - 4, height: 10))
        slideView.minimumValue = minValue
        slideView.maximumValue = maxValue
        slideView.minimumTrackTintColor = UIColor.black.withAlphaComponent(0.1)
        slideView.maximumTrackTintColor = UIColor.gray.withAlphaComponent(0.05)
        slideView.setThumbImage(UIImage(named: "slider"), for: .normal)
        slideView.setThumbImage(UIImage(named: "slider"), for: .highlighted)
        slideView.addTarget(self, action: #selector(sliderValueChange(slider:)), for: .valueChanged)
        slideView.value = Float(defaultValue)
        addSubview(slideView)
    }
    
    @objc private func sliderValueChange(slider: UISlider) {
        currentValue = CGFloat(slider.value)
        currentValueLabel?.text = String(format: "%.2f", slider.value)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
