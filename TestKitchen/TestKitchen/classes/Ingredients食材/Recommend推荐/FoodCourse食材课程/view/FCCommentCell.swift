//
//  FCCommentCell.swift
//  TestKitchen_1607
//
//  Created by qianfeng on 16/11/4.
//  Copyright © 2016年 gaokunpeng. All rights reserved.
//

import UIKit

class FCCommentCell: UITableViewCell {

    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var descLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    //
    var model:FoodCourseCommentDetail? {
        didSet {
            if model != nil {
                
                //图片
                let url = NSURL(string: (model?.head_img)!)
                userImageView.layer.cornerRadius = 30
                userImageView.layer.masksToBounds = true
                userImageView.kf_setImageWithURL(url!, placeholderImage: UIImage(named: "sdefaultImage"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
                
                //名字
                userNameLabel.text = model?.nick
                
                //评论内容
                descLabel.text = model?.content
                
                //评论时间
                timeLabel.text = model?.create_time
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
