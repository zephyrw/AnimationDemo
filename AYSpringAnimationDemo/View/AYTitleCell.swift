//
//  AYTitleCell.swift
//  AYSpringAnimationDemo
//
//  Created by wpsd on 2017/3/3.
//  Copyright © 2017年 wpsd. All rights reserved.
//

import UIKit

class AYTitleCell: UITableViewCell {
    
    private static let cellID = "TableViewCellID"
    
    var titleLabel : UILabel?
    private var subTitleLabel : UILabel?
    var title : String? {
        didSet {
            guard let title = title else { return }
            guard let titleLabel = titleLabel else { return }
            let seprArr = title.components(separatedBy: ".")
            if seprArr.count < 2 { return }
            guard let numStr = seprArr.first else { return }
            let attrStr = NSMutableAttributedString(string: title, attributes: [NSFontAttributeName : UIFont(name: "Avenir", size: 16) ?? UIFont.systemFont(ofSize: 16), NSForegroundColorAttributeName : UIColor(white: 0.5, alpha: 1)])
            attrStr.addAttributes([NSForegroundColorAttributeName : UIColor.red.withAlphaComponent(0.7), NSFontAttributeName : UIFont(name: "Helvetica-Oblique", size: 16) ?? UIFont.systemFont(ofSize: 16)], range: NSRange(location: 0, length: numStr.lengthOfBytes(using: String.Encoding.utf8) + 1))
            titleLabel.attributedText = attrStr
        }
    }
    var subTitle : String? {
        didSet {
            guard let subTitle = subTitle else { return }
            guard let subTitleLabel = subTitleLabel else { return }
            subTitleLabel.text = subTitle
        }
    }
    
    class func titleCell(tableView: UITableView) -> AYTitleCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: AYTitleCell.cellID)
        if cell == nil {
            cell = AYTitleCell(style: UITableViewCellStyle.value2, reuseIdentifier: AYTitleCell.cellID)
        }
        return cell! as! AYTitleCell;
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = UITableViewCellSelectionStyle.none
        self.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        
        titleLabel = UILabel(frame: CGRect(x: 10, y: 0, width: SCREEN_WIDTH - 10, height: 50))
        guard let titleLabel = titleLabel else { return }
        contentView.addSubview(titleLabel)
        
        subTitleLabel = UILabel(frame: CGRect(x: 10, y: titleLabel.frame.height - 15, width: SCREEN_WIDTH - 10, height: 10))
        guard let subTitleLabel = subTitleLabel else { return }
        subTitleLabel.font = UIFont.systemFont(ofSize: 10)
        subTitleLabel.textColor = UIColor.lightGray
        contentView.addSubview(subTitleLabel)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

