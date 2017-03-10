//
//  AYTransformFadeView.swift
//  AYSpringAnimationDemo
//
//  Created by wpsd on 2017/3/9.
//  Copyright © 2017年 wpsd. All rights reserved.
//

import UIKit

class AYTransformFadeView : UIView {
    
    var maskViews = [UIView]()
    
    private var imageView : UIImageView?
    
    var image : UIImage? {
        didSet{
            if let image = image {
                imageView?.image = image
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView = UIImageView(frame: bounds)
        addSubview(imageView!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildMaskView(horizontalCount : Int) {
        
        if horizontalCount < 1 {
            return
        }
        let maskViewContainer = UIView(frame: bounds)
        let maskWidth = SCREEN_WIDTH / CGFloat(horizontalCount)
        for index in 0..<horizontalCount {
            let maskView = UIView(frame: CGRect(x: CGFloat(index) * maskWidth, y: 0, width: maskWidth, height: SCREEN_HEIGHT))
            maskView.tag = index
            maskView.backgroundColor = UIColor.black
            maskViews.append(maskView)
            maskViewContainer.addSubview(maskView)
        }
        mask = maskViewContainer
    }
    
    func show(animate : Bool) {
        if maskViews.count < 1 { return }
        if animate {
            for maskView in maskViews {
                UIView.animate(withDuration: 0.5, delay: 0.075 * Double(maskView.tag), options: UIViewAnimationOptions.curveLinear, animations: {
                    maskView.alpha = 1
                }, completion: nil)
            }
        }else {
            for maskView in maskViews {
                maskView.alpha = 1
            }
        }
    }
    
    func fade(animate : Bool) {
        if maskViews.count < 1 { return }
        if animate {
            for maskView in maskViews {
                UIView.animate(withDuration: 0.5, delay: 0.075 * Double(maskView.tag), options: UIViewAnimationOptions.curveLinear, animations: {
                    maskView.alpha = 0
                }, completion: nil)
            }
        }else {
            for maskView in maskViews {
                maskView.alpha = 0
            }
        }
    }
    
}
