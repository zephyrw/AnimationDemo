//
//  ViewController.swift
//  AYSpringAnimationDemo
//
//  Created by wpsd on 2017/3/2.
//  Copyright © 2017年 wpsd. All rights reserved.
//

import UIKit

class AYListViewController: UIViewController {
    
    var tableViewLoadData : Bool = false
    
    var scrollStartY : CGFloat = 0.0
    
    var titleArr = [UILabel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false
        view.addSubview(tableView)
        setupTitleView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        var indexPathArr = [IndexPath]()
        for i in 0..<50 {
            indexPathArr.append(IndexPath(row: i, section: 0))
        }
        if tableViewLoadData == true {
            return
        }
        tableViewLoadData = true
        tableView.insertRows(at: indexPathArr, with: UITableViewRowAnimation.fade)
    }
    
    private func setupTitleView() {
        
        let naviBarFrame = CGRect(origin: CGPoint.zero, size: CGSize(width: SCREEN_WIDTH, height: 64))
        
        let bgImageView = UIImageView(image: UIImage.diagonalImage(with: naviBarFrame.size, lineWidth: 2, lineCap: 7, fill: UIColor(white: 0.9715, alpha: 1)))
        bgImageView.frame = naviBarFrame
        view.addSubview(bgImageView)
        
        let titleLabel = UILabel(frame: naviBarFrame)
        titleLabel.textAlignment = NSTextAlignment.center
        let attrTitle = NSMutableAttributedString(string: "Animation", attributes: [NSForegroundColorAttributeName : UIColor(white: 0.4, alpha: 1), NSFontAttributeName : UIFont(name: "Avenir-Light", size: 28) ?? UIFont.systemFont(ofSize: 28)])
        attrTitle.addAttributes([NSForegroundColorAttributeName : UIColor(red: 55 / 255.0, green: 149 / 255.0, blue: 210 / 255.0, alpha: 1)], range: NSRange(location: 1, length: 1))
        titleLabel.attributedText = attrTitle
        view.addSubview(titleLabel)
        
        let lineView = UIView(frame: CGRect(x: 0, y: 64, width: SCREEN_WIDTH, height: 1))
        lineView.backgroundColor = UIColor(white: 0.8, alpha: 1)
        view.addSubview(lineView)
        
    }
    
    lazy var tableView : UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 64, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - 64), style: UITableViewStyle.plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        return tableView
    }()
    
    let listModels : [AYListModel] = [AYListModel(title: "POP-按钮动画", viewController: AYButtonPressViewController(), vcName:
                                          NSStringFromClass(AYButtonPressViewController.self)),
                                      AYListModel(title: "POP-Stroke动画", viewController: AYPopStrokeViewController(), vcName: NSStringFromClass(AYPopStrokeViewController.self)),
                                      AYListModel(title: "CAShapeLayer的path动画", viewController: AYCAShapeLayerPathViewController(), vcName: NSStringFromClass(AYCAShapeLayerPathViewController.self)),
                                      AYListModel(title: "图片碎片化mask动画", viewController: AYTransformFadeViewController(), vcName: NSStringFromClass(AYTransformFadeViewController.self)),
                                      AYListModel(title: "CAGradientLayer动画", viewController: AYGradientViewController(), vcName: NSStringFromClass(AYGradientViewController.self)),
                                      AYListModel(title: "POP-数值动画", viewController: AYPopNumberViewController(), vcName: NSStringFromClass(AYPopNumberViewController.self)),
                                      AYListModel(title: "Easing-圆环动画", viewController: AYCircleAnimationViewController(), vcName: NSStringFromClass(AYCircleAnimationViewController.self)),
                                      AYListModel(title: "UIScrollView视差效果动画", viewController: AYScrollImageViewController(), vcName: NSStringFromClass(AYScrollImageViewController.self)),
                                      AYListModel(title: "UIScrollView视差模糊效果", viewController: AYScrollBlurImageViewController(), vcName: NSStringFromClass(AYScrollBlurImageViewController.self)),
                                      AYListModel(title: "UITableView状态切换效果", viewController: AYTableViewTapAnimationViewController(), vcName: NSStringFromClass(AYTableViewTapAnimationViewController.self)),
                                      AYListModel(title: "POP-Spring动画参数详解", viewController: AYPopSpringParameterViewController(), vcName: NSStringFromClass(AYPopSpringParameterViewController.self)),
                                      AYListModel(title: "UITableView展开缩放动画", viewController: AYHeaderViewTapAnimationViewController(), vcName: NSStringFromClass(AYHeaderViewTapAnimationViewController.self)),
                                      AYListModel(title: "UITableView显示倒计时", viewController: AYCountDownTimerViewController(), vcName: NSStringFromClass(AYCountDownTimerViewController.self)),
                                      AYListModel(title: "时钟动画效果", viewController: AYClockViewController(), vcName: NSStringFromClass(AYClockViewController.self)),
                                      AYListModel(title: "绘制波形图动画", viewController: AYDrawWaveViewController(), vcName: NSStringFromClass(AYDrawWaveViewController.self)),
                                      AYListModel(title: "UILabel缩放动画", viewController: AYLabelScaleViewController(), vcName: NSStringFromClass(AYLabelScaleViewController.self))
                                      ]
}

// MARK: - tableView dataSource

extension AYListViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewLoadData ? 50 : 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = AYTitleCell.titleCell(tableView: tableView)
        if indexPath.row < listModels.count {
            cell.title = String(format: "%02d. ", indexPath.row + 1) + listModels[indexPath.row].title
            cell.subTitle = listModels[indexPath.row].vcName
        }else {
            cell.title = String(format: "%02d. 测试DEMO", indexPath.row + 1)
        }
        cell.backgroundColor = indexPath.row % 2 == 0 ? UIColor.white : UIColor(white: 0.9725, alpha: 1)
        return cell
    }
}

// MARK: - tableView delegate

extension AYListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row >= listModels.count { return }
        let item = listModels[indexPath.row]
        let vc = item.viewController
        vc.title = item.title
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        scrollStartY = scrollView.contentOffset.y
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let delta = scrollView.contentOffset.y - scrollStartY
        let visibleCells = tableView.visibleCells
        if visibleCells.count < 2 { return }
        var titleCell : AYTitleCell?
        if delta > 0 { // 向下
            if let lastCell = visibleCells.last as? AYTitleCell {
                titleCell = lastCell
            }
        }else {
            if let firstCell = visibleCells.first as? AYTitleCell {
                titleCell = firstCell
            }
        }
        guard let titleLabel = titleCell?.titleLabel else { return }
        if titleArr.contains(titleLabel) {
            return
        }
        titleArr.append(titleLabel)
        titleLabel.transform = CGAffineTransform(translationX: -10, y: 0)
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 10, options: UIViewAnimationOptions.layoutSubviews, animations: {
            titleLabel.transform = CGAffineTransform.identity
        }, completion:{ _ in
            if let index = self.titleArr.index(of: titleLabel) {
                self.titleArr.remove(at: index)
            }
        })
    }
}


