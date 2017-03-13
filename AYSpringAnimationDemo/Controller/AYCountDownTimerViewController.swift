//
//  AYCountDownTimerViewController.swift
//  AYSpringAnimationDemo
//
//  Created by wpsd on 2017/3/13.
//  Copyright © 2017年 wpsd. All rights reserved.
//

import UIKit

class AYCountDownTimerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        view.addSubview(tableView)
        
        RunLoop.current.add(Timer.init(timeInterval: 1, target: self, selector: #selector(timerEvent), userInfo: nil, repeats: true), forMode: .commonModes)
        
        let naviBar = AYWhiteNaviBar(title: title ?? "", frame: NAVIBAR_FRAME)
        naviBar.backBtnBlock = {
            _ = self.navigationController?.popViewController(animated: true)
        }
        view.addSubview(naviBar)
        
    }
    
    @objc private func timerEvent() {
    
        for timeModel in times {
            timeModel.countDownTime! -= 1
        }
        NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: COUNT_DOWN_TIME_NOTIFICATION)))
    }

    private lazy var tableView : UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 64, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - 64))
        tableView.separatorStyle = .none
        tableView.rowHeight = 60
        tableView.backgroundColor = UIColor.white
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    lazy var times : [AYTimeModel] = {
        var times = [AYTimeModel]()
        times.append(self.timeModel(title: "Zephyr", countDownTime: 20034))
        times.append(self.timeModel(title: "Aaron", countDownTime: 31))
        times.append(self.timeModel(title: "Nicholas", countDownTime: 1003))
        times.append(self.timeModel(title: "Nathaniel", countDownTime: 8089))
        times.append(self.timeModel(title: "Quentin", countDownTime: 394))
        times.append(self.timeModel(title: "Samirah", countDownTime: 345345))
        times.append(self.timeModel(title: "Serafina", countDownTime: 233))
        times.append(self.timeModel(title: "Shanon", countDownTime: 4649))
        times.append(self.timeModel(title: "Sophie", countDownTime: 3454))
        times.append(self.timeModel(title: "Steven", countDownTime: 54524))
        times.append(self.timeModel(title: "Saadiya", countDownTime: 235))
        return times
    }()
    
    private func timeModel(title: String, countDownTime: Int) -> AYTimeModel {
        let timeModel = AYTimeModel()
        timeModel.title = title
        timeModel.countDownTime = countDownTime
        return timeModel
    }
    
}

extension AYCountDownTimerViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return times.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = AYCountDownTimeCell.cell(tableView: tableView)
        cell.timeModel = times[indexPath.row]
        return cell
    }
    
}

extension AYCountDownTimerViewController: UITableViewDelegate {
    
}

