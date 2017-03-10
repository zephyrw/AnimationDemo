//
//  AYGradientView.swift
//  AYSpringAnimationDemo
//
//  Created by wpsd on 2017/3/9.
//  Copyright © 2017年 wpsd. All rights reserved.
//

import UIKit

class AYGradientView : UIView {
    
    private var imageView : UIImageView?
    
    var image : UIImage? {
        didSet{
            if let image = image {
                imageView?.image = image
            }
        }
    }
    
    var gradientMaskView : UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView = UIImageView(frame: bounds)
        addSubview(imageView!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildMaskView() {
        
        gradientMaskView = UIView(frame: CGRect(x: -SCREEN_WIDTH, y: 0, width: SCREEN_WIDTH * 2, height: SCREEN_HEIGHT))
        gradientMaskView?.layer.addSublayer(gradientLayer)
        mask = gradientMaskView
    }
    
    func show(animate : Bool) {
        guard let maskView = gradientMaskView else { return }
        if animate {
            UIView.animate(withDuration: 2, animations: {
                maskView.transform = CGAffineTransform.identity
            })
        }else {
            maskView.transform = CGAffineTransform.identity
        }
    }
    
    func fade(animate : Bool) {
        guard let maskView = gradientMaskView else { return }
        if animate {
            UIView.animate(withDuration: 2, animations: {
                maskView.transform = CGAffineTransform(translationX: SCREEN_WIDTH * 1.5, y: 0)
            })
        }else {
            maskView.transform = CGAffineTransform(translationX: SCREEN_WIDTH * 1.5, y: 0)
        }
    }
    
    private lazy var gradientLayer : CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = (self.gradientMaskView?.bounds)!
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.3, 0.4]
        return gradientLayer
    }()
    
}
