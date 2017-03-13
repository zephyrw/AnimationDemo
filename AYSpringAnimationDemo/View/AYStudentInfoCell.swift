//
//  AYStudentInfoCell.swift
//  AYSpringAnimationDemo
//
//  Created by wpsd on 2017/3/10.
//  Copyright © 2017年 wpsd. All rights reserved.
//

import UIKit

class AYStudentInfoCell: UITableViewCell {
    
    private var nameLabel : UILabel?
    private var ageLabel : UILabel?
    var cellSelected: (() -> ())?
    
    static let cellID : String = NSStringFromClass(AYStudentInfoCell.self) as String

    var student : AYStudentModel? {
        didSet{
            guard let student = student else { return }
            nameLabel?.text = student.name
            ageLabel?.text = "\(student.age!)"
        }
    }
    
    class func cell(tableView: UITableView) -> AYStudentInfoCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID) as? AYStudentInfoCell
        if cell == nil {
            cell = AYStudentInfoCell(style: .value2, reuseIdentifier: cellID)
        }
        return cell!
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        backgroundColor = UIColor.white
        
        nameLabel = UILabel(frame: CGRect(x: 20, y: 0, width: 200, height: 50))
        nameLabel?.font = UIFont(name: "AppleSDGothicNeo-Thin", size: 20) ?? UIFont.systemFont(ofSize: 20)
        contentView.addSubview(nameLabel!)
        
        ageLabel = UILabel(frame: CGRect(x: SCREEN_WIDTH - 220, y: 0, width: 200, height: 50))
        ageLabel?.textAlignment = .right
        ageLabel?.font = nameLabel?.font
        contentView.addSubview(ageLabel!)
        
        cellSelected = {
            self.selectStateChangeAnimation()
        }
        
    }
    
    private func selectStateChangeAnimation() {
        
        let cyanView = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 50))
        cyanView.backgroundColor = UIColor.cyan.withAlphaComponent(0.2)
        cyanView.alpha = 0
        addSubview(cyanView)
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
            cyanView.alpha = 0.8
        }) { (_) in
            UIView.animate(withDuration: 0.2, delay: 0.1, options: .curveEaseOut, animations: {
                cyanView.alpha = 0
            }, completion: { (_) in
                cyanView.removeFromSuperview()
            })
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
