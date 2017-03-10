//
//  AYTableViewTapAnimationViewController.swift
//  AYSpringAnimationDemo
//
//  Created by wpsd on 2017/3/9.
//  Copyright © 2017年 wpsd. All rights reserved.
//

import UIKit

class AYTableViewTapAnimationViewController: UIViewController {
    
    let tapAnimationModels = [AYTapAnimationModel(name: "Zephyr", isSelected: false),
                              AYTapAnimationModel(name: "NoZuoNoDie", isSelected: false),
                              AYTapAnimationModel(name: "Animations", isSelected: false)
                              ]

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        view.addSubview(tableView)
        
        let naviBar = AYWhiteNaviBar(title: title ?? "", frame: NAVIBAR_FRAME)
        naviBar.backBtnBlock = {
            _ = self.navigationController?.popViewController(animated: true)
        }
        view.addSubview(naviBar)
        
    }
    
    private lazy var tableView : UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 64, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - 64))
        tableView.separatorStyle = .none
        tableView.rowHeight = 80
        tableView.backgroundColor = UIColor.white
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
}

extension AYTableViewTapAnimationViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tapAnimationModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = AYTableViewTapAnimationCell.cell(tableView: tableView)
        cell.tapAnimationModel = tapAnimationModels[indexPath.row]
        return cell
    }
    
}

extension AYTableViewTapAnimationViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? AYTableViewTapAnimationCell else { return }
        guard let tapAnimationModel = cell.tapAnimationModel else { return }
        guard let cellSelected = cell.cellSelected else { return }
        tapAnimationModel.isSelected = !tapAnimationModel.isSelected
        cellSelected(tapAnimationModel.isSelected)
    }
    
}
