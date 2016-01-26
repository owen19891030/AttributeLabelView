//
//  ViewController.swift
//  LabelVIew
//
//  Created by YaoQiang on 16/1/25.
//  Copyright © 2016年 YaoQiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let attributeLabelView = AttributeLabelView(frame: CGRect(x: 30, y: 100, width: 300, height: 100))

        attributeLabelView.horizontalSpace = 10
        view.addSubview(attributeLabelView)
        attributeLabelView.selecteEnable = false
        attributeLabelView.title = "种类"
        attributeLabelView.titleColor = UIColor.blackColor()
        attributeLabelView.titleFont = UIFont.systemFontOfSize(20)
        attributeLabelView.textData = ["小型车紧凑型车", "中型车", "中大型车", "SUV/越野车","商务车"];
        attributeLabelView.setupUI()



    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    func didClickLabel(text: String,index:Int) {
//        print(text)
//        print(index)
//    }
}

