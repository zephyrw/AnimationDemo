//
//  AYTransformFadeViewController.swift
//  AYSpringAnimationDemo
//
//  Created by wpsd on 2017/3/7.
//  Copyright © 2017年 wpsd. All rights reserved.
//

import UIKit

enum AYFadeImageType : Int {
    case first = 0
    case second
}

class AYTransformFadeViewController: UIViewController {
    
    private let images = [UIImage(named: "1.jpg"),
                  UIImage(named: "2.jpg"),
                  UIImage(named: "3.jpg"),
                  UIImage(named: "4.jpg"),
                  UIImage(named: "5.jpg")]
    
    private var currentImageIndex : Int = 0
    
    private var fadeImageType = AYFadeImageType.first

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        view.addSubview(firstImageView)
        view.addSubview(secondImageView)
        RunLoop.current.add(Timer(timeInterval: 4, target: self, selector: #selector(transitionFadeAnimate), userInfo: nil, repeats: true), forMode: RunLoopMode.commonModes)
        let naviBar = AYVibrancyEffectNaviBar(title: title ?? "", frame: NAVIBAR_FRAME)
        naviBar.backBtnBlock = {
            _ = self.navigationController?.popViewController(animated: true)
        }
        view.addSubview(naviBar)
    }
    
    
    @objc private func transitionFadeAnimate() {
        if fadeImageType == AYFadeImageType.first {
            fadeImageType = AYFadeImageType.second
            view.sendSubview(toBack: secondImageView)
            secondImageView.image = nextImage()
            secondImageView.show(animate: false)
            firstImageView.fade(animate: true)
        }else {
            fadeImageType = AYFadeImageType.first
            view.sendSubview(toBack: firstImageView)
            firstImageView.image = nextImage()
            firstImageView.show(animate: false)
            secondImageView.fade(animate: true)
        }
    }
    
    private func nextImage() -> UIImage {
        if currentImageIndex >= images.count {
            currentImageIndex = 0
        }
        let image = images[currentImageIndex]! as UIImage
        currentImageIndex += 1
        return image
    }

    private lazy var firstImageView : AYTransformFadeView = {
        let imageView = AYTransformFadeView(frame: self.view.bounds)
        imageView.buildMaskView(horizontalCount: 12)
        imageView.image = self.nextImage()
        return imageView
    }()
    
    private lazy var secondImageView : AYTransformFadeView = {
        let imageView = AYTransformFadeView(frame: self.view.bounds)
        imageView.buildMaskView(horizontalCount: 12)
        return imageView
    }()
}
