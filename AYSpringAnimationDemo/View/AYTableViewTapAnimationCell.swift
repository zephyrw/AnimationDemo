//
//  AYTableViewTapAnimationCell.swift
//  AYSpringAnimationDemo
//
//  Created by wpsd on 2017/3/9.
//  Copyright © 2017年 wpsd. All rights reserved.
//

import UIKit

class AYTableViewTapAnimationCell: UITableViewCell {
    
    private var squareView : UIView?
    private var iconView : UIImageView?
    private var nameLabel : UILabel?
    private var lineView : UIView?
    
    var cellSelected : ((_ isSelected : Bool) -> ())?
    
    var tapAnimationModel : AYTapAnimationModel? {
        didSet{
            guard let tapModel = tapAnimationModel else { return }
            nameLabel?.text = tapModel.name
        }
    }

    static let cellID = NSStringFromClass(AYTableViewTapAnimationCell.self)
    
    class func cell(tableView: UITableView) -> AYTableViewTapAnimationCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID) as? AYTableViewTapAnimationCell
        if cell == nil {
            cell = AYTableViewTapAnimationCell(style: .value2, reuseIdentifier: cellID)
        }
        return cell!
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        backgroundColor = UIColor.white
        
        squareView = UIView(frame: CGRect(x: SCREEN_WIDTH - 60, y: 23, width: 35, height: 35))
        squareView?.layer.borderWidth = 1
        squareView?.layer.borderColor = UIColor.gray.cgColor
        addSubview(squareView!)
        
        iconView = UIImageView(image: UIImage(named: "plane"))
        iconView?.frame = CGRect(x: SCREEN_WIDTH - 62, y: 20, width: 40, height: 40)
        iconView?.alpha = 0
        addSubview(iconView!)
        
        nameLabel = UILabel(frame: CGRect(x: 30, y: 10, width: 300, height: 60))
        nameLabel?.font = UIFont(name: "Avenir", size: 20)
        nameLabel?.textColor = UIColor.gray
        addSubview(nameLabel!)
        
        lineView = UIView(frame: CGRect(x: 30, y: 70, width: 0, height: 2))
        lineView?.alpha = 0
        lineView?.backgroundColor = UIColor.red
        addSubview(lineView!)
        
        cellSelected = { isSelected in
            self.selectStateChangeAnimation()
            isSelected ? self.selectedAnimation() : self.unselectedAnimation()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func selectStateChangeAnimation() {
        
        let cyanView = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 80))
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
    
    private func selectedAnimation() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 7, initialSpringVelocity: 4, options: .curveEaseInOut, animations: {
            
            self.lineView?.frame = CGRect(x: 30, y: 70, width: 200, height: 2)
            self.lineView?.alpha = 1
            
            self.nameLabel?.transform = CGAffineTransform(translationX: 50, y: 0)
            self.iconView?.alpha = 1
            
            self.squareView?.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            self.squareView?.layer.borderColor = UIColor.red.cgColor
            self.squareView?.layer.cornerRadius = 4
            
        }, completion: nil)
    }
    
    private func unselectedAnimation() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 7, initialSpringVelocity: 4, options: .curveEaseInOut, animations: {
            
            self.lineView?.frame = CGRect(x: 30, y: 70, width: 0, height: 2)
            self.lineView?.alpha = 0
            
            self.nameLabel?.transform = CGAffineTransform.identity
            self.iconView?.alpha = 0
            
            self.squareView?.transform = CGAffineTransform.identity
            self.squareView?.layer.borderColor = UIColor.gray.cgColor
            self.squareView?.layer.cornerRadius = 0
            
        }, completion: nil)
    }

}
