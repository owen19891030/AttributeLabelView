//
//  AttributeLabelView.swift
//  LabelVIew
//
//  Created by YaoQiang on 16/1/25.
//  Copyright © 2016年 YaoQiang. All rights reserved.
//

import UIKit

/**
 *  代理
 */
@objc
protocol AttributeLabelViewDelegate: NSObjectProtocol {
    
   optional func didClickLabel(text:String, index:Int)
    
}


class AttributeLabelView: UIView {
    
    /// 横向间距
    var horizontalSpace:CGFloat = 10.0
    /// 纵向间距
    var verticalSpace:CGFloat = 10.0
    /// 左边空隙距离
    var margin:CGFloat = 20.0
    
    
    /// 标签文字
    var textData:[String]?;
    /// 标签字体
    var textFont = UIFont.systemFontOfSize(15)
    /// 标签文字颜色
    var textColor = UIColor.whiteColor()
    /// 标签背景颜色
    var textBackgorund = UIColor.lightGrayColor()
    /// 选中颜色
    var selecteColor = UIColor.orangeColor()
    /// 是否可以选中,默认是
    var selecteEnable = true

    
    
    ///
    var title:String?
    ///
    var titleFont = UIFont.systemFontOfSize(15)
    ///
    var titleColor = UIColor.grayColor()
    
    
    
    /// 代理
    weak var delegate:AttributeLabelViewDelegate?
    
    
    private var btnClick:UIButton!
    private var label:UILabel?
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func setupUI() {
        remove()
        if title != nil {
            setLabel(title!, titleFont: titleFont, titleColor: titleColor)
        }
        if textData != nil {
            attributeLabelView(textData!, textFont:textFont, viewWidth: frame.width)
        }
        
    }
    
    
}



// MARK: - 点击方法
extension AttributeLabelView {
    
    func btnClick(sender:UIButton) {
        if btnClick == nil {
            btnClick = sender
        }
        if !btnClick.isEqual(sender) {
            btnClick.backgroundColor = UIColor.lightGrayColor()
            btnClick.selected = false
        }
        sender.backgroundColor = UIColor.orangeColor()
        sender.selected = true
        btnClick = sender
        
        if delegate != nil {
            delegate?.didClickLabel!(sender.currentTitle!, index: sender.tag - 100)
        }
    }
}

// MARK: - 私有方法
extension AttributeLabelView {
    private  func setLabel(title:String, titleFont:UIFont, titleColor:UIColor) {
        label = UILabel()
        label!.text = title
        label!.textColor = titleColor
        label!.textAlignment = NSTextAlignment.Left
        let size = NSString(string: title).sizeWithAttributes([NSFontAttributeName:titleFont])
        label!.frame = CGRectMake(10, 10, size.width + 10, size.height)
        addSubview(label!)
    }
    
    private func attributeLabelView(texts:[String], textFont:UIFont,viewWidth:CGFloat) {
        
        var horizontalWidth:CGFloat = 0
        var vertical:CGFloat = 0
        var index = -1
        
        
        for str in texts {
            index++;
            let button = UIButton()
            let size = NSString(string: str).sizeWithAttributes([NSFontAttributeName:textFont]);
            
            button.frame.size.width = size.width + 10
            button.frame.size.height = size.height
            if index == 0 {
                button.frame.origin.x = margin
                
            }else {
                
                button.frame.origin.x = horizontalWidth + horizontalSpace
            }
            
            if button.frame.origin.x + button.frame.size.width > viewWidth {
                horizontalWidth = 0
                vertical++
                button.frame.origin.x = margin
            }
            
            button.frame.origin.y = verticalSpace + vertical * (CGRectGetMaxY(button.frame) + horizontalSpace)
            
            if label != nil {
                button.frame.origin.y = CGRectGetMaxY(label!.frame) + button.frame.origin.y
            }
            horizontalWidth = CGRectGetMaxX(button.frame)
            
            button.layer.masksToBounds = true
            button.layer.cornerRadius = button.frame.height/2
            button.clipsToBounds = true
            button.setTitle(str, forState: .Normal)
            button.titleLabel?.font = textFont
            button.addTarget(self, action: "btnClick:", forControlEvents: .TouchUpInside)
            button.backgroundColor = textBackgorund
            button.setTitleColor(textColor, forState: .Normal)
            button.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Center
            button.userInteractionEnabled = true
            button.titleLabel?.textAlignment = NSTextAlignment.Center
            button.enabled = selecteEnable
            button.tag = 100 + index
            addSubview(button)
            
            if index == texts.count - 1 {
                self.frame.size.height = CGRectGetMaxY(button.frame) + 10
            }
            
        }
    }
    
    private func remove() {
        for subV in subviews {
            subV.removeFromSuperview()
        }
    }
    
    override func removeFromSuperview() {
        remove()
        super.removeFromSuperview()
    }
}
