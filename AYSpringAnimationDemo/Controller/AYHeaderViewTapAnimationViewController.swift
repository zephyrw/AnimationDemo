//
//  AYHeaderViewTapAnimationViewController.swift
//  AYSpringAnimationDemo
//
//  Created by wpsd on 2017/3/10.
//  Copyright © 2017年 wpsd. All rights reserved.
//

import UIKit

class AYHeaderViewTapAnimationViewController: UIViewController {

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
        tableView.rowHeight = 50
        tableView.sectionHeaderHeight = 30
        tableView.backgroundColor = UIColor.white
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    lazy var classes : [AYClassModel] = {
        var classes = [AYClassModel]()
        for dict in self.dataArr {
            classes.append(AYClassModel(dict: dict))
        }
        return classes
    }()
    
    let dataArr : [[String : Any]] = [["className" : "Aitna",
                    "students"  : [["name" : "Y.X.M.",   "age" : 27],
                                   ["name" : "Leif",     "age" : 12],
                                   ["name" : "Lennon",   "age" : 23],
                                   ["name" : "Lambert",  "age" : 19],
                                   ["name" : "Jerome",   "age" : 19],
                                   ["name" : "Isidore",  "age" : 19]]],
                   ["className" : "Melete",
                    "students"  : [["name" : "Merle",    "age" : 34],
                                   ["name" : "Paddy",    "age" : 31],
                                   ["name" : "Perry",    "age" : 10],
                                   ["name" : "Philip",   "age" : 39]]],
                   ["className" : "Aoede",
                    "students"  : [["name" : "Verne",    "age" : 34],
                                   ["name" : "Vincent",  "age" : 78],
                                   ["name" : "Walter",   "age" : 43],
                                   ["name" : "Zachary",  "age" : 21]]],
                   ["className" : "Dione",
                    "students"  : [["name" : "Timothy",  "age" : 98],
                                   ["name" : "Roderick", "age" : 21],
                                   ["name" : "Quentin",  "age" : 7],
                                   ["name" : "Paddy",    "age" : 67]]],
                   ["className" : "Adanos",
                    "students"  : [["name" : "Mortimer", "age" : 23],
                                   ["name" : "Michael",  "age" : 45],
                                   ["name" : "Kevin",    "age" : 89],
                                   ["name" : "Jeremy",   "age" : 23]]],];
}

extension AYHeaderViewTapAnimationViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return classes.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let classModel = classes[section]
        guard let students = classModel.students else { return 0 }
        return classModel.isExpand! ? students.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = AYStudentInfoCell.cell(tableView: tableView)
        if let students = classes[indexPath.section].students {
            cell.student = students[indexPath.row] as? AYStudentModel
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = AYClassHeaderView()
        let classModel = classes[section]
        headerView.classModel = classModel
        headerView.headerViewClick = {
            classModel.isExpand = !classModel.isExpand!
            var indexPaths = [IndexPath]()
            guard let students = classModel.students else { return }
            for index in 0..<students.count {
                indexPaths.append(IndexPath(row: index, section: section))
            }
            if !classModel.isExpand! {
                tableView.deleteRows(at: indexPaths, with: .fade)
                UIView.animate(withDuration: 0.2, animations: {
                    headerView.titleLabel?.transform = CGAffineTransform.identity
                    headerView.titleLabel?.textColor = UIColor.black
                    headerView.arrowView?.transform = CGAffineTransform.identity
                })
            }else {
                tableView.insertRows(at: indexPaths, with: .fade)
                UIView.animate(withDuration: 0.2, animations: {
                    headerView.titleLabel?.transform = CGAffineTransform(translationX: 10, y: 0)
                    headerView.titleLabel?.textColor = UIColor.red
                    headerView.arrowView?.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_2))
                })
            }
        }
        return headerView
    }
    
}

extension AYHeaderViewTapAnimationViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? AYStudentInfoCell else { return }
        guard let cellSelected = cell.cellSelected else { return }
        cellSelected()
    }
    
}
