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
        
        let naviBar = AYWhiteNaviBar(title: title ?? "", frame: NAVIBAR_FRAME)
        naviBar.backBtnBlock = {
            _ = self.navigationController?.popViewController(animated: true)
        }
        view.addSubview(naviBar)
        
    }
    
    private let dataArr = [["className" : "Aitna",
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
