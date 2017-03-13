//
//  AYLabelScaleViewController.swift
//  AYSpringAnimationDemo
//
//  Created by wpsd on 2017/3/13.
//  Copyright © 2017年 wpsd. All rights reserved.
//

import UIKit

class AYLabelScaleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.black
        
        setupUI()
        
        let naviBar = AYBlackNaviBar(title: title ?? "", frame: NAVIBAR_FRAME)
        naviBar.backBtnBlock = {
            _ = self.navigationController?.popViewController(animated: true)
        }
        view.addSubview(naviBar)
        
    }
    
    private func setupUI() {
        
    }

}
