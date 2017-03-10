//
//  AYScrollBlurImageViewController.swift
//  AYSpringAnimationDemo
//
//  Created by wpsd on 2017/3/9.
//  Copyright © 2017年 wpsd. All rights reserved.
//

import UIKit

class AYScrollBlurImageViewController: UIViewController, UIScrollViewDelegate {

    private let tagAdditional = 100
    
    private let images = [UIImage(named: "beauty"),
                          UIImage(named: "beauty")?.blur(),
                          UIImage(named: "beauty")?.grayScale()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        setupUI()
        
        let naviBar = AYVibrancyEffectNaviBar(title: title ?? "", frame: NAVIBAR_FRAME)
        naviBar.backBtnBlock = {
            _ = self.navigationController?.popViewController(animated: true)
        }
        view.addSubview(naviBar)
    }
    
    private func setupUI() {
        
        let scrollView = UIScrollView(frame: view.bounds)
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = false
        scrollView.delegate = self
        for index in 0..<images.count {
            let containerView = AYImageContainerView(frame: CGRect(x: CGFloat(index) * SCREEN_WIDTH, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT))
            containerView.layer.borderWidth = 0.25
            containerView.layer.borderColor = UIColor.gray.withAlphaComponent(0.25).cgColor
            containerView.imageView?.image = images[index]
            containerView.tag = index + tagAdditional
            scrollView.addSubview(containerView)
        }
        scrollView.contentSize = CGSize(width: SCREEN_WIDTH * CGFloat(images.count), height: SCREEN_HEIGHT)
        view.addSubview(scrollView)
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetX = scrollView.contentOffset.x
        for index in 0..<images.count {
            guard let containerView = scrollView.viewWithTag(index + tagAdditional) as? AYImageContainerView else { return }
            containerView.imageView?.transform = CGAffineTransform(translationX: contentOffsetX - CGFloat(index) * SCREEN_WIDTH, y: 0)
        }
    }

}
