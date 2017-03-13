//
//  AYDrawWaveViewController.swift
//  AYSpringAnimationDemo
//
//  Created by wpsd on 2017/3/13.
//  Copyright © 2017年 wpsd. All rights reserved.
//

import UIKit

class AYDrawWaveViewController: UIViewController {
    
    private var drawView : UIView?
    private var drawLineView : UIView?
    
    lazy private var link : CADisplayLink = {
        let link = CADisplayLink(target: self, selector: #selector(draw))
        return link
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        setupUI()
        
        let naviBar = AYWhiteNaviBar(title: title ?? "", frame: NAVIBAR_FRAME)
        naviBar.backBtnBlock = {
            _ = self.navigationController?.popViewController(animated: true)
        }
        view.addSubview(naviBar)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        link.invalidate()
    }
    
    private func setupUI() {
        
        drawView = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 200))
        drawView?.center = CGPoint(x: view.center.x, y: view.center.y + 100)
        view.addSubview(drawView!)
        drawView?.setNeedsDisplay()
        
        drawLineView = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 200))
        drawLineView?.center = CGPoint(x: view.center.x, y: view.center.y - 100)
        view.addSubview(drawLineView!)
        
        link.add(to: RunLoop.current, forMode: .commonModes)
        
    }

    @objc private func draw() {
        
        guard let drawView = drawView else { return }
        guard let drawLineView = drawLineView else { return }
        drawView.setNeedsDisplay()
        drawLineView.setNeedsDisplay()
        
    }

}
