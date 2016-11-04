//
//  SubjectCell.swift
//  TestKitchen
//
//  Created by qianfeng on 16/11/4.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class SubjectCell: UITableViewCell {

    //显示数据
    var cellModel:FoodCourseSerial? {
        didSet {
            
            if cellModel != nil {
                showData()
            }
        }
    }
    
    //显示数据
    func showData() {
        
        titleLabel.text = cellModel?.course_name
        descLabel.text = cellModel?.course_subject
    }
    
    //计算cell的高度
    class func heightForSubjectCell(model:FoodCourseSerial) -> CGFloat {
        
        //标题高度
        let h:CGFloat = 10+20+10
        
        let str = NSString(string: model.course_subject!)
        let attr = [NSFontAttributeName:UIFont.systemFontOfSize(17)]
        let subjectH = str.boundingRectWithSize(CGSizeMake(kScreenW-20*2, CGFloat.max), options: .UsesLineFragmentOrigin, attributes: attr, context: nil).size.height
        return h + 10 + subjectH + 10
    }
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
