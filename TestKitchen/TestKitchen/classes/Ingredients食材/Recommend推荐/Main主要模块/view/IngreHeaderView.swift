//
//  IngreHeaderView.swift
//  TestKitchen
//
//  Created by qianfeng on 16/10/27.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class IngreHeaderView: UIView {
    
    //点击事件
    var jumpClosure:IngreJumpColsure?
    
    //数据
    var listModel:IngreRecommendWidgetList? {
        didSet {
            configText((listModel?.title)!)
        }
    }
    
    //文字
    private var titleLabel:UILabel?
    
    //图片
    private var imageView:UIImageView?
    
    //图片尺寸
    private var iconW:CGFloat = 32
    
    //左右的间距
    private var space:CGFloat = 40
    
    //文字和图片之间的间距
    private var margin:CGFloat = 20
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(white: 0.8, alpha: 1.0)
        //白色背景
        let bgView = UIView.createView()
        bgView.backgroundColor = UIColor.whiteColor()
        bgView.frame = CGRectMake(0, 10, bounds.size.width, 44)
        addSubview(bgView)
        
        //点击事件
        let g = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        bgView.addGestureRecognizer(g)
        
        //文字
        titleLabel = UILabel.createLabel(nil, textAlignment: .Left, font: UIFont.systemFontOfSize(18))
        bgView.addSubview(titleLabel!)
        
        //图片
        let image = UIImage(named: "more_icon")
        imageView = UIImageView(image: image)
        bgView.addSubview(imageView!)
        
    }
    
    @objc private func tapAction() {
        if jumpClosure != nil && listModel?.title_link != nil {
            jumpClosure!((listModel?.title_link)!)
        }
    }
    
    //显示文字
    private func configText(text:String) {
        //计算文字的宽度
        let str = NSString(string: text)
        /*
         参数1:文字的最大范围
         参数2:文字的显示规范
         参数3:文字的属性
         参数4:上下文
         */
        let maxW = bounds.size.width-space*2-iconW-margin
        let attr = [NSFontAttributeName:UIFont.systemFontOfSize(18)]
        let w = str.boundingRectWithSize(CGSizeMake(maxW, 44), options: .UsesLineFragmentOrigin, attributes: attr, context: nil).size.width
        
        let labelSpaceX = (maxW-w)/2
        
        //设置文字
        titleLabel?.text = text
        //修改位置
        titleLabel?.frame = CGRectMake(space+labelSpaceX, 0, w, 44)
        imageView?.frame = CGRectMake(titleLabel!.frame.origin.x+w+margin, 6, iconW, iconW)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
