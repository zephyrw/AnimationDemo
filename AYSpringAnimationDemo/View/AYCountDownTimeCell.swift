//
//  AYCountDownTimeCell.swift
//  AYSpringAnimationDemo
//
//  Created by wpsd on 2017/3/13.
//  Copyright © 2017年 wpsd. All rights reserved.
//

import UIKit

class AYCountDownTimeCell: UITableViewCell {

    private var titleLabel : UILabel?
    private var timeLabbel : UILabel?
    
    static let cellID = NSStringFromClass(AYCountDownTimeCell.self)
    
    var timeModel : AYTimeModel? {
        didSet{
            guard let timeModel = timeModel else { return }
            titleLabel?.text = timeModel.title
            timeLabbel?.text = timeModel.timeStr
        }
    }

    class func cell(tableView: UITableView) -> AYCountDownTimeCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID) as? AYCountDownTimeCell
        if cell == nil {
            cell = AYCountDownTimeCell(style: .value2, reuseIdentifier: cellID)
        }
        return cell!
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        titleLabel = UILabel(frame: CGRect(x: 15, y: 10, width: SCREEN_WIDTH - 20, height: 40))
        titleLabel?.textColor = UIColor.gray
        titleLabel?.font = UIFont(name: "HYQiHei-BEJF", size: 20)
        contentView.addSubview(titleLabel!)
        
        timeLabbel = UILabel(frame: CGRect(x: 10, y: 10, width: SCREEN_WIDTH - 20, height: 40))
        timeLabbel?.textColor = UIColor.gray
        timeLabbel?.textAlignment = .right
        timeLabbel?.font = UIFont(name: "Avenir-Light", size: 15)
        contentView.addSubview(timeLabbel!)
        
        NotificationCenter.default.addObserver(self, selector: #selector(countDownEvent(noti:)), name: NSNotification.Name.init(rawValue: COUNT_DOWN_TIME_NOTIFICATION), object: nil)
        
    }
    
    @objc private func countDownEvent(noti: Notification) {
        guard let timeModel = timeModel else { return }
        titleLabel?.text = timeModel.title
        timeLabbel?.text = timeModel.timeStr
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
